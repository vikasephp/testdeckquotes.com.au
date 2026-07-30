<?php
$fwMainView = 'file:' . getcwd() . '/add_detail.tpl';
$tableTask = new Fw_Db_Table('insurance_manager');

$fwViewData['opr'] =  false;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail['im_id'];
	unset($detail['im_id']);
	
    if($this_id > 0){
		unset($detail['im_id']);
		$tableTask->setWhere("im_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = true;
}

$detail['im_id'] = '';
$fwViewData['detail'] = $detail;

$this_id = (int)$fwRequest->getParam('im_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('insurance_manager');
	$tableTask->setWhere("im_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;

    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add New '.$MODULE_SINGULAR;
}	

$sqlT = "select * from insurance_manager_type";
$fwViewData['typedata'] = $fwDb->query($sqlT);

$sqlT = "select * from insurance_manager_status";
$fwViewData['statusdata'] = $fwDb->query($sqlT);

$sqlT = "select * from contacts where cs_company = 2";
$fwViewData['contactdata'] = $fwDb->query($sqlT);

$sqlT = "select * from contacts";
$fwViewData['brokerdata'] = $fwDb->query($sqlT);