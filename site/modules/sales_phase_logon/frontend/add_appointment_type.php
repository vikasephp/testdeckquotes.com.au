<?php
$fwMainView = 'file:' . getcwd() . '/add_appointment_type.tpl';
$tableTask = new Fw_Db_Table('sales_phase_logon_appointment_type');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['splat_id'];
	unset($detail['splat_id']);

    if($this_id > 0)
	{
		unset($detail['splat_id']);
		$tableTask->setWhere("splat_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('splat_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('sales_phase_logon_appointment_type');
	$tableTask->setWhere("splat_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Appointment Type';
}
else
{
    $fwViewData['title'] = 'Add Appointment Type';
}	
