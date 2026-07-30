<?php
$this_id = (int)$fwRequest->getparam('spra_id', 0);

//$task_id = (int)$fwRequest->getparam('spra_sp_id', 0);

$sql = "SELECT sp_bsn_id, sp_task_name FROM `site_progress_report` where sp_id = ".$this_id;
$data = $fwDb->queryOne($sql);

$bsnID = $data['sp_bsn_id'];
$task_id = $data['sp_task_name'];

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('site_progress_report_attachments');
	$thisTable->setWhere("spra_id = $this_id");
	$thisTable->deleteRow();
	
}

Location(BASE_URL . "site_progress_report.attachments-and-comments/bsn_id/".$bsnID."/task_id/".$task_id);