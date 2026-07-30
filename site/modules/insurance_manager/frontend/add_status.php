<?php
$fwMainView = 'file:' . getcwd() . '/add_status.tpl';
$tableTask = new Fw_Db_Table('insurance_manager_status');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['ims_id'];
	unset($detail['ims_id']);
	
    if($this_id > 0){
		unset($detail['ims_id']);
		$tableTask->setWhere("ims_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['ims_id']='';
$detail['ims_status']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('ims_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('insurance_manager_status');
	$tableTask->setWhere("ims_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	
