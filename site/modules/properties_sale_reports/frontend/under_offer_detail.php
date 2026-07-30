<?php
$fwMainView = 'file:' . getcwd() . '/under_offer_detail.tpl';
$tableTask = new Fw_Db_Table('properties_sale_reports_under_offer');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['psruo_id'];
	unset($detail['psruo_id']);

    if($this_id > 0)
	{
		unset($detail['psruo_id']);
		$tableTask->setWhere("psruo_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('psruo_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('properties_sale_reports_under_offer');
	$tableTask->setWhere("psruo_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Under Offer Detail';
}
else
{
    $fwViewData['title'] = 'Add Under Offer Detail';
}	
