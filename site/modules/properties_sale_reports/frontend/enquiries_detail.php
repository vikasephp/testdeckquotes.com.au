<?php
$fwMainView = 'file:' . getcwd() . '/enquiries_detail.tpl';
$tableTask = new Fw_Db_Table('properties_sale_reports_enquiries');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['psre_id'];
	unset($detail['psre_id']);

    if($this_id > 0)
	{
		unset($detail['psre_id']);
		$tableTask->setWhere("psre_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('psre_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('properties_sale_reports_enquiries');
	$tableTask->setWhere("psre_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Enquiries Detail';
}
else
{
    $fwViewData['title'] = 'Add Enquiries Detail';
}	
