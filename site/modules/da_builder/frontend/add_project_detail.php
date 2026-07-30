<?php
$fwMainView = 'file:' . getcwd() . '/add_project_detail.tpl';
$tableTask = new Fw_Db_Table('report_project_detail');
$rt_id = (int)$fwRequest->getParam('rt_id', 0);

$sql = "Select pd_id , pd_rt_id from report_project_detail where pd_rt_id = ".$rt_id;
$data = $fwDb->queryOne($sql);


$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	
	$detail = $fwRequest->getParam('task', array());
	
	$this_id = (int)$detail['pd_id'];
	unset($detail['pd_id']);
	
	$detail['pd_rt_id'] = $rt_id;
	
    if(!empty($data))
    {
      		 unset($detail['pd_id']);
       		 $tableTask->setWhere("pd_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    }
	
 else
	{
		     $opr = $tableTask->insertRow($detail); 
	}    	
	       
		    $fwViewData['opr'] = $opr;
			
}


if(!empty($data))
{
	$tableTask = new Fw_Db_Table('report_project_detail');
	$tableTask->setWhere("pd_id = ".$data['pd_id']);
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
    $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

//$sql = "SELECT  rt_project_address  from report_table";
//$fwViewData['projdetail'] = $fwDb->query($sql);