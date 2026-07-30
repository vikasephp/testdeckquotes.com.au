<?php
$fwMainView = 'file:' . getcwd() . '/add_response_sent.tpl';
$tableTask = new Fw_Db_Table('customer_nps_response_sent');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('response', array());
	
	$this_id = (int)$detail['rs_id'];
	unset($detail['rs_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['rs_id']);
       		 $tableTask->setWhere("rs_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('rs_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('customer_nps_response_sent');
	$tableTask->setWhere("rs_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
