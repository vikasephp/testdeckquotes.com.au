<?php
$fwMainView = 'file:' . getcwd() . '/add_doc_admin.tpl';
$tableTask = new Fw_Db_Table('proposal_report_doc_name');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['prdn_id'];
	unset($detail['prdn_id']);
	
    if($this_id > 0)
	{             
		unset($detail['prdn_id']);
		$tableTask->setWhere("prdn_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('prdn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('proposal_report_doc_name');
	$tableTask->setWhere("prdn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Document Name';
}
else
{
    $fwViewData['title'] = 'Add Document Name';
}	
