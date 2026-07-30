<?php
$fwMainView = 'file:' . getcwd() . '/add_outcome.tpl';
$tableTask = new Fw_Db_Table('proactive_outcome');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('outcome', array());
	
	$this_id = (int)$detail['oc_id'];
	unset($detail['oc_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['oc_id']);
       		 $tableTask->setWhere("oc_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('oc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('proactive_outcome');
	$tableTask->setWhere("oc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
