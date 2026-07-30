<?php
$fwMainView = 'file:' . getcwd() . '/add_status_delivery.tpl';
$tableTask = new Fw_Db_Table('quote_tracking_status_delivery');

$fwViewData['qs_id'] = (int)$fwRequest->getParam('qs_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['qs_id'];
	unset($detail['qs_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['qs_id']);
       		 $tableTask->setWhere("qs_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('qs_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('quote_tracking_status_delivery');
	$tableTask->setWhere("qs_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$tableSt = new Fw_Db_Table('quote_tracking_status_delivery');
$fwViewData['stDetail'] = $tableSt->getRows();

