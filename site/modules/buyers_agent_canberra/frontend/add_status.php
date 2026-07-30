<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableTask = new Fw_Db_Table('buyers_agent_canberra_status');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['bacs_id'];
	unset($detail['bacs_id']);
	
    if($this_id > 0){
		unset($detail['bacs_id']);
		$tableTask->setWhere("bacs_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['bacs_id']='';
$detail['bacs_option']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('bacs_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('buyers_agent_canberra_status');
	$tableTask->setWhere("bacs_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	
