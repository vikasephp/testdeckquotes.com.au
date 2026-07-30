<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	
	if($detail['qa_fact_sheets']) {
	$sheets= implode("|", $detail['qa_fact_sheets']);
	}
	$detail['qa_fact_sheets'] = "|".$sheets."|";
	
	if($detail['qa_on_wesite']) {  $detail['qa_on_wesite'] = 1; } else {  $detail['qa_on_wesite'] = 0; }
	if($detail['qa_qed']) {  $detail['qa_qed'] = 1; } else {  $detail['qa_qed'] = 0; }
	
	$this_id = (int)$detail[$ID];

	$detail['qa_answer'] = stripslashes($detail['qa_answer']);
	$detail['qa_question'] = stripslashes($detail['qa_question']);

	unset($detail[$ID]);
	$detail['qa_uid'] = $_SESSION['user']['user_id'];
	$detail['qa_last_updated'] = date('d/m/Y');
	
		if($_FILES['docs']['name'])
		{
				$docfile_1 = $_FILES['docs']['name'];
				$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
				$temp_name_1 = $_FILES['docs']['tmp_name'];
				$detail['qa_attachment'] = $docfile_1;
				upload($docfile_1, $temp_name_1);						
		}
		
		if($_FILES['img']['name'])
		{
				
				$docfile_2 = $_FILES['img']['name'];
				$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
				$temp_name_2 = $_FILES['img']['tmp_name'];
				$detail['qa_image'] = $docfile_2;
				upload($docfile_2, $temp_name_2);						
		}
				
		
    if($this_id > 0)
    	{
        $tableqa->setWhere("$ID = $this_id");
		
		$tableusers = new Fw_Db_Table('users');
		$tableusers->setWhere("user_id = $user_id");
		$usrdetail = $tableusers->getRow();
		$detail['qa_last_updated_by'] = $usrdetail['user_name'];
        $opr = $tableqa->updateRow($detail);   
    	}
		else
		{
			 $opr = $tableqa->insertRow($detail); 
		}    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	$detail['qa_fact_sheets'] = explode("|",$detail['qa_fact_sheets']);
	
	$folder_path = "files/question_answer_doc/" ; $object_name = $detail["qa_image"];
    $detail['qa_image_raw_data'] = get_file_raw_data($folder_path,$object_name);
    
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
    
	