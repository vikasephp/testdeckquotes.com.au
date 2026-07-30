<?php
$fwMainView = 'file:' . getcwd() . '/add_detail.tpl';
$tableTask = new Fw_Db_Table('buyers_agent_canberra');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['bac_id'];
	unset($detail['bac_id']);
	
    if($this_id > 0){
		unset($detail['bac_id']);
		$tableTask->setWhere("bac_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['bac_id'] = '';
$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('bac_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('buyers_agent_canberra');
	$tableTask->setWhere("bac_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	
