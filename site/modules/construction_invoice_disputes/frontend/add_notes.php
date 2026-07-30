<?php
$fwMainView = 'file:' . getcwd() . '/add_notes.tpl';
$tableTask = new Fw_Db_Table('construction_invoice_disputes_notes');

$cidn_ldd_id = (int)$fwRequest->getParam('cidn_ldd_id', 0);
$fwViewData['cidn_ldd_id'] = $cidn_ldd_id;

$cidn_id = (int)$fwRequest->getParam('cidn_id', 0);
$fwViewData['cidn_id'] = $cidn_id;

$user = $_SESSION['user']['user_name'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['cidn_id'];
	unset($detail['cidn_id']);

	$detail['cidn_added_by'] = $user;
	$detail['cidn_added_date'] = date('d-m-Y');
	$detail['cidn_ldd_id'] = $cidn_ldd_id;

	if ($this_id > 0) {
		unset($detail['cidn_id']);
		$tableTask->setWhere("cidn_id = $this_id");
		$opr = $tableTask->updateRow($detail);
		$wna_wn_id = $this_id;
	} else {
		$opr = $tableTask->insertRow($detail);
		//db($detail);
		$wna_wn_id = $opr;
		
	}
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('cidn_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('construction_invoice_disputes_notes');
	$tableTask->setWhere("cidn_id = $cidn_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Notes';
} else {
	$fwViewData['title'] = 'Add Notes';
}
