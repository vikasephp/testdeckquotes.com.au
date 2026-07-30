<?php
$fwMainView = 'file:' . getcwd() . '/add_plans.tpl';
$tableTask = new Fw_Db_Table('dp_mistak_log_plan');

$fwViewData['dp_id'] = (int)$fwRequest->getParam('dp_id', 0);
$fwViewData['opr'] =  false;
$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['dp_id'];
	unset($detail['dp_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['dp_id']);
       		 $tableTask->setWhere("dp_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = true;	
}

$detail['dp_id']='';
$detail['dp_option']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('dp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('dp_mistak_log_plan');
	$tableTask->setWhere("dp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	