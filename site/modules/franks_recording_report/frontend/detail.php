<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];
  
	unset($detail[$ID]);
	
	$oldDetail = array();

	if ($this_id > 0) {
		$tableqa->setWhere("$ID = $this_id");
		$oldDetail = $tableqa->getRow();
	}
	
	if ($this_id == 0 ||(!empty($detail['fr_recording_link']) && $detail['fr_recording_link'] != $oldDetail['fr_recording_link'])) {
		$detail['fr_upload_date'] = date('d-m-Y');
		$detail['fr_upload_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 || (!empty($detail['fr_transcript_link']) && $detail['fr_transcript_link'] != $oldDetail['fr_transcript_link'])) {
		$detail['fr_upload_date'] = date('d-m-Y');
		$detail['fr_upload_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 ||(!empty($detail['fr_transcript_file']) && $detail['fr_transcript_file'] != $oldDetail['fr_transcript_file'])) {
		$detail['fr_upload_date'] = date('d-m-Y');
		$detail['fr_upload_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 ||(!empty($detail['fr_meeting_minutes']) && $detail['fr_meeting_minutes'] != $oldDetail['fr_meeting_minutes'])) {
		$detail['fr_upload_date'] = date('d-m-Y');
		$detail['fr_upload_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 || (!empty($detail['fr_smtm_chatgpt']) &&	$detail['fr_smtm_chatgpt'] != $oldDetail['fr_smtm_chatgpt'])) {
		$detail['fr_smtm_date'] = date('d-m-Y');
		$detail['fr_smtm_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 || (!empty($detail['fr_ss_chatgpt']) && $detail['fr_ss_chatgpt'] != $oldDetail['fr_ss_chatgpt'])) {
		$detail['fr_ss_date'] = date('d-m-Y');
		$detail['fr_ss_user'] = $_SESSION['user']['user_name'];
	}

	if ($this_id == 0 ||(!empty($detail['fr_actionAItranscript']) && $detail['fr_actionAItranscript'] != $oldDetail['fr_actionAItranscript'])) {
		$detail['fr_actionAItranscript_by'] = $_SESSION['user']['user_name'];
		$detail['fr_actionAItranscript_at'] = date('d-m-Y');
	}
	
	if($_FILES['transcript']['name'])
		{
			$docfile_1 = $_FILES['transcript']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['transcript']['tmp_name'];
			$detail['fr_transcript_file'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
		}
		
	/*if($_FILES['actionAItranscript']['name'])
		{
			$docfile_3 = $_FILES['actionAItranscript']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['actionAItranscript']['tmp_name'];
			$detail['fr_actionAItranscript'] = $docfile_3;
			$detail['fr_actionAItranscript_by'] = $_SESSION['user']['user_name'];
			$detail['fr_actionAItranscript_at'] = date('d-m-Y');
			upload($docfile_3, $temp_name_3);
		}*/
		
	if (!empty($detail['fr_actionAItranscript'])) {
		$detail['fr_actionAItranscript_by'] = $_SESSION['user']['user_name'];
		$detail['fr_actionAItranscript_at'] = date('d-m-Y');
	}
		
		
	if($_FILES['meetingminutes']['name'])
	{
		$docfile_1 = $_FILES['meetingminutes']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['meetingminutes']['tmp_name'];
		$detail['fr_meeting_minutes'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
	}	


	if($this_id > 0)
	{
		$tableqa->setWhere("$ID = $this_id");
		$opr = $tableqa->updateRow($detail);
	}
	else
	{	
		$opr = $tableqa->insertRow($detail); 
	}    	
    
    $fwViewData['opr'] = $opr;
		
	//Location(BASE_URL . $XFA['home']);
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0)
{
	
	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
    $detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;	
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}

$sql = "SELECT  bsn_id, bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);


$sqlpr = "Select * from quote_builder_component";
$fwViewData['cdetail'] = $fwDb->query($sqlpr); 

	