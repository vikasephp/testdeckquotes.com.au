<?php
$fwMainView = 'file:' . getcwd() . '/add_result.tpl';
$tableTask = new Fw_Db_Table('debt_recovery_call_result');

$fwViewData['cr_id'] = (int)$fwRequest->getParam('cr_id', 0);

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['cr_id'];
	unset($detail['cr_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['cr_id']);
       		 $tableTask->setWhere("cr_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('cr_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('debt_recovery_call_result');
	$tableTask->setWhere("cr_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	