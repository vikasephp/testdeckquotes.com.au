<?php
$fwMainView = 'file:' . getcwd() . '/add_leave.tpl';
$tableTask = new Fw_Db_Table('timesheet_leave');

$fwViewData['tl_id'] = (int)$fwRequest->getParam('tl_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['tl_id'];
	unset($detail['tl_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['tl_id']);
       		 $tableTask->setWhere("tl_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('tl_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('timesheet_leave');
	$tableTask->setWhere("tl_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	