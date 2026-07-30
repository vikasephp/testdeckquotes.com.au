<?php
$fwMainView = 'file:' . getcwd() . '/edit_supplyagreementlink.tpl';

$tableTask = new Fw_Db_Table('supplier_report');
$fwViewData['primary_id'] = $primary_id = 'sr_id';

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('sr', '');
	$this_id = (int)$detail['sr_id'];
	
	unset($detail['sr_id']);
	
    if($this_id > 0)
    	{
      		 unset($detail['sr_id']);
       		 $tableTask->setWhere("sr_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
		{
			 $opr = $tableTask->insertRow($detail); 
		}    	
	     $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('sr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('supplier_report');
	$tableTask->setWhere("sr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
