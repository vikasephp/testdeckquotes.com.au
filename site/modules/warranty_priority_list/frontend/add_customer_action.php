<?php
$fwMainView = 'file:' . getcwd() . '/add_customer_action.tpl';
$tableTask = new Fw_Db_Table('warranty_log_customer_action');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['wlca_id'];
	unset($detail['wlca_id']);

    if($this_id > 0)
	{
		unset($detail['wlca_id']);
		$tableTask->setWhere("wlca_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('wlca_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_customer_action');
	$tableTask->setWhere("wlca_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Customer Action';
}
else
{
    $fwViewData['title'] = 'Add Customer Action';
}	
