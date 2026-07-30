<?php
$fwMainView = 'file:' . getcwd() . '/new_task.tpl';
$tableTask = new Fw_Db_Table('task_designer_tracker');

$fwViewData['dt_id'] = (int)$fwRequest->getParam('dt_id', 0);

$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_name'] = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if(!empty($submit))
{
    	$detail = $fwRequest->getParam('task', array());
	$detail['tdt_user_id'] = $user_id;
	
	//db($detail);
	
	
	$cn = $detail['tdt_cheklist_no'];
	
	$sqlcn = "select dt_id from designer_tracker where dt_checklist_no = ".$cn;
	$data = $fwDb->queryOne($sqlcn);
	
	$detail['tdt_dt_id'] = $data['dt_id'];

	//db($detail);
	//exit;
	$fwViewData['dt_id'] = $detail['tdt_dt_id'];
	
	$this_id = (int)$detail['tdt_id'];
	unset($detail['tdt_id']);
	
	
    if($this_id > 0)
    	{
             $fwViewData['dt_id'] = $detail['tdt_dt_id'];
      		 unset($detail['tdt_dt_id']);
			 unset($detail['tdt_task_assigner']);
       		 $tableTask->setWhere("tdt_id = $this_id");
	     	 $opr = $tableTask->updateRow($detail);   
    	}
	else
	{
		 $opr = $tableTask->insertRow($detail); 
	}    	
	         $fwViewData['opr'] = $opr;
		
		//Location(BASE_URL . $XFA['home']);
}

$this_id = $fwRequest->getParam('tdt_id', 0);

if ($this_id > 0)
{
	$tableTask = new Fw_Db_Table('task_designer_tracker');
	$tableTask->setWhere("tdt_id = $this_id");
	$detail = $tableTask->getRow();
	

	
	$fwViewData['detail'] = $detail;
        $fwViewData['title'] = 'Edit '.$MODULE_SINGULAR;
}
else
{
    $fwViewData['title'] = 'Add '.$MODULE_SINGULAR;
}	

	$sqlcn = "select distinct dt_checklist_no from designer_tracker order by dt_checklist_no ";
	$cndata = $fwDb->query($sqlcn);
	$fwViewData['cndata'] =  $cndata;
	

$sqldt = "Select * from design_team";
$fwViewData['teamData'] = $fwDb->query($sqldt);