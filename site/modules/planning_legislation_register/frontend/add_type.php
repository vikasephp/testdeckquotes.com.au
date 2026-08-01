<?php
$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$tableTask = new Fw_Db_Table('planning_legislation_doctype');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['pd_id'];
	unset($detail['pd_id']);
	
    if($this_id > 0){
		unset($detail['pd_id']);
		$tableTask->setWhere("pd_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}



$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('pd_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('planning_legislation_doctype');
	$tableTask->setWhere("pd_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	
