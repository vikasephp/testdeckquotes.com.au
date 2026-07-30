<?php
$fwMainView = 'file:' . getcwd() . '/add_method.tpl';
$tableTask = new Fw_Db_Table('suspense_account_method');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['sm_id'];
	unset($detail['sm_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['sm_id']);
       		 $tableTask->setWhere("sm_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		    $opr = $tableTask->insertRow($detail); 
	}    	
	        $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('sm_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('suspense_account_method');
	$tableTask->setWhere("sm_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	