<?php
$fwMainView = 'file:' . getcwd() . '/add_cal_linked.tpl';
$tableTask = new Fw_Db_Table('calendar_linked_admin');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['cl_id'];
	unset($detail['cl_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['cl_id']);
       		 $tableTask->setWhere("cl_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('cl_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('calendar_linked_admin');
	$tableTask->setWhere("cl_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
