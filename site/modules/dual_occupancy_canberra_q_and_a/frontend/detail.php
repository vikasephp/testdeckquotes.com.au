<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	if($detail['docqa_fact_sheets']) {
		$sheets= implode("|", $detail['docqa_fact_sheets']);
	}
	$detail['docqa_fact_sheets'] = "|".$sheets."|";
	
	if($detail['docqa_on_website']) {  $detail['docqa_on_website'] = 1; } else {  $detail['docqa_on_website'] = 0; }
	if($detail['docqa_qed']) {  $detail['docqa_qed'] = 1; } else {  $detail['docqa_qed'] = 0; }
	
	$this_id = (int)$detail[$ID];

	$detail['docqa_answer'] = stripslashes($detail['docqa_answer']);
	$detail['docqa_question'] = stripslashes($detail['docqa_question']);

	unset($detail[$ID]);
	$detail['docqa_uid'] = $_SESSION['user']['user_id'];
	$detail['docqa_last_updated'] = date('d/m/Y');
	
	if($_FILES['docs']['name'])
	{
		$docfile_1 = $_FILES['docs']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['docs']['tmp_name'];
		$detail['docqa_attachment'] = $docfile_1;
		upload($docfile_1, $temp_name_1);						
	}
	
	if($_FILES['graphic']['name'])
	{
		$docfile_3 = $_FILES['graphic']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['graphic']['tmp_name'];
		$detail['docqa_graphic'] = $docfile_3;
		upload_graphic($docfile_3, $temp_name_3);						
	}
	
	if($_FILES['img']['name'])
	{
			
		$docfile_2 = $_FILES['img']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['img']['tmp_name'];
		$detail['docqa_image'] = $docfile_2;
		upload($docfile_2, $temp_name_2);						
	}

    if($this_id > 0)
	{
		$quesans_id = $this_id;
		$tableqa->setWhere("$ID = $this_id");
		
		$oldDetail = $tableqa->getRow();

		if (trim($oldDetail['docqa_question']) != trim($detail['docqa_question'])) {
			$detail['docqa_question_updated_by'] = $_SESSION['user']['user_name'];
			$detail['docqa_question_updated_at'] = date('d-m-Y'); 
			
			$tableqhis = new Fw_Db_Table('dual_occupancy_canberra_question_history');
			$detail_history['docqh_docqa_id'] = $this_id;
			$detail_history['docqh_question'] = $detail['docqa_question'];
			$detail_history['docqh_question_updated_by'] = $_SESSION['user']['user_name'];
			$tableqhis->insertRow($detail_history);
		}

		if (trim($oldDetail['docqa_answer']) != trim($detail['docqa_answer'])) {
			$detail['docqa_answer_updated_by'] = $_SESSION['user']['user_name'];
			$detail['docqa_answer_updated_at'] = date('d-m-Y');
			
			$tableahis = new Fw_Db_Table('dual_occupancy_canberra_answer_history');
			$detail_ans_history['docah_docqa_id'] = $this_id;
			$detail_ans_history['docah_answer'] = $detail['docqa_answer'];
			$detail_ans_history['docah_answer_updated_by'] = $_SESSION['user']['user_name'];
			$tableahis->insertRow($detail_ans_history);
		}
		
		$tableusers = new Fw_Db_Table('users');
		$tableusers->setWhere("user_id = $user_id");
		$usrdetail = $tableusers->getRow();
		$detail['docqa_last_updated_by'] = $usrdetail['user_name'];
		$opr = $tableqa->updateRow($detail); 
		
		//Code for Webhook that will trigger when the record is updated
		$sqlwh = "SELECT docqa_id, docqa_slug, docqa_public_rank, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_question, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_question, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(docqa_answer, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS docqa_answer, docqa_approved, docqa_short_answer, docqa_key_points, docqa_detail_explanation, docqa_graphic FROM dual_occupancy_canberra_qanda WHERE docqa_approved = 1 and docqa_id = " . intval($quesans_id);

		$qawh = $fwDb->queryOne($sqlwh);

		if (!empty($qawh)) {
			
			if (!empty($qawh['docqa_graphic'])){
				$graphic_media = $qawh['docqa_graphic'];
				$graphic_folder_path = 'files/dual_occupancy_qa_graphic/';
				$graphic = showUrl($graphic_folder_path, $graphic_media);
			} else {
				$graphic = '';
			}

			$payload = array(
				"docqa_id" => 'QAIDDO'.$qawh['docqa_id'],
				"docqa_slug" => $qawh['docqa_slug'],
				"docqa_public_rank" => $qawh['docqa_public_rank'],
				"docqa_question" => $qawh['docqa_question'],
				"docqa_answer"   => $qawh['docqa_answer'],
				"docqa_reviewed_at" => date("Y-m-d H:i:s"),
				"docqa_short_answer" => $qawh['docqa_short_answer'],
				"docqa_key_points" => $qawh['docqa_key_points'],
				"docqa_detail_explanation" => $qawh['docqa_detail_explanation'],
				"docqa_graphic" => $graphic,
				"docqa_status" 	 => "approved",
				"docqa_action"   => "update"
			);

			$jsonPayload = json_encode($payload);

			if ($jsonPayload === false) {
				error_log('Webhook JSON Error: ' . json_last_error_msg());
			} else {

				$ch = curl_init();

				curl_setopt_array($ch, array(
					CURLOPT_URL => "https://dualoccupancycanberra.com.au/wp-json/doc_questions/v1/webhook",
					CURLOPT_POST => true,
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_TIMEOUT => 10,
					CURLOPT_HTTPHEADER => array(
						"Content-Type: application/json",
						"Accept: application/json"
					),
					CURLOPT_POSTFIELDS => $jsonPayload
				));

				$response = curl_exec($ch);
				$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

				if (curl_errno($ch)) {
					error_log('Webhook cURL Error: ' . curl_error($ch));
				} else {
					error_log("Webhook HTTP {$httpCode}: " . $response);
				}

				curl_close($ch);
			}
		}
	}
	else
	{

		if (!empty(trim($detail['docqa_question']))) {
			$detail['docqa_question_updated_by'] = $_SESSION['user']['user_name'];
			$detail['docqa_question_updated_at'] = date('d-m-Y');
		}
		
		if (!empty(trim($detail['docqa_answer']))) {
			$detail['docqa_answer_updated_by'] = $_SESSION['user']['user_name'];
			$detail['docqa_answer_updated_at'] = date('d-m-Y');
		}
		$opr = $tableqa->insertRow($detail); 
		
		$docqaId = $opr;
		if (!empty(trim($detail['docqa_question']))) {

			$tableqhis = new Fw_Db_Table('dual_occupancy_canberra_question_history');

			$detail_history['docqh_docqa_id'] = $docqaId;
			$detail_history['docqh_question'] = $detail['docqa_question'];
			$detail_history['docqh_question_updated_by'] = $_SESSION['user']['user_name'];

			$tableqhis->insertRow($detail_history);
		}

		if (!empty(trim($detail['docqa_answer']))) {

			$tableahis = new Fw_Db_Table('dual_occupancy_canberra_answer_history');

			$detail_ans_history['docah_docqa_id'] = $docqaId;
			$detail_ans_history['docah_answer'] = $detail['docqa_answer'];
			$detail_ans_history['docah_answer_updated_by'] = $_SESSION['user']['user_name'];

			$tableahis->insertRow($detail_ans_history);
		}
	}    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	$detail['docqa_fact_sheets'] = explode("|",$detail['docqa_fact_sheets']);
	
	$folder_path = "files/dual_occupancy_qa/" ; 
	$object_name = $detail["docqa_image"];
    $detail['docqa_image_raw_data'] = get_file_raw_data($folder_path,$object_name);
    
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

$tableusers = new Fw_Db_Table('users');
$tableusers->setWhere("user_id = $user_id");
$usrdetail = $tableusers->getRow();
$fwViewData['username'] = $usrdetail['user_name'];

$tableStream = new Fw_Db_Table('que_ans_stream');
$fwViewData['streamdetail'] = $tableStream->getRows();

$tabledoc = new Fw_Db_Table('fact_sheet_doc');
$tabledoc->setOrderBy('doc_id'.' ASC');
$fwViewData['document_list']=$tabledoc->getAllRows();

//echo "<pre>"; print_r($fwViewData['detail']);    
    
	