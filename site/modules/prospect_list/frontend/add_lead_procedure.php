<?php
$fwMainView = 'file:' . getcwd() . '/add_lead_procedure.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', '');
$fwViewData['bsn_id'] = $bsn_id;

$tableTask = new Fw_Db_Table('lead_standard_procedure');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['lsp_id'];
	unset($detail['lsp_id']);
	
    if($this_id > 0)
    	{
      		unset($detail['lsp_id']);
       		$tableTask->setWhere("lsp_id = $this_id");
	     	$opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('lsp_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('lead_standard_procedure');
	$tableTask->setWhere("lsp_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['lp_title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['lp_title'] = 'Add '.$MODULE_SINGULAR;
}	
