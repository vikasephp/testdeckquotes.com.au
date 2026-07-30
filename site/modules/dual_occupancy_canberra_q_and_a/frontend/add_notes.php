<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('dual_occupancy_notes');

$docqa_id = (int)$fwRequest->getParam('docqa_id', 0);
$fwViewData['docqa_id'] = $docqa_id;

$user = $_SESSION['user']['user_id'];
$dt = date('d-m-Y');

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['doc_id'];
	unset($detail['doc_id']);

	$detail['doc_docqa_id'] = $docqa_id;
	$detail['doc_created_by'] = $user;
	$detail['doc_created_at'] = $dt;

	if ($this_id > 0) {
		unset($detail['doc_id']);
		$tableTask->setWhere("doc_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('doc_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('dual_occupancy_notes');
	$tableTask->setWhere("doc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Notes';
} else {
	$fwViewData['title'] = 'Add Notes';
}
