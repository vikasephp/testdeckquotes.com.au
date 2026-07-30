<?php
$fwMainView = 'file:' . getcwd() . '/edit_datacome.tpl';

$tableTask = new Fw_Db_Table('critical_numbers');
$fwViewData['primary_id'] = $primary_id = 'cn_id';

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('measurment', []);
	$this_id = (int)$detail['cn_id'];
	
	unset($detail['cn_id']);
	
    if($this_id > 0)
    {
    	unset($detail['cn_id']);
    	$tableTask->setWhere("cn_id = $this_id");
	   	$opr = $tableTask->updateRow($detail);   
    }
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('cn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('critical_numbers');
	$tableTask->setWhere("cn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	
