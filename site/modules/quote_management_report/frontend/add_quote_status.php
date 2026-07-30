<?php
$fwMainView = 'file:' . getcwd() . '/add_quote_status.tpl';
$tableTask = new Fw_Db_Table('quote_management_report_status');

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
	$detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['qmrs_id'];
	unset($detail['qmrs_id']);
	
    if($this_id > 0){             
		unset($detail['qmrs_id']);
		$tableTask->setWhere("qmrs_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
    } else{
		$opr = $tableTask->insertRow($detail); 
	}    	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('qmrs_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_management_report_status');
	$tableTask->setWhere("qmrs_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ';
}
else
{
    $fwViewData['title'] = 'Add ';
}	
