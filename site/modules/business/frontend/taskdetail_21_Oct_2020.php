<?php

$bus_id = $fwRequest->getparam('bsn_id', 0);
$taskId = $fwRequest -> getParamget('uid','');

$sql1 = "select business.bsn_name from business where bsn_id = ". $bus_id;
$fwViewData['busdata'] = $fwDb->queryOne($sql1);



//$sql2 = "select busness_status_task.bst_task_name, business_tasks.bt_completed_date, users.user_name
//         from busness_status_task 
//	 Inner Join business_tasks on busness_status_task.bst_task_id = business_tasks.bt_task_id
//	 Left Join Users on business_tasks.bt_completed_by  = users.user_id
//	 where bst_task_id = ". $taskId;


$sql2 = "SELECT busness_status_task.bst_task_name, business_tasks.bt_completed_date, users.user_name
	FROM business_tasks
	INNER JOIN busness_status_task ON business_tasks.bt_task_id = busness_status_task.bst_task_id
	INNER JOIN users ON business_tasks.bt_completed_by = users.user_id
	AND business_tasks.bt_bsn_id = ".$bus_id. "
	WHERE busness_status_task.bst_task_id = ". $taskId;	 
	 
$fwViewData['taskdata'] = $fwDb->queryOne($sql2);



$taskAction = $fwRequest -> getParamget('taskAction','');
			
$submit = $fwRequest->getParam('updatetask', '');

if(!empty($submit))
{		
	$bsn_status_date = $fwRequest->getparam('bsn_status_date','');
	$bsn_status_date = changedate_Y_m_d($bsn_status_date);
	
	$complete = $fwRequest->getparam('bt_complete','');
	$comment =  $fwRequest->getparam('bt_comment','');
	$comment = addslashes($comment);
	$bst_id =  $fwRequest->getparam('bst_id',0);
	

	if($complete =='on') { $complete = 1; } else { $complete = 0; }

	if($complete == '0')
	{
		$sql_update = "UPDATE business_tasks
							SET  bt_complete = 0,
							bt_completed_date=0,
							bt_completed_by=0,
							bt_comment=''
							WHERE bt_id = $taskId";				
	}
	elseif($complete == '1')
	{
		$user_id = $_SESSION['user']['user_id'];
		
		//$bsn_status_date = ($fwRequest->getParamget('bt_completed_date'))? changedate_Y_m_d($fwRequest->getParamget('bt_completed_date')) : 'now()';
		
	
		$sql_update = "UPDATE business_tasks SET bt_complete = 1,
		bt_completed_date = '".$bsn_status_date."', 
		bt_completed_by = $user_id, 
		bt_comment = '$comment'
		WHERE bt_id = $taskId";
		
						
	}
	
	if(!empty($sql_update))
	{
		$fwDb -> queryOne($sql_update);
	}
			
}
		
	$fwViewData['taskId'] = $taskId;
	$tablebtasks = new Fw_Db_Table('business_tasks');
	$tablebtasks->setWhere("bt_task_types_id > 0 AND bt_id = ".$taskId);
	if(!$tablebtasks->rowExists())
		{
		$sql_tasks = "	SELECT
					bt.*, 
					bs.st_name, 
					bst.bst_task_name,
					bst.bst_document,
					bst.bst_instruction,
					bst.bst_id,
					cs.customer_name
					
					FROM business_tasks as bt
					
					INNER JOIN busness_status as bs
					ON bt.bt_task_status_id = bs.st_id
					
					INNER JOIN busness_status_task as bst
					ON bt.bt_task_id = bst.bst_id

					LEFT JOIN customers as cs
					ON bt.bt_completed_by= cs.user_id
					
					WHERE bt.bt_id = $taskId";
		}else{
		
		$sql_tasks = "	SELECT
					bt.*, 
					bs.pt_name, 
					bst.bst_task_name,
					bst.bst_document,
					bst.bst_instruction,
					bst.bst_id,
					cs.customer_name
					
					FROM business_tasks as bt
					
					INNER JOIN project_type as bs
					ON bt.bt_task_types_id = bs.pt_id
					
					INNER JOIN project_types_task as bst
					ON bt.bt_task_id = bst.bst_id
											
					LEFT JOIN customers as cs
					ON bt.bt_completed_by= cs.user_id
					
					WHERE bt.bt_id = $taskId";
		}
	
	
					
$taskData = $fwDb -> queryOne($sql_tasks);



	if($taskData['bt_completed_date']!=0)
	{
		$taskData['date'] = changedate_d_m_Y($taskData['bt_completed_date']);
		$taskData['time'] = changetime_h_m($taskData['bt_completed_date']);
	}
	else
	{
		$taskData['date'] = date('d-m-Y');
		$taskData['time'] = date('H:i');
	}
	
	$fwViewData['taskData'] = $taskData;
			