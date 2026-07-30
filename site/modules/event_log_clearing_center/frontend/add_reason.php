<?php
$fwMainView = 'file:' . getcwd() . '/add_reason.tpl';
$tableTask = new Fw_Db_Table('event_log_clearing_center_notes');

$elccn_row_id = (int)$fwRequest->getParam('elccn_row_id', 0);
$fwViewData['elccn_row_id'] = $elccn_row_id;

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['elccn_id'];
	unset($detail['elccn_id']);

	$detail['elccn_row_id'] = $elccn_row_id;
	$detail['elccn_created_by'] = $user;

	if ($this_id > 0) {
		unset($detail['elccn_id']);
		$tableTask->setWhere("elccn_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('elccn_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('event_log_clearing_center_notes');
	$tableTask->setWhere("elccn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Reason Notes';
} else {
	$fwViewData['title'] = 'Add Reason Notes';
}
