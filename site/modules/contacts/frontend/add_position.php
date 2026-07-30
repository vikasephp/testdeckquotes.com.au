<?php
$fwMainView = 'file:' . getcwd() . '/add_position.tpl';
$tableTask = new Fw_Db_Table('contacts_position');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['cp_id'];
	unset($detail['cp_id']);

    if($this_id > 0)
	{
		unset($detail['cp_id']);
		$tableTask->setWhere("cp_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('cp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('contacts_position');
	$tableTask->setWhere("cp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit ';
}
else
{
    $fwViewData['title'] = 'Add New ';
}	
