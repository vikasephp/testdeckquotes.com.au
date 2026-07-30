<?php
$fwMainView = 'file:' . getcwd() . '/subtaskrenovation.tpl';
$bus_id = $fwRequest->getparam('bus_id', 0);
$tn = $fwRequest->getParam('tn', 0);
$tid = $fwRequest->getParam('tid', 0);

$fwViewData['tid'] = $tid;
	   
$sql = "SELECT * FROM renovation_tasks_sub where bts_bsn_id = ".$bus_id. " And bts_task_id = ".$tid .  " And bts_task_list_number = ".$tn;
	   $fwViewData['subtaskdata'] = $fwDb->query($sql);
	   
if(!empty($fwViewData['subtaskdata'])) {
	
		}
else {
				  
		 $fwViewData['msg'] = "No Subtasks Exist";
	  }

 $sqlLp = "select renovation_task_list_subtask_lp.* from renovation_task_list_subtask_lp where bstlp_bst_id = ".$tid; 
 $fwViewData['subtaskdata_lp'] = $fwDb->query($sqlLp);

$submit = $fwRequest->getParam('st_save', '');

if(!empty($submit))
{
	$data1 = $fwRequest->getParam('task', array());
	//$data2 = $fwRequest->getParam('bts_not_required', array());

	$bustasksub = new Fw_Db_Table('renovation_tasks_sub');
	
	foreach($data1 as $dt)
	{
		$bts_id = $dt['bts_id'];
		if(!empty($dt['bts_task_completed'])) { $value1 =  1; } else { $value1 =  0; }
		if(!empty($dt['bts_not_required'])) { $value2 =  1; } else { $value2 =  0; }
		
		$bustasksub->setWhere("bts_id = ".$bts_id);
		$detail['bts_complete'] = $value1;
		$detail['bts_not_required'] = $value2;
		$bustasksub->updateRow($detail);
	}
		
	header('Location: '.$_SERVER['REQUEST_URI']);
	//db($data2);
}
 