<?php
$fwMainView = 'file:' . getcwd() . '/add_onboarding_procedure.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$tableTask = new Fw_Db_Table('onboarding_standard_procedure');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['osp_id'];
	unset($detail['osp_id']);
	
    if($this_id > 0)
    	{
      		unset($detail['osp_id']);
       		$tableTask->setWhere("osp_id = $this_id");
	     	$opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('osp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('onboarding_standard_procedure');
	$tableTask->setWhere("osp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['op_title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['op_title'] = 'Add '.$MODULE_SINGULAR;
}	
