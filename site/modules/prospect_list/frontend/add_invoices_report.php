<?php
$fwMainView = 'file:' . getcwd() . '/add_invoices_report.tpl';

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$tableTask = new Fw_Db_Table('prospect_list_invoices_report');

$user_id = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {	
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail['plir_id'];
	unset($detail['plir_id']);

    if($this_id > 0){
		unset($detail['plir_id']);
		$tableTask->setWhere("plir_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('plir_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('prospect_list_invoices_report');
	$tableTask->setWhere("plir_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['task_title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['task_title'] = 'Add ' . $MODULE_SINGULAR;
}
