<?php
$fwMainView = 'file:' . getcwd() . '/add_detail.tpl';
$tableTask = new Fw_Db_Table('planning_defination_database');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail['pdd_id'];
	unset($detail['pdd_id']);
	
	if (!empty($_FILES[$TABLE]['name']['pdd_icon'])) {		
		$file = $_FILES[$TABLE];
		$docfile_1 = $file['name']['pdd_icon'];
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $file['tmp_name']['pdd_icon'];

		$fileUploaded = upload($docfile_1, $temp_name_1);
		$detail['pdd_icon'] = $docfile_1;
	}
	
	if (!empty($_FILES[$TABLE]['name']['pdd_image'])) {		
		$file = $_FILES[$TABLE];
		$docfile_2 = $file['name']['pdd_image'];
		$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);

		$temp_name_2 = $file['tmp_name']['pdd_image'];

		$fileUploaded = upload($docfile_2, $temp_name_2);
		$detail['pdd_image'] = $docfile_2;
	}
	
	$detail['pdd_last_updated'] = date('d-m-Y');
	
    if($this_id > 0){
		unset($detail['pdd_id']);
		$tableTask->setWhere("pdd_id = $this_id");
		
		$oldDetail = $tableTask->getRow();

		if ($oldDetail['pdd_defination'] != $detail['pdd_defination'] || $oldDetail['pdd_meaning'] != $detail['pdd_meaning'] || $oldDetail['pdd_plain_english'] != $detail['pdd_plain_english'] ) {
			$detail['pdd_qaed_approval_1'] = 0;
			$detail['pdd_qaed_approval_2'] = 0;

			$detail['pdd_qaed_approval_1_by'] = 0;
			$detail['pdd_qaed_approval_2_by'] = 0;

			$detail['pdd_qaed_approval_1_at'] = '';
			$detail['pdd_qaed_approval_2_at'] = '';
		}
		$opr = $tableTask->updateRow($detail);
		
		//Code for Webhook that will trigger when the Planning Definitions is synced/unsynced
		$sqlpd = "SELECT pdd_id, pdd_defination, pdd_source, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(pdd_meaning, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS pdd_meaning, TRIM( REPLACE( REPLACE( REPLACE( REGEXP_REPLACE(pdd_plain_english, '<[^>]*>', ''), '&nbsp;', ' ' ), CHAR(13), '' ), CHAR(10), '' ) ) AS pdd_plain_english, pdd_sync, pdd_icon, pdd_image, pdd_image_description, pdd_image_note FROM planning_defination_database WHERE pdd_sync = 1 and pdd_id = " . intval($this_id);

		$pdwh = $fwDb->queryOne($sqlpd);

		if (!empty($pdwh)) {
			
			$media_folder_path = 'files/planning_definations_database/';
			if (!empty($pdwh['pdd_icon'])){
				$media_icon = $pdwh['pdd_icon'];
				$icon = showUrl($media_folder_path, $media_icon);
			} else {
				$icon = '';
			}
			
			if (!empty($pdwh['pdd_image'])){
				$media_image = $pdwh['pdd_image'];
				$image = showUrl($media_folder_path, $media_image);
			} else {
				$image = '';
			}

			$payload = array(
				"pdd_id" => $pdwh['pdd_id'],
				"pdd_defination" => $pdwh['pdd_defination'],
				"pdd_source" => $pdwh['pdd_source'],
				"pdd_meaning" => $pdwh['pdd_meaning'],
				"pdd_plain_english" => $pdwh['pdd_plain_english'],
				"pdd_reviewed_at" => date("Y-m-d H:i:s"),
				"pdd_icon" => $icon,
				"pdd_image" => $image,
				"pdd_image_description" => $pdwh['pdd_image_description'],
				"pdd_image_note" => $pdwh['pdd_image_note'],
				"pdd_status" => "approved",
				"pdd_action" => "update"
			);

			$jsonPayload = json_encode($payload);

			if ($jsonPayload === false) {
				error_log('Webhook JSON Error: ' . json_last_error_msg());
			} else {

				$ch = curl_init();

				curl_setopt_array($ch, array(
					CURLOPT_URL => "https://dualoccupancycanberra.com.au/wp-json/doc_definition/v1/webhook",
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
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['pdd_id'] = '';
$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('pdd_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('planning_defination_database');
	$tableTask->setWhere("pdd_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;

    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

//$sqlT = "select * from insurance_manager_type";
//$fwViewData['typedata'] = $fwDb->query($sqlT);
