<?php
$fwMainView = 'file:' . getcwd() . '/add_council.tpl';
$tableTask = new Fw_Db_Table('nsw_paqr_council_admin');

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('council', array());
	$this_id = (int)$detail['npc_id'];
	unset($detail['npc_id']);
	
    if($this_id > 0)
    	{
      		unset($detail['npc_id']);
       		$tableTask->setWhere("npc_id = $this_id");
	     	$opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	    $fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('npc_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('nsw_paqr_council_admin');
	$tableTask->setWhere("npc_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Council';
}
else
{
    $fwViewData['title'] = 'Add Council';
}	
