<?php
$fwMainView = 'file:' . getcwd() . '/common.tpl';
$fwViewData['calcjs'] ='file:' . getcwd() . '/calcjs.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$fwViewData['ipad'] = $iPad;

if($requset)
{
   switch ($requset) {

      case 'addStatusTask':
		
		   $business_tasksTable = new Fw_Db_Table('proposal_tasks');
		   $busness_statusTable = new Fw_Db_Table('busness_status');
			
			$bus_id = $fwRequest -> getParamget('bus_id','');			
			//$taskStatusId = $fwRequest -> getParamget('taskStatusId','');
			$tasknum = $fwRequest -> getParamget('tasknum','');
			
			$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
			$type = $fwDb -> queryOne($sql_bsn_type);
			if($type){$bsn_type = $type['bsn_type'];}
	
			$sql_checkExists = "SELECT * FROM proposal_tasks WHERE bt_bsn_id = $bus_id ";
			$exists = $fwDb -> query($sql_checkExists);
				
			$sql_gettasks = "SELECT bst.bst_id, bst.bst_business_types, bst.bst_task_name, bst_business_types_id FROM proposal_task_list as bst ";
	
				$tasksOfstatus = $fwDb-> query($sql_gettasks);
				if($tasksOfstatus):
				foreach($tasksOfstatus as $h):
					if($h['bst_business_types']):
						$seids = unserialize($h['bst_business_types']); 
						if($seids[$bsn_type] == 1): $data[] =  $h;	endif;
					endif;
				endforeach;
				endif;
				if($data){$tasksOfstatus = $data;}
					
						
				if(count($tasksOfstatus)>0)
				{
					foreach($tasksOfstatus as $k_tos => $v_tos)
					{
						if($detail)	{unset($detail); }
						$detail['bt_bsn_id'] = trim($bus_id);
						//$detail['bt_task_status_id'] = trim($v_tos['st_id']);
						$detail['bt_task_list_number'] = $tasknum;
						$detail['bt_task_id'] = trim($v_tos['bst_id']);

$business_tasksTable->setWhere("bt_bsn_id = {$detail['bt_bsn_id']} && bt_task_id = {$detail['bt_task_id']} && bt_task_list_number = {$detail['bt_task_list_number']}" );	
					
						if(!$business_tasksTable->rowExists() && $detail){ $business_tasksTable -> insertRow($detail); }																
						
					 						
						if($v_tos['bst_business_types_id'] > 0)
						{
									$sql_gettypes = "SELECT pt.pt_id, pt.pt_name, pst.bst_id,
										pst.bst_business_status_id, pst.bst_task_name FROM  project_type as pt
										INNER JOIN  project_types_task as pst
										ON pt.pt_id = pst.bst_business_status_id
										WHERE pt.pt_id = ".$v_tos['bst_business_types_id']." AND pst.bst_status = 1";
					
								$tasksOftypes = $fwDb-> query($sql_gettypes);
								if($tasksOftypes)
									{
										foreach($tasksOftypes as $val)
												{
										$data['bt_bsn_id'] = trim($bus_id);
										//$data['bt_task_status_id'] = trim($v_tos['st_id']);
										$data['bt_task_list_number'] = $tasknum;
										$data['bt_task_types_id'] = trim($val['pt_id']);
										$data['bt_task_id'] = trim($val['bst_id']);
										if($data){	$business_tasksTable -> insertRow($data); }
												
												}
									}
						}		
					
						//$sql_taskStatusName = $fwDb -> queryOne("SELECT st_name FROM busness_status WHERE st_id = $taskStatusId");
						$taskmsg = "Tasks for has been added successfully.";
						$fwViewData['taskmsg'] = $taskmsg;
						
					}
					//}
				}	
				
				$business_status_subtaskTable = new Fw_Db_Table('proposal_task_list_subtask');
				//$business_status_subtaskTable->setWhere('bsst_business_status_id = '. $taskStatusId);
				
				$subtaskdetail = $business_status_subtaskTable->getRows();
				
				$business_tasks_subTable = new Fw_Db_Table('proposal_tasks_sub');
				
				foreach($subtaskdetail as $stv)
				{
					$business_tasks_subTable->setWhere('bts_bsn_id = '. $bus_id. ' And bts_bsst_id = '.$stv['bsst_id'] .  ' And bts_task_list_number = '.$tasknum);
					if(!$business_tasks_subTable->rowExists())
					{
							$std['bts_bsst_id'] = $stv['bsst_id'];
							$std['bts_bsn_id'] = $bus_id;
							//$std['bts_task_status_id'] = $stv['bsst_business_status_id'];
							$std['bts_task_id'] = $stv['bsst_bst_id'];
							$std['bts_task_name'] = $stv['bsst_task_name'];
							$std['bts_task_list_number'] = $tasknum;
															
							$business_tasks_subTable->insertRow($std);
					}
					else
					{
							$std['bts_bsst_id'] = $stv['bsst_id'];
							$std['bts_bsn_id'] = $bus_id;
							$std['bts_task_id'] = $stv['bsst_bst_id'];
							$std['bts_task_name'] = $stv['bsst_task_name'];
							$std['bts_task_list_number'] = $tasknum;
						    
							$business_tasks_subTable->updateRow($std);
					}
			  }
			  
		break;
		
    }

}

