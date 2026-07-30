<?php
$fwMainView = 'file:' . getcwd() . '/add_approver.tpl';
$tableTask = new Fw_Db_Table('poincc2_invoice_approver');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['ip_id'];
	unset($detail['ip_id']);
	
    if($this_id > 0)
    	{
      		unset($detail['ip_id']);
       		$tableTask->setWhere("ip_id = $this_id");
	     	$opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('ip_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('poincc2_invoice_approver');
	$tableTask->setWhere("ip_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ';
}
else
{
    $fwViewData['title'] = 'Add ';
}	
