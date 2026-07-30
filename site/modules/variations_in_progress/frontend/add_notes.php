<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('variations_in_progress_notes');

$vipn_va_id = (int)$fwRequest->getParam('vipn_va_id', 0);
$fwViewData['vipn_va_id'] = $vipn_va_id;

$vipn_id = (int)$fwRequest->getParam('vipn_id', 0);
$fwViewData['vipn_id'] = $vipn_id;

$user = $_SESSION['user']['user_name'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['vipn_id'];
	unset($detail['vipn_id']);

	$detail['vipn_added_by'] = $user;
	$detail['vipn_added_date'] = date('d-m-Y H:i:s');
	$detail['vipn_va_id'] = $vipn_va_id;

	if ($this_id > 0) {
		unset($detail['vipn_id']);
		$tableTask->setWhere("vipn_id = $this_id");
		$opr = $tableTask->updateRow($detail);
		$wna_wn_id = $this_id;
	} else {
		$opr = $tableTask->insertRow($detail);
		//db($detail);
		$wna_wn_id = $opr;
		
	}
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('vipn_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('variations_in_progress_notes');
	$tableTask->setWhere("vipn_id = $vipn_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Notes';
} else {
	$fwViewData['title'] = 'Add Notes';
}
