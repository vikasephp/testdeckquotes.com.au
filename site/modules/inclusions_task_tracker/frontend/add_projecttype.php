<?php
$fwMainView = 'file:' . getcwd() . '/add_projecttype.tpl';
$tableTask = new Fw_Db_Table('inclusions_task_tracker_project_type');

$fwViewData['itt_pt_id'] = (int)$fwRequest->getParam('itt_pt_id', 0);
$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('letter', array());
	
	$this_id = (int)$detail['itt_pt_id'];
	unset($detail['itt_pt_id']);
	
	
    if($this_id > 0)
	{             
		unset($detail['itt_pt_id']);
		$tableTask->setWhere("itt_pt_id = $this_id");
		$opr = $tableTask->updateRow($detail);   
    }
	else
	{
		$opr = $tableTask->insertRow($detail); 
	}    	
	$fwViewData['opr'] = $opr;	
}

$this_id = (int)$fwRequest->getParam('itt_pt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('inclusions_task_tracker_project_type');
	$tableTask->setWhere("itt_pt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit Project Type';
}
else
{
    $fwViewData['title'] = 'Add Project Type';
}	
