<?php
$fwMainView = 'file:' . getcwd() . '/edit_attachment_comment.tpl';
$tableTask = new Fw_Db_Table('site_progress_report_attachments');

$spra_sp_id = (int)$fwRequest->getparam('spra_sp_id', 0);

$sql = "SELECT sp_bsn_id, sp_task_name FROM `site_progress_report` where sp_id = ".$spra_sp_id;
$data = $fwDb->queryOne($sql);

$bsnID = $data['sp_bsn_id'];
$task_id = $data['sp_task_name'];

$fwViewData['bsnID'] = $bsnID;
$fwViewData['task_id'] = $task_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('detail', array());
	$this_id = (int)$detail['spra_id'];
	unset($detail['spra_id']);
	
	if (!empty($_FILES['site_progress_report']['name']['spra_attachment'])) {		
		$file = $_FILES['site_progress_report'];
		$docfile_1 = $file['name']['spra_attachment'];
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $file['tmp_name']['spra_attachment'];

		$fileUploaded = upload($docfile_1, $temp_name_1);
		$detail['spra_attachment'] = $docfile_1;
	}
	
    if($this_id > 0)
    	{
      		unset($detail['spra_id']);
       		$tableTask->setWhere("spra_id = $this_id");
	     	$opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getparam('spra_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('site_progress_report_attachments');
	$tableTask->setWhere("spra_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ';
}
else
{
    $fwViewData['title'] = 'Add New ';
}	
