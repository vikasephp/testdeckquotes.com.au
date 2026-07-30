<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('insurance_manager_type');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['imt_id'];
	unset($detail['imt_id']);
	
    if($this_id > 0){
		unset($detail['imt_id']);
		$tableTask->setWhere("imt_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['imt_id']='';
$detail['imt_type']='';

$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('imt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('insurance_manager_type');
	$tableTask->setWhere("imt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	
