<?php
$fwMainView = 'file:' . getcwd() . '/add_checklist.tpl';
$tableTask = new Fw_Db_Table('design_tracker_checklist');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['dtc_id'];
	unset($detail['dtc_id']);

	if($this_id > 0) {
		unset($detail['dtc_id']);
		$tableTask->setWhere("dtc_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('dtc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('design_tracker_checklist');
	$tableTask->setWhere("dtc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Checklist';
}
else
{
    $fwViewData['title'] = 'Add Checklist';
}	
