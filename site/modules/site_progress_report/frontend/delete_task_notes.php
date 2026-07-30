<?php
$this_id = (int)$fwRequest->getparam('sprtn_id', 0);
$tn_id = (int)$fwRequest->getparam('tn_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('site_progress_report_task_notes');
	$thisTable->setWhere("sprtn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "site_progress_report.view_task_notes/tn_id/" . $tn_id);
