<?php
$fwMainView = 'file:' . getcwd() . '/add_task_notes.tpl';
$tableTask = new Fw_Db_Table('site_progress_report_task_notes');

$tn_id = (int)$fwRequest->getParam('tn_id', 0);
$fwViewData['tn_id'] = $tn_id;

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['sprtn_id'];
	unset($detail['sprtn_id']);

	$detail['sprtn_tn_id'] = $tn_id;
	$detail['sprtn_created_by'] = $user;

	if ($this_id > 0) {
		unset($detail['sprtn_id']);
		$tableTask->setWhere("sprtn_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('sprtn_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('site_progress_report_task_notes');
	$tableTask->setWhere("sprtn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Task Notes';
} else {
	$fwViewData['title'] = 'Add Task Notes';
}
