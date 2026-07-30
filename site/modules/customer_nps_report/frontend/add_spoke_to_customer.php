<?php
$fwMainView = 'file:' . getcwd() . '/add_spoke_to_customer.tpl';
$tableTask = new Fw_Db_Table('customer_nps_spoke_cust');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('spoke', array());
	
	$this_id = (int)$detail['sc_id'];
	unset($detail['sc_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['sc_id']);
       		 $tableTask->setWhere("sc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('sc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('customer_nps_spoke_cust');
	$tableTask->setWhere("sc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
