<?php
$fwMainView = 'file:' . getcwd() . '/add_priority.tpl';
$tableTask = new Fw_Db_Table('mistake_log_priority');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	
	$this_id = (int)$detail['mp_id'];
	unset($detail['mp_id']);
	
	
    if($this_id > 0)
    	{
             
      		 unset($detail['mp_id']);
       		 $tableTask->setWhere("mp_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
		
	
}

$this_id = (int)$fwRequest->getParam('mp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('mistake_log_priority');
	$tableTask->setWhere("mp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
