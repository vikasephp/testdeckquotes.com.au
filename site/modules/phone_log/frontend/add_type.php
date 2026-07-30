<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('phone_log_call_types');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['ct_id'];
	unset($detail['ct_id']);
	
	
    if($this_id > 0)
    	{
      		 unset($detail['ct_id']);
       		 $tableTask->setWhere("ct_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('ct_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('phone_log_call_types');
	$tableTask->setWhere("ct_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
