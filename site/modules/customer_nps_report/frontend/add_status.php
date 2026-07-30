<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableTask = new Fw_Db_Table('customer_nps_status_admin');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('status', array());
	
	$this_id = (int)$detail['cs_id'];
	unset($detail['cs_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['cs_id']);
       		 $tableTask->setWhere("cs_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('cs_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('customer_nps_status_admin');
	$tableTask->setWhere("cs_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
