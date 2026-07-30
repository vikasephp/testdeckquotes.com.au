<?php
$fwMainView = 'file:' . getcwd() . '/add_detail_invoice.tpl';
$tableTask = new Fw_Db_Table('properties_sale_reports_invoices');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['psri_id'];
	unset($detail['psri_id']);

    if($this_id > 0)
	{
		unset($detail['psri_id']);
		$tableTask->setWhere("psri_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('psri_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('properties_sale_reports_invoices');
	$tableTask->setWhere("psri_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Invoice Details';
}
else
{
    $fwViewData['title'] = 'Add Invoice Details';
}	
