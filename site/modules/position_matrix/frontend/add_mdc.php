<?php
$fwMainView = 'file:' . getcwd() . '/add_mdc.tpl';

$tableTask = new Fw_Db_Table("position_matrix_multiple_docs");
$pm_id = $fwRequest->getParam('pm_id', '');
$fwViewData['pm_id'] = $pm_id;

$pmmd_id = $fwRequest->getParam('pmmd_id', '');
$fwViewData['pmmd_id'] = $pmmd_id;

$primary_id = 'pmmd_id';

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

$this_id = (int)$fwRequest->getParam('pmmd_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table("position_matrix_multiple_docs");
	$tableTask->setWhere("pmmd_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ';
} else {
	$fwViewData['title'] = 'Add New Content';
}
