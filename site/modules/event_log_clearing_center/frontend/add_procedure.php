<?php
$fwMainView = 'file:' . getcwd() . '/add_procedure.tpl';
$tableTask = new Fw_Db_Table($PPTABLE);
$user_id = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail[$PPID];
	unset($detail[$PPID]);
	if ($this_id > 0) {
		unset($detail[$PPID]);
		$tableTask->setWhere("$PPID = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($PPID, 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table($PPTABLE);
	$tableTask->setWhere("$PPID = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add New ' . $MODULE_SINGULAR;
}
