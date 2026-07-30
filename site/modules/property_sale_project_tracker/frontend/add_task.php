<?php
$fwMainView = 'file:' . getcwd() . '/add_task.tpl';
$tableTask = new Fw_Db_Table('property_sale_task_master');

$st_id  = (int)$fwRequest->getParam('st_id', 0);
$fwViewData['st_id'] = $st_id;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
    //db($detail);
    //exit;
	
	$this_id = (int)$detail['tm_id'];
	unset($detail['tm_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['tm_id']);
       		 $tableTask->setWhere("tm_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('tm_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('property_sale_task_master');
	$tableTask->setWhere("tm_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	