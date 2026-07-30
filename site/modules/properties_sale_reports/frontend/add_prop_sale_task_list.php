<?php
$fwMainView = 'file:' . getcwd() . '/' . $ATTRIBUTES['prop_sale_task_list']['add_file'];

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['prop_sale_task_list']['id'];
$tableTask = new Fw_Db_Table($ATTRIBUTES['prop_sale_task_list']['table']);

$user_id = $_SESSION['user']['user_id'];
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
$this_id = (int)$fwRequest->getParam($primary_id, 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table($ATTRIBUTES['prop_sale_task_list']['table']);
	$tableTask->setWhere("$primary_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['task_title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['task_title'] = 'Add ' . $MODULE_SINGULAR;
}
