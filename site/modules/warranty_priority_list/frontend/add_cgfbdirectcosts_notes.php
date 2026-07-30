<?php
$fwMainView = 'file:' . getcwd() . '/add_cgfbdirectcosts_notes.tpl';
$tableTask = new Fw_Db_Table('warranty_log_cgfbdirectcosts_notes');
$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;
$date = date('Y-m-d H:i:s');
$fwViewData['added_date'] = $date;
$user = $_SESSION['user']['user_name'];
$fwViewData['added_by'] = $user;

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['cdcn_id'];
	unset($detail['cdcn_id']);

    if($this_id > 0)
	{
		unset($detail['cdcn_id']);
		$tableTask->setWhere("cdcn_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('cdcn_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('warranty_log_cgfbdirectcosts_notes');
	$tableTask->setWhere("cdcn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit CGFB Direct Costs Notes';
}
else
{
    $fwViewData['title'] = 'Add CGFB Direct Costs Notes';
}	
