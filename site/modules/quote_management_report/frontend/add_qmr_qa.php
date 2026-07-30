<?php
$fwMainView = 'file:' . getcwd() . '/add_qmr_qa.tpl';

$tableTask = new Fw_Db_Table("quote_management_report_qa");
$qm_id = $fwRequest->getParam('qm_id', '');
$fwViewData['qm_id'] = $qm_id;

$qmr_qa_id = $fwRequest->getParam('qmr_qa_id', '');
$fwViewData['qmr_qa_id'] = $qmr_qa_id;

$primary_id = 'qmr_qa_id';

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail[$primary_id];
	unset($detail[$primary_id]);
	
	if ($this_id > 0) {
		unset($detail[$primary_id]);
		$tableTask->setWhere("$primary_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

//Check for Edit Module
$this_id = (int)$fwRequest->getParam('qmr_qa_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table("quote_management_report_qa");
	$tableTask->setWhere("qmr_qa_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Q/A';
} else {
	$fwViewData['title'] = 'Add Q/A';
}
