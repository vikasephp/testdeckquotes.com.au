<?php
$fwMainView = 'file:' . getcwd() . '/add_report.tpl';
$tableTask = new Fw_Db_Table('report_table');

$user_id = $_SESSION['user']['user_id'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    $detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['rt_id'];
	unset($detail['rt_id']);
	
	$sql = "Select rt_id from report_table where  	rt_project_address  = '".$detail['rt_project_address']."'";
	$data = $fwDb->queryOne($sql);
	$id = $data['rt_id'];
	unset($detail['rt_project_address']);
	
	if(empty($detail['rt_order'])) {
		unset($detail['rt_order']);
	}
	
	if(empty($detail['rt_specification'])) {
		unset($detail['rt_specification']);
	}
	
	if(empty($detail['rt_status_2'])) {
		unset($detail['rt_status_2']);
	}
	
	if(empty($detail['rt_criteria'])) {
		unset($detail['rt_criteria']);
	}
	
	if(empty($detail['st_statement'])) {
		unset($detail['st_statement']);
	}
	
	
	
    if(!empty($data))
    {
      		 unset($detail['rt_id']);
       		 $tableTask->setWhere("rt_id = $id");
	     	 $opr = $tableTask->updateRow($detail);   
    }
	
// else
//	{
//		     $opr = $tableTask->insertRow($detail); 
//	}    	
	       
		    $fwViewData['opr'] = $opr;
			
}

$this_id = (int)$fwRequest->getParam('rt_id', 0);
if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('report_table');
	$tableTask->setWhere("rt_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

$sql = "SELECT  rt_project_address  from report_table";
$fwViewData['projdetail'] = $fwDb->query($sql);