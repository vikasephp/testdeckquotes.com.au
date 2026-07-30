<?php
$fwMainView = 'file:' . getcwd() . '/common4.tpl';
$fwViewData['calcjs'] ='file:' . getcwd() . '/calcjs.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$fwViewData['ipad'] = $iPad;

$fwViewData['ran'] =  rand(100000,999999);

if($requset)
{
		switch ($requset) {
		
		 case 'addStatusTask':
		
		   $business_tasksTable = new Fw_Db_Table('renovation_tasks');
		   $busness_statusTable = new Fw_Db_Table('busness_status');
			
			$bus_id = $fwRequest -> getParamget('bus_id','');			
			$tasknum = $fwRequest -> getParamget('tasknum','');
			
			$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
			$type = $fwDb -> queryOne($sql_bsn_type);
			if($type){$bsn_type = $type['bsn_type'];}
	
			$sql_checkExists = "SELECT * FROM renovation_tasks WHERE bt_bsn_id = $bus_id ";
			$exists = $fwDb -> query($sql_checkExists);
				
			$sql_gettasks = "SELECT bst.bst_id, bst.bst_business_types, bst.bst_task_name, bst_business_types_id FROM renovation_task_list as bst ";
	
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
										$data['bt_task_list_number'] = $tasknum;
										$data['bt_task_types_id'] = trim($val['pt_id']);
										$data['bt_task_id'] = trim($val['bst_id']);
										if($data){	$business_tasksTable -> insertRow($data); }
												
												}
									}
						}		
					
						$taskmsg = "Tasks for has been added successfully.";
						$fwViewData['taskmsg'] = $taskmsg;
					}
				}	
				
				$business_status_subtaskTable = new Fw_Db_Table('renovation_task_list_subtask');
				$subtaskdetail = $business_status_subtaskTable->getRows();
				$business_tasks_subTable = new Fw_Db_Table('renovation_tasks_sub');
				
				foreach($subtaskdetail as $stv)
				{
					$business_tasks_subTable->setWhere('bts_bsn_id = '. $bus_id. ' And bts_bsst_id = '.$stv['bsst_id'] .  ' And bts_task_list_number = '.$tasknum);
					if(!$business_tasks_subTable->rowExists())
					{
							$std['bts_bsst_id'] = $stv['bsst_id'];
							$std['bts_bsn_id'] = $bus_id;
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

		
		//all task renovation starts
		case 'getAllTasksRenovation':
				$bus_id = $fwRequest -> getParamget('bus_id','');
				$cts = $fwRequest -> getParamget('cts','');
				$cts='';
				//$bt_task_status_id = $fwRequest -> getParamget('bt_task_status_id',0);
				$tn = $fwRequest -> getParamget('bt_task_list_number','');
				$fwViewData['n'] = $tn;
				$pagenum = $fwRequest -> getParamget('pagenum','');
				$perpage = $fwRequest -> getParamget('perpage',''); 
				
								
			$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
						$type = $fwDb -> queryOne($sql_bsn_type);
						if($type){$bsn_type = $type['bsn_type'];}	

		$sql1 = "SELECT bt.*, bst.bst_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link, bst.bst_order, 
						bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id, bsto.*
						FROM renovation_tasks as bt
						INNER JOIN  renovation_task_list as bst
						ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0
						LEFT JOIN renovation_task_list_orders as bsto
						ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id AND bsto.business_status_task_orders_type_id = {$bsn_type} 

						LEFT JOIN users as u
						ON bt.bt_completed_by = u.user_id
						
						LEFT JOIN email_template as et
						ON bt.bt_task_id = et.et_task AND et.et_status = 1
						
						WHERE bt.bt_bsn_id = {$bus_id} AND bt.bt_task_list_number = {$tn}";
						
								
						if($cts == '0' OR $cts =='1'):	$sql1 .= " AND bt.bt_complete = ".$cts; endif;
				        //if($bt_task_status_id > 0): $sql1 .=" AND bt.bt_task_status_id = ".$bt_task_status_id; endif;
						
						$sql1 .= " Order By bst.bst_order ASC ";	
								
				$sql2 = "SELECT bt.*, pt.pt_name, pst.bst_task_name, pst.bst_document, pst.bst_order, 
				                u.user_name, et.et_id FROM renovation_tasks as bt
								INNER JOIN project_type as pt
								ON bt.bt_task_types_id = pt.pt_id
								INNER JOIN  project_types_task as pst
								ON bt.bt_task_id = pst.bst_id AND bt.bt_task_types_id > 0
								LEFT JOIN users as u
								ON bt.bt_completed_by = u.user_id
								LEFT JOIN email_template as et
								ON bt.bt_task_id = et.et_task AND et.et_status = 1
								WHERE bt.bt_bsn_id = $bus_id 
								";				
						
						
		     	if($cts == '0' OR $cts =='1'):	$sql2 .= " AND bt.bt_complete = ".$cts; endif;
			//	if($bt_task_status_id > 0): $sql2 .=" AND bt.bt_task_status_id = ".$bt_task_status_id; endif;			
				
				$sql2 .= " ORDER BY bst_order ASC ";	

				$sql = $sql1;

				if($bus_id > 0 )
				{			
				
					$userData = $fwDb -> query($sql);
			
					$count_userData= count($userData);
				
						if(!empty($userData))
							{
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
							
								$rows = count($userData);
								
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 10;
								}

								$fwViewData['perpage'] =  $page_rows;
								$last = ceil($rows/$page_rows); 
								
								if ($pagenum <= 1)
								{
									$pagenum = 1;
								}
								elseif ($pagenum > $last)
								{
									$pagenum = $last;
								}
								$fwViewData['last'] = $last;
								$fwViewData['lastone'] = $last-1;
								$fwViewData['lasttow'] = $last-2;
								$fwViewData['pagenum'] = $pagenum;
								$pagenatedatanext = $pagenum;
								$pagenatedataprev = $pagenum;
								for($i=0; $i<9; $i++)
									{
									$paginate[$pagenatedatanext] = $pagenatedatanext;
									$pagenatedatanext ++;
									}
									$fwViewData['paginatenext'] = $paginate;
								$pagenatedataprev = $pagenum;	
								for($i=0; $i<9; $i++)
									{
									$paginateprev[$pagenatedataprev] = $pagenatedataprev;
									$pagenatedataprev --;
									}
								$fwViewData['paginateprev'] = array_reverse($paginateprev);
								
								$max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
								
								$sql2 =  $sql." ".$max;
							if($sql2){
								
								$all = $fwDb->query($sql2);
								
								foreach($all as $kk => $allt)
								{
								  	$all[$kk]['bst_instruction'] = preg_replace('/[^A-Z0-9._<>\/&;]/i', ' ', $allt['bst_instruction']);	
								}
								
								foreach($all as $dv)
								{
									$dv['bst_task_doc_link'] =  explode(',',$dv['bst_task_doc_link']);	
									$all2[] = $dv;
								}
				
										
								$fwViewData['allTasksrenovation']= $all2;
								
								$tpsql = "select * from renovation_task_list_procedures";
								$fwViewData['allTasksProcrenovation'] = $fwDb->query($tpsql);
								
								
								$elsql = "select * from renovation_task_list_email_link";
								$fwViewData['renovationEmailLink'] = $fwDb->query($elsql);
								
								}
								}
				}								
		break;
		
		
		case "markTaskDonerenovation":
		
			$bt_id = $fwRequest -> getParamget('bt_id');
			$user_id = $_SESSION['user']['user_id'];
			
			$check_markdone = "SELECT * FROM renovation_tasks WHERE bt_id = $bt_id AND bt_complete = 1";			
			
			$done = $fwDb -> query($check_markdone);
			
			if(count($done) > 0)
			{
				$taskmsg = "This Task is already been marked as Done.";
				$fwViewData['taskmsgrenovation'] = $taskmsg;
			}
			else
			{
				$sql_markdone = "UPDATE renovation_tasks SET bt_complete = 1, bt_completed_date = now(), bt_completed_by = $user_id WHERE bt_id = $bt_id";
								
				$fwDb -> queryOne($sql_markdone);
				
				$taskmsg = "This Task is successfully marked as Done.";
				$fwViewData['taskmsgrenovation'] = $taskmsg;
			}
			
		break;
		
		
		case "editTask":
			$taskId = $fwRequest -> getParamget('taskId','');
			$taskAction = $fwRequest -> getParamget('taskAction','');
			
			/**** Begin Open Edit Div ***/
			if($taskAction == 'OpenEdit')
			{
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
			
			}
			/**** End Open Edit Div ***/
			
			
			/**** Begin Save the Data ***/
			if($taskAction == 'SaveEdit')
			{
				$complete = $fwRequest -> getParamget('complete');
				$comment = $fwRequest -> getParamget('comment');
				$comment = addslashes($comment);
	
				if($complete == '0')
				{
					$sql_update = "UPDATE business_tasks
										SET 
										bt_complete = 0,
										bt_completed_date=0,
										bt_completed_by=0,
										bt_comment=''
										WHERE bt_id = $taskId";				
				}
				elseif($complete == '1')
				{
					$user_id = $_SESSION['user']['user_id'];
					
					$bsn_status_date = ($fwRequest->getParamget('bt_completed_date'))? changedate_Y_m_d($fwRequest->getParamget('bt_completed_date')) : 'now()';
$sql_update = "UPDATE business_tasks SET bt_complete = 1, bt_completed_date = '".$bsn_status_date."', bt_completed_by = $user_id, bt_comment = '$comment'  WHERE bt_id = $taskId";				
				}
				if(!empty($sql_update))
				{
					$fwDb -> queryOne($sql_update);
				}
			
			}
		/**** End Save the Data ***/
		break;
		case 'addTypeTask':
				/*** Begin create objects for tables ****/
					$business_tasksTable = new Fw_Db_Table('projects_tasks');
					$busness_statusTable = new Fw_Db_Table('project_type');
				/*** End create objects for tables ****/
						$bus_id = $fwRequest->getParamget('bus_id','');			
						$taskStatusId = $fwRequest->getParamget('taskStatusId','');
	
						$sql_checkExists = "SELECT * FROM projects_tasks WHERE bt_bsn_id = $bus_id AND bt_task_status_id = $taskStatusId";
						$exists = $fwDb -> query($sql_checkExists);
						
						if(count($exists)>0)
						{
							$sql_taskStatusName = $fwDb -> queryOne("SELECT pt_name FROM project_type WHERE pt_id = $taskStatusId");
							$taskmsg = "Tasks for '".$sql_taskStatusName['pt_name']."' has already been added.";
							$fwViewData['taskmsg'] = $taskmsg;
						}
						else
						{
							//echo "bus_id = $bus_id",  "\n", "taskStatusId = $taskStatusId";
							$sql_gettasks = "SELECT 
												st.pt_id, 
												st.pt_name, 
												bst.bst_id, 
												bst.bst_task_name 
												FROM project_type as st
												INNER JOIN project_types_task as bst
												ON st.pt_id = bst.bst_business_status_id
												WHERE st.pt_id = $taskStatusId";
																	
						$tasksOfstatus = $fwDb-> query($sql_gettasks);
							
							
							if(count($tasksOfstatus)>0)
							{
								foreach($tasksOfstatus as $k_tos => $v_tos)
								{
									if($detail){ unset($detail);}
									$detail['bt_bsn_id'] = trim($bus_id);
									$detail['bt_task_status_id'] = trim($v_tos['pt_id']);
									$detail['bt_task_id'] = trim($v_tos['bst_id']);
									if($detail){ $business_tasksTable -> insertRow($detail);}
									
							$sql_taskStatusName = $fwDb -> queryOne("SELECT pt_name FROM project_type WHERE pt_id = $taskStatusId");
							$taskmsg = "Tasks for '".$sql_taskStatusName['pt_name']."' has been added successfully.";
							$fwViewData['taskmsg'] = $taskmsg;
							
								}
							}
						}									
		break;
		case 'getAllptypeTasks':
				$bus_id = $fwRequest -> getParamget('bus_id','');
				$cts = $fwRequest -> getParamget('cts','');
				$bt_task_types_id = $fwRequest -> getParamget('bt_task_types_id',0);
				$pagenum = $fwRequest -> getParamget('pagenum','');
				$perpage = $fwRequest -> getParamget('ptperpage',''); 

				$sql = "SELECT	bt.*, 
								bs.pt_name, 
								bst.bst_task_name,
								bst.bst_document,
								bst.bst_order,
								u.user_name,
								et.et_id
						FROM projects_tasks as bt
								
								INNER JOIN project_type as bs
								ON bt.bt_task_status_id = bs.pt_id
								
								INNER JOIN  project_types_task as bst
								ON bt.bt_task_id = bst.bst_id
								
								LEFT JOIN users as u
								ON bt.bt_completed_by = u.user_id
								
								LEFT JOIN email_template as et
								ON bt.bt_task_id = et.et_task_types AND et.et_status = 1
								
								WHERE bt.bt_bsn_id = ".$bus_id;
				

				
				if($cts == '0' OR $cts =='1'):	$sql .= " AND bt_complete = ".$cts; endif;
				if($bt_task_types_id > 0): $sql .=" AND bst.bst_business_status_id = ".$bt_task_types_id; endif;
				
				
				$sql .= " ORDER BY bt_task_status_id ASC, bst.bst_order ASC ";
		
				if($bus_id > 0 )
				{			
					$userData = $fwDb->query($sql);
					$count_userData= count($userData);
					
			
					
						if(!empty($userData))
							{
							
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
							
								$rows = count($userData);
								
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 10;
								}
								
								$fwViewData['perpage'] =  $page_rows;
								
								
								$last = ceil($rows/$page_rows); 
								
								if ($pagenum <= 1)
								{
									$pagenum = 1;
								}
								elseif ($pagenum > $last)
								{
									$pagenum = $last;
								}
								$fwViewData['last'] = $last;
								$fwViewData['lastone'] = $last-1;
								$fwViewData['lasttow'] = $last-2;
								$fwViewData['pagenum'] = $pagenum;
								$pagenatedatanext = $pagenum;
								$pagenatedataprev = $pagenum;
								for($i=0; $i<9; $i++)
									{
									$paginate[$pagenatedatanext] = $pagenatedatanext;
									$pagenatedatanext ++;
									}
									$fwViewData['paginatenext'] = $paginate;
								$pagenatedataprev = $pagenum;	
								for($i=0; $i<9; $i++)
									{
									$paginateprev[$pagenatedataprev] = $pagenatedataprev;
									$pagenatedataprev --;
									}
								$fwViewData['paginateprev'] = array_reverse($paginateprev);
								
								$max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
								
								$sql2 =  $sql." ".$max;
							
							if($sql2){$fwViewData['allptTasks']= $fwDb->query($sql2);}
							}
	
				}
								
		break;
		case "editptypeTask":
			$taskId = $fwRequest -> getParamget('taskId','');
			$taskAction = $fwRequest -> getParamget('taskAction','');
			/**** Begin Open Edit Div ***/
		
			if($taskAction == 'OpenEdit')
			{
				$fwViewData['taskptypeId'] = $taskId;
			
				$sql_tasks = "	SELECT
								bt.*, 
								bs.pt_name, 
								bst.bst_task_name,
								bst.bst_document,
								cs.customer_name
								
								FROM projects_tasks as bt
								
								INNER JOIN project_type as bs
								ON bt.bt_task_status_id = bs.pt_id
								
								INNER JOIN  project_types_task as bst
								ON bt.bt_task_id = bst.bst_id
								
								LEFT JOIN customers as cs
								ON bt.bt_completed_by= cs.user_id
								
								WHERE bt.bt_id = $taskId";
								
								
								
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
			
			}
			/**** End Open Edit Div ***/

			
			/**** Begin Save the Data ***/
			if($taskAction == 'SaveEdit')
			{
				$complete = $fwRequest -> getParamget('complete');
				$comment = $fwRequest -> getParamget('comment');
				$comment = $fwRequest -> getParamget('bt_completed_date');
				$comment = addslashes($comment);
	

				if($complete == '0')
				{
					$sql_update = "UPDATE projects_tasks
										SET 
										bt_complete = 0,
										bt_completed_date=0,
										bt_completed_by=0,
										bt_comment=''
										WHERE bt_id = $taskId";				
				}
				elseif($complete == '1')
				{
					$user_id = $_SESSION['user']['user_id'];
					
					
					
					$sql_update = "UPDATE projects_tasks SET bt_complete = 1, bt_completed_date = now(), bt_completed_by = $user_id, bt_comment = '$comment'  WHERE bt_id = $taskId";
				
				}
				
				if(!empty($sql_update))
				{
					$fwDb -> queryOne($sql_update);
				}
			}
		/**** End Save the Data ***/
		break;
		case "markptypeTaskDone":
			$bt_id = $fwRequest -> getParamget('bt_id');
			$user_id = $_SESSION['user']['user_id'];
			
			$check_markdone = "SELECT * FROM projects_tasks
								WHERE bt_id = $bt_id AND bt_complete = 1";			
			
			$done = $fwDb -> query($check_markdone);
			
			if(count($done) > 0)
			{
				$taskmsg = "This Task is already been marked as Done.";
				$fwViewData['taskmsg'] = $taskmsg;
			}
			else
			{
				$sql_markdone = "UPDATE projects_tasks SET bt_complete = 1, bt_completed_date = now(), bt_completed_by = $user_id WHERE bt_id = $bt_id";
								
				$fwDb -> queryOne($sql_markdone);
				
				$taskmsg = "This Task is successfully marked as Done.";
				$fwViewData['taskmsg'] = $taskmsg;
			}
			
		break;
	
	
	case "DocumentCheckListRenovation":
			$document_check_listTable = new Fw_Db_Table('document_check_list_renovation');
			$admin_document_check_listTable = new Fw_Db_Table('admin_document_check_list_renovation');
			
			$addList = $fwRequest -> getParamget('addList','');
			$bus_id = $fwRequest -> getParamget('bus_id','');
		
		
		if(!empty($addList) AND $addList == 'add')
		{
			
			if($bus_id>0)
			{
				//db("Testing2 Going on");
				//db($bus_id);
				//exit;
				
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
					
					
					//$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1");
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					$fwViewData['data_checklist'] = $data_checklist;
						
					foreach($data_checklist as $k => $v)
					{
						
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_name_id'] = $v['admin_doc_id'];
						$data['doc_upload_to_dossier'] = $v['admin_doc_upload_to_dossier'];
						$data['doc_checklist_number'] = 1;
						$document_check_listTable->setWhere("doc_name_id =".$v['admin_doc_id'] .' AND doc_bsn_id = '.$bus_id);
							
							if(!$document_check_listTable->rowExists())
							{
							$document_check_listTable -> insertRow($data);
							}					
							
							
					}
					$countTable = new Fw_Db_Table('document_check_list_renovation_count');
					$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
					
					if(!$countTable->rowExists())
					 {
						$counterdata['dcnt_bsn_id'] = $bus_id;
						$counterdata['dcnt_counter'] = 1;
						$countTable->insertRow($counterdata);
					 }
				
				    $dataTable = new Fw_Db_Table('document_renovation_name');
					$dataTable->setWhere('dpn_bsn_id = '.$bus_id);
					
					if(!$dataTable->rowExists())
					 {
					
					$sqlmax = "select max(dpn_unique_id) as duid from document_renovation_name";
					$m_data = $fwDb -> queryOne($sqlmax);
					$un_data = $m_data['duid'] + 1;
					$unqdata['dpn_bsn_id'] = $bus_id;
					$unqdata['dpn_unique_id'] = $un_data;
					$unqdata['dpn_proposal_number'] = 1;
					$dataTable->insertRow($unqdata);
					 }
				
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
		}
		elseif(!empty($addList) AND $addList == 'add_new')
		{
			if($bus_id>0)
			{
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
					
					//$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1");
					
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					$fwViewData['data_checklist'] = $data_checklist;
					
					$countTable = new Fw_Db_Table('document_check_list_renovation_count');
					$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
					$ctval =  $countTable->getRow();
					$rn =  $ctval['dcnt_counter'] + 1;
					$ctrupdata['dcnt_counter'] = $rn;
					$countTable->updateRow($ctrupdata);
					
						
					foreach($data_checklist as $k => $v)
					{
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_name_id'] = $v['admin_doc_id'];
						$data['doc_upload_to_dossier'] = $v['admin_doc_upload_to_dossier'];
						$data['doc_checklist_number'] =  $rn;
						$document_check_listTable -> insertRow($data);
											
					}
					
					$dataTable = new Fw_Db_Table('document_renovation_name');
					$sqlmax = "select max(dpn_unique_id) as duid from document_renovation_name";
					$m_data = $fwDb -> queryOne($sqlmax);
					$un_data = $m_data['duid'] + 1;
					$unqdata['dpn_bsn_id'] = $bus_id;
					$unqdata['dpn_unique_id'] = $un_data;
					$unqdata['dpn_proposal_number'] = $rn;
					$dataTable->insertRow($unqdata);
					
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			else
			{
				$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
			}
		}
		// sync start
		elseif(!empty($addList) AND $addList == 'sync')
		{
			if($bus_id>0)
			{
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
					
					//$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1");
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					$fwViewData['data_checklist'] = $data_checklist;
					
					$countTable = new Fw_Db_Table('document_check_list_renovation_count');
					$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
					$ctval =  $countTable->getRow();
					
					
				for($sctr = 1; $sctr <= $ctval['dcnt_counter']; $sctr++)
				{	
				
					foreach($data_checklist as $k => $v)
					{
						
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_name_id'] = $v['admin_doc_id'];
						$data['doc_upload_to_dossier'] = $v['admin_doc_upload_to_dossier'];
						$data['doc_checklist_number'] = $sctr;
						$document_check_listTable->setWhere("doc_name_id =".$v['admin_doc_id'] .' AND doc_bsn_id = '.$bus_id. ' And doc_checklist_number = '.$sctr);
							
							if(!$document_check_listTable->rowExists())
							{
							$document_check_listTable -> insertRow($data);
							}					
					}
						
	
				}
					
					$checkListErrorMsg = "Document Checklist has been synchronize successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			
		}
		
		// sync end
		if($bus_id>0)
		{
							
			//$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name FROM document_check_list_renovation as dcl
//					   INNER JOIN admin_document_check_list_renovation as adcl
//					   ON dcl.doc_name_id = adcl.admin_doc_id
//					   LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
//					   inner join business as bs 
//					   on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
//					   WHERE dcl.doc_bsn_id = $bus_id AND dcl.doc_checklist_number = 1 ORDER BY adcl.admin_doc_order ASC";
					   
			$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name FROM document_check_list_renovation as dcl
					   INNER JOIN admin_document_check_list_renovation as adcl
					   ON dcl.doc_name_id = adcl.admin_doc_id
					   LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
					   inner join business as bs 
					   on  bs.bsn_id=".$bus_id." 
					   WHERE dcl.doc_bsn_id = $bus_id AND dcl.doc_checklist_number = 1 ORDER BY adcl.admin_doc_order ASC";		   					
							
			$print_data = $fwDb -> query($sql_print_data);
							
			$count_print_data = count($print_data);
			for($i=0; $i<$count_print_data; $i++)
			{
				if($print_data[$i]['doc_date_uploaded']!=0)
				{
				$print_data[$i]['doc_date_uploaded'] = changedate_d_m_Y($print_data[$i]['doc_date_uploaded'])." ".changetime_h_m($print_data[$i]['doc_date_uploaded']);	
				}
				else
				{
				$print_data[$i]['doc_date_uploaded'] = '';
				}
			}
			$fwViewData['print_data_renovation'] = $print_data;
			
			$namesql = "Select * from document_renovation_name where dpn_bsn_id = ". $bus_id . " and dpn_proposal_number =  1";
			$namedata_1 = $fwDb -> queryOne($namesql);
			$fwViewData['dpn_name'] = $namedata_1['dpn_name'];
			$fwViewData['dpn_primary_design'] = $namedata_1['dpn_primary_design'];
			$fwViewData['dpn_design_type'] = $namedata_1['dpn_design_type'];
			$fwViewData['dpn_customer_designer'] = $namedata_1['dpn_customer_designer'];
			$fwViewData['dpn_architect'] = $namedata_1['dpn_architect'];	
			
			if(!empty($namedata_1['dpn_created_by']))
				{
				$fwViewData['dpn_created_by'] = $namedata_1['dpn_created_by'];
			} else {
				$fwViewData['dpn_created_by'] = $_SESSION['user']['user_name'];
				
			}
			//$fwViewData['dpn_created_date'] = $namedata_1['dpn_created_date'];
			
			if(!empty($namedata_1['dpn_created_date']))
				{
				$fwViewData['dpn_created_date'] = $namedata_1['dpn_created_date'];
			} else {
				$fwViewData['dpn_created_date'] =  date('d-m-Y');
				
			}
			
			
			$fwViewData['dpn_project_type'] = $namedata_1['dpn_project_type'];
			$fwViewData['dpn_notes'] = $namedata_1['dpn_notes'];	
			$fwViewData['dpn_unique_id'] = $namedata_1['dpn_unique_id'];	
			$fwViewData['dpn_include_in_report'] = $namedata_1['dpn_include_in_report'];
			$fwViewData['dpn_hia_signed'] = $namedata_1['dpn_hia_signed'];
			$fwViewData['dpn_link1'] = $namedata_1['dpn_link1'];
			$fwViewData['dpn_link2'] = $namedata_1['dpn_link2'];
			
			//$fwViewData['dpn_you_winter'] = $namedata_1['dpn_you_winter'];
			//$fwViewData['dpn_you_summer'] = $namedata_1['dpn_you_summer'];
			
			$fwViewData['dpn_budget'] = $namedata_1['dpn_budget'];
			
			$fwViewData['bsn_id_renovation'] = $bus_id;
			
			$custom_document_renovationTable = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_document_renovationTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 1");
			$cus_renovationdata = $custom_document_renovationTable->getRows();
			$fwViewData['cus_renovationdata'] = $cus_renovationdata;
			
			$custom_document_renovationTable = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_document_renovationTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 2");
			$cus_renovationdata = $custom_document_renovationTable->getRows();
			$fwViewData['cus_renovationdata2'] = $cus_renovationdata;
			
			$custom_document_renovationTable = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_document_renovationTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 3");
			$cus_renovationdata = $custom_document_renovationTable->getRows();
			$fwViewData['cus_renovationdata3'] = $cus_renovationdata;
			
			$custom_document_renovationTable = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_document_renovationTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 4");
			$cus_renovationdata = $custom_document_renovationTable->getRows();
			$fwViewData['cus_renovationdata4'] = $cus_renovationdata;
			
			$custom_document_renovationTable = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_document_renovationTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 5");
			$cus_renovationdata = $custom_document_renovationTable->getRows();
			$fwViewData['cus_renovationdata5'] = $cus_renovationdata;
			
			

			$countTable = new Fw_Db_Table('document_check_list_renovation_count');
			$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
			$ctval =  $countTable->getRow();
			
			for($a = 2; $a<=$ctval['dcnt_counter']; $a++)
			{
				
//				$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 	FROM document_check_list_renovation as dcl
//						    INNER JOIN admin_document_check_list_renovation as adcl
//						    ON dcl.doc_name_id = adcl.admin_doc_id
//						    LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
//						    inner join business as bs 
//						    on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
//						    WHERE dcl.doc_bsn_id = $bus_id AND dcl.doc_checklist_number = $a ORDER BY adcl.admin_doc_order ASC";					
//		
			
				$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 	FROM document_check_list_renovation as dcl
						    INNER JOIN admin_document_check_list_renovation as adcl
						    ON dcl.doc_name_id = adcl.admin_doc_id
						    LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
						    inner join business as bs 
						    on  bs.bsn_id=".$bus_id." 
						    WHERE dcl.doc_bsn_id = $bus_id AND dcl.doc_checklist_number = $a ORDER BY adcl.admin_doc_order ASC";					
		
							
			$print_data = $fwDb -> query($sql_print_data);
							
			$count_print_data = count($print_data);
			for($i=0; $i<$count_print_data; $i++)
			{
				if($print_data[$i]['doc_date_uploaded']!=0)
				{
				$print_data[$i]['doc_date_uploaded'] = changedate_d_m_Y($print_data[$i]['doc_date_uploaded'])." ".changetime_h_m($print_data[$i]['doc_date_uploaded']);	
				}
				else
				{
				$print_data[$i]['doc_date_uploaded'] = '';
				}
			}
			$fwViewData['print_data_renovation'.$a] = $print_data;
			
			$namesql = "Select * from document_renovation_name where dpn_bsn_id = ". $bus_id . " and dpn_proposal_number =  ".$a;
			$namedata_more = $fwDb -> queryOne($namesql);
			
			if(!empty($namedata_more)) {
						if($a==2) {
						  $fwViewData['dpn_name_2'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_2'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_2'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_2'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_architect_2'] = $namedata_more['dpn_architect'];
						  $fwViewData['dpn_project_type_2'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_2'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_2'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_2'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_2'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_2'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_hia_signed_2'] = $namedata_more['dpn_hia_signed'];
						   
						   if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_2'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_2'] = $_SESSION['user']['user_name'];
								
							}

						   
						   if(!empty($namedata_more['dpn_created_date_2']))
								{
								$fwViewData['dpn_created_date_2'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_2'] = date('d-m-Y');
								
							}
						   
						   
						  
						 // $fwViewData['dpn_you_winter_2'] = $namedata_more['dpn_you_winter'];
						 // $fwViewData['dpn_you_summer_2'] = $namedata_more['dpn_you_summer'];
						  $fwViewData['dpn_budget_2'] = $namedata_more['dpn_budget'];
						}elseif ($a==3) {
						  $fwViewData['dpn_name_3'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_3'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_3'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_3'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_architect_3'] = $namedata_more['dpn_architect'];
						  $fwViewData['dpn_project_type_3'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_3'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_3'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_3'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_3'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_3'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_hia_signed_3'] = $namedata_more['dpn_hia_signed'];
						  
						    
						   if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_3'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_3'] = $_SESSION['user']['user_name'];
								
							}
						   
						 	   
						    if(!empty($namedata_more['dpn_created_date_3']))
								{
								$fwViewData['dpn_created_date_3'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_3'] = date('d-m-Y');
								
							}
						  
						  //$fwViewData['dpn_you_winter_3'] = $namedata_more['dpn_you_winter'];
						  //$fwViewData['dpn_you_summer_3'] = $namedata_more['dpn_you_summer'];						  
						  
						  $fwViewData['dpn_budget_3'] = $namedata_more['dpn_budget'];
						}elseif ($a==4) {
						  $fwViewData['dpn_name_4'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_4'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_4'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_4'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_architect_4'] = $namedata_more['dpn_architect'];
						  $fwViewData['dpn_project_type_4'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_4'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_4'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_4'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_4'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_4'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_hia_signed_4'] = $namedata_more['dpn_hia_signed'];
	
						    
						    if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_4'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_4'] = $_SESSION['user']['user_name'];
								
							}
						   
							   
						    if(!empty($namedata_more['dpn_created_date_4']))
								{
								$fwViewData['dpn_created_date_4'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_4'] = date('d-m-Y');
								
							}	
	
						  //$fwViewData['dpn_you_winter_4'] = $namedata_more['dpn_you_winter'];
						  //$fwViewData['dpn_you_summer_4'] = $namedata_more['dpn_you_summer'];						  
						  
						  
						  $fwViewData['dpn_budget_4'] = $namedata_more['dpn_budget'];
						}elseif ($a==5) {
						  $fwViewData['dpn_name_5'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_5'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_5'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_5'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_architect_5'] = $namedata_more['dpn_architect'];
						  $fwViewData['dpn_project_type_5'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_5'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_5'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_5'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_5'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_5'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_hia_signed_5'] = $namedata_more['dpn_hia_signed'];
						  
						 	   
						    if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_5'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_5'] = $_SESSION['user']['user_name'];
								
							}
						   
						     
						   
						    if(!empty($namedata_more['dpn_created_date_5']))
								{
								$fwViewData['dpn_created_date_5'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_5'] = date('d-m-Y');
								
							}
						  
						  //$fwViewData['dpn_you_winter_5'] = $namedata_more['dpn_you_winter'];
						  //$fwViewData['dpn_you_summer_5'] = $namedata_more['dpn_you_summer'];						  
						  
						  $fwViewData['dpn_budget_5'] = $namedata_more['dpn_budget'];
					
						
						}
						
			     }
			}
			
		}		

		break;
				
		
		case "checklist":
			$fwViewData['iframe_data'] = 1;

			$doc_id = $fwRequest -> getParamget('doc_id','');
				
			if(!empty($doc_id))
			{
					$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name 
							FROM document_check_list as dcl
							
							INNER JOIN admin_document_check_list as adcl
							ON dcl.doc_name_id = adcl.admin_doc_id
							
							LEFT JOIN users as u
							ON dcl.doc_user_name = u.user_id
							
							WHERE dcl.doc_id = $doc_id";
		
				$doc_data = $fwDb->queryOne($sql_edit_data);
							
				if($doc_data['doc_date_uploaded']!=0)
				{
					$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
				}
				else
				{
					$doc_data['doc_date_uploaded'] = '';
				}
				
				$fwViewData['doc_data'] = $doc_data;

				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest -> getParam('submit_iframe','');
				if(!empty($submit_iframe))
				{
				ini_set('display_errors', 'On');
					$doc = $fwRequest -> getParam('doc','');

						if($_FILES['image']['error'] == 0)
						{
							$docfile = $_FILES['image']['name'];
							$file_type = $_FILES['image']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['image']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
							
							upload($docfile, $src);			
							
							$doc['doc_file_name']= $docfile;
							$doc['doc_user_name'] = $_SESSION['user']['user_id'];
							$doc['doc_date_uploaded'] = date('Y-m-d H:i');
							
							//if (!move_uploaded_file($src, $destination))
//							{
//								echo "Possible file upload attack";
//							}
//							else
//							{
//								$doc['doc_file_name']= $docfile;
//								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
//								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
//								chmod($destination, 0664);
//							}
						}
						
						if(empty($doc['doc_file_name']) AND !empty($doc['doc_file_name_temp']))
						{
							$doc['doc_file_name'] = $doc['doc_file_name_temp'];
							unset($doc['doc_file_name_temp']);
							
						}
						elseif(empty($doc['doc_file_name']))
						{
							$doc['doc_file_name'] = '';
							$doc['doc_date_uploaded']='';
							$doc['doc_user_name']='';
						}
						
						
						if(empty($doc['doc_upload_to_dossier']))
						{
							$doc['doc_upload_to_dossier'] = 0;
						}
						
						if(empty($doc['doc_not_avail']))
						{
							$doc['doc_not_avail'] = 0;
						}
						

						$doc_id = $doc['doc_id'];
						unset($doc['doc_id']);
						unset($doc['doc_file_name_temp']);
						$document_check_listTable = new Fw_Db_Table('document_check_list');
						$document_check_listTable -> setWhere("doc_id = $doc_id");
						$document_check_listTable -> updateRow($doc);
						$fwViewData['iframe_data'] = 0;
						$fwViewData['iframe_msg'] = '1';		
										
				}
				//******* End Store value in DB after submit*********//
			}
		break;
				
		case "checklistrenovation":
			$fwViewData['iframe_data_renovation'] = 1;

			$doc_id =  $fwRequest -> getParamget('doc_id','');
			$chk_num = $fwRequest -> getParamget('chknm','');
			//db($chk_num);
			//exit;	
			if(!empty($doc_id))
			{
					$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name 
							FROM document_check_list_renovation as dcl
							
							INNER JOIN admin_document_check_list_renovation as adcl
							ON dcl.doc_name_id = adcl.admin_doc_id
							
							LEFT JOIN users as u
							ON dcl.doc_user_name = u.user_id
							
							WHERE dcl.doc_id = $doc_id";
		
				$doc_data = $fwDb->queryOne($sql_edit_data);
							
				if($doc_data['doc_date_uploaded']!=0)
				{
					$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
				}
				else
				{
					$doc_data['doc_date_uploaded'] = '';
				}
				
				$fwViewData['doc_data'] = $doc_data;
				
				
				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest -> getParam('submit_iframe_renovation','');
				if(!empty($submit_iframe))
				{
				ini_set('display_errors', 'On');
					$doc = $fwRequest -> getParam('doc','');
					$dnum = $doc['doc_checklist_number'];
						if($_FILES['image']['error'] == 0)
						{
							$docfile = $_FILES['image']['name'];
							$file_type = $_FILES['image']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['image']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							upload($docfile, $src);
							
							$doc['doc_file_name']= $docfile;
							$doc['doc_user_name'] = $_SESSION['user']['user_id'];
							$doc['doc_date_uploaded'] = date('Y-m-d H:i');
						
							//if (!move_uploaded_file($src, $destination))
//							{
//								echo "Possible file upload attack";
//							}
//							else
//							{
//								$doc['doc_file_name']= $docfile;
//								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
//								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
//								chmod($destination, 0664);
//							}
						}
						
						if(empty($doc['doc_file_name']) AND !empty($doc['doc_file_name_temp']))
						{
							$doc['doc_file_name'] = $doc['doc_file_name_temp'];
							unset($doc['doc_file_name_temp']);
							
						}
						elseif(empty($doc['doc_file_name']))
						{
							$doc['doc_file_name'] = '';
							$doc['doc_date_uploaded']='';
							$doc['doc_user_name']='';
						}
						
						
						if(empty($doc['doc_upload_to_dossier']))
						{
							$doc['doc_upload_to_dossier'] = 0;
						}
						
						if(empty($doc['doc_not_avail']))
						{
							$doc['doc_not_avail'] = 0;
						}
						

						$doc_id = $doc['doc_id'];
						unset($doc['doc_id']);
						unset($doc['doc_file_name_temp']);
						$document_check_listTable = new Fw_Db_Table('document_check_list_renovation');
						//$document_check_listTable -> setWhere("doc_id = $doc_id");
						$document_check_listTable -> setWhere("doc_id = " .$doc_id . " AND doc_checklist_number =  ".$dnum);
						$document_check_listTable -> updateRow($doc);
						$fwViewData['iframe_data_renovation'] = 0;
						$fwViewData['iframe_msg_renovation'] = '1';		
										
				}
				//******* End Store value in DB after submit*********//
			}
		break;
		
		case "adddoc_checklistrenovation":
		
			$fwViewData['iframe_data_renovation_adddoc'] = 1;
			$doc_id = $fwRequest -> getParamget('doc_id','');
			$chknm = $fwRequest -> getParamget('chknm',0);
			
			$fwViewData['renovation_doc_id']= $fwRequest -> getParamget('doc_id','');
			$fwViewData['renovation_chknm'] = $fwRequest -> getParamget('chknm',0);
			$fwViewData['renovation_bus_id'] = $fwRequest -> getParamget('bus_id',0);
			
			$custom_renovation = new Fw_Db_Table('custom_document_check_list_renovation');
			$custom_renovation->setWhere("cdc_id = $doc_id");
			$fwViewData['cdetail'] = $custom_renovation->getRow();
			

				$submit_iframe = $fwRequest -> getParam('submit_iframe_renovation_doc','');
				if(!empty($submit_iframe))
				{
					$renovationdetail = $fwRequest->getParam('renovation', array());
					$bsn_id_m = $fwRequest -> getParamget('bsn_id_m','');
					$bus_id = $fwRequest -> getParamget('bus_id','');
		
						if($_FILES['custom_renovation']['error'] == 0)
						{
							$docfile_renovation = $_FILES['custom_renovation']['name'];
							$file_type = $_FILES['custom_renovation']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile_renovation = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_renovation);
							$src = $_FILES['custom_renovation']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile_renovation;
							
							upload($docfile_renovation, $src);			
							
							$doc['doc_file_name']= $docfile;
							$doc['doc_user_name'] = $_SESSION['user']['user_id'];
							$doc['doc_date_uploaded'] = date('Y-m-d H:i');
							
							$renovationdetail['cdc_file_name']= $docfile_renovation;
							$renovationdetail['cdc_date_uploaded'] = date('Y-m-d H:i');
							
							//if (!move_uploaded_file($src, $destination))
//							{
//								echo "Possible file upload attack";
//							}
//							else
//							{
//								//$renovationdetail['cdc_bsn_id']= $bus_id;
//								$renovationdetail['cdc_file_name']= $docfile_renovation;
//								
//								$renovationdetail['cdc_date_uploaded'] = date('Y-m-d H:i');
//								chmod($destination, 0664);
//							}
						}
					
					
					if(empty($renovationdetail['cdc_file_name']) AND !empty($renovationdetail['cdc_file_name_temp']))
						{
							$renovationdetail['cdc_file_name'] = $cdc['doc_file_name_temp'];
							unset($renovationdetail['cdc_file_name_temp']);
							
						}
						elseif(empty($renovationdetail['cdc_file_name']))
						{
							$renovationdetail['cdc_file_name'] = '';
							$renovationdetail['cdc_date_uploaded']='';
							$renovationdetail['cdc_user_name']='';
						}
					
					
					$renovationdetail['cdc_bsn_id']= $bus_id;
					$renovationdetail['cdc_user_name'] = $_SESSION['user']['user_name'];
					$custom_renovation = new Fw_Db_Table('custom_document_check_list_renovation');
					
					$doc_id = $fwRequest -> getParamget('doc_id','');
				
					if(!empty($doc_id))
					{
						$custom_renovation -> setWhere("cdc_id = $doc_id");
						$custom_renovation -> updateRow($renovationdetail);
					}
					else
					   {
						   $renovationdetail['cdc_checklist_number'] = $chknm; 
						   $custom_renovation -> insertRow($renovationdetail);
					   }
			
					$fwViewData['iframe_data_renovation_adddoc'] = 0;
					//header('Location: '.$_SERVER['REQUEST_URI']);
					echo "<script type='text/javascript'>parent.hideiFrame('adddoc_checkListIframeRenovation','');</script>";
					echo "<script type='text/javascript'>parent.requestDocumentCheckListRenovation();</script>";
				}
			
		break;			
		
				
		// custom document check list
		
		case "cchecklist":
			$fwViewData['iframe_cdata'] = 1;

			$doc_id = $fwRequest -> getParamget('doc_id','');
							
			if(!empty($doc_id))
			{
				$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name 
							FROM document_check_list as dcl
							INNER JOIN admin_custom_document_check_list as adcl
							ON dcl.doc_type_id = adcl.admin_cdoc_id
							LEFT JOIN users as u
							ON dcl.doc_user_name = u.user_id
							WHERE dcl.doc_id = $doc_id";
		
				$doc_data = $fwDb->queryOne($sql_edit_data);
							
				if($doc_data['doc_date_uploaded']!=0)
				{
					$doc_data['doc_date_uploaded'] = changedate_d_m_Y($doc_data['doc_date_uploaded'])." ".changetime_h_m($doc_data['doc_date_uploaded']);	
				}
				else
				{
					$doc_data['doc_date_uploaded'] = '';
				}
				
				$fwViewData['doc_data'] = $doc_data;
				
				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest -> getParam('submit_iframe','');
				if(!empty($submit_iframe))
				{
				ini_set('display_errors', 'On');
					$doc = $fwRequest -> getParam('doc','');

						if($_FILES['image']['error'] == 0)
						{
							$docfile = $_FILES['image']['name'];
							$file_type = $_FILES['image']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['image']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							upload($docfile, $src);
							
							$doc['doc_file_name']= $docfile;
							$doc['doc_user_name'] = $_SESSION['user']['user_id'];
							$doc['doc_date_uploaded'] = date('Y-m-d H:i');
							
							//if (!move_uploaded_file($src, $destination))
//							{
//								echo "Possible file upload attack";
//							}
//							else
//							{
//								$doc['doc_file_name']= $docfile;
//								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
//								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
//								chmod($destination, 0664);
//							}
						}
						
						if(empty($doc['doc_file_name']) AND !empty($doc['doc_file_name_temp']))
						{
							$doc['doc_file_name'] = $doc['doc_file_name_temp'];
							unset($doc['doc_file_name_temp']);
							
						}
						elseif(empty($doc['doc_file_name']))
						{
							$doc['doc_file_name'] = '';
							$doc['doc_date_uploaded']='';
							$doc['doc_user_name']='';
						}
						
						
						if(empty($doc['doc_upload_to_dossier']))
						{
							$doc['doc_upload_to_dossier'] = 0;
						}
						
						if(empty($doc['doc_not_avail']))
						{
							$doc['doc_not_avail'] = 0;
						}
						

						$doc_id = $doc['doc_id'];
						unset($doc['doc_id']);
						unset($doc['doc_file_name_temp']);
						$document_check_listTable = new Fw_Db_Table('document_check_list');
						$document_check_listTable -> setWhere("doc_id = $doc_id");
						$document_check_listTable -> updateRow($doc);
						$fwViewData['iframe_cdata'] = 1;
						$fwViewData['iframe_msg'] = '1';	
						$fwViewData['iframe_close'] = 1;					
				}
				//******* End Store value in DB after submit*********//
			}
		break;
		// custom check list ends
		
		case "countTask" :
			$bus_id = $fwRequest -> getParamget('bus_id','');
			
		  	$sql_countTaskTotal = "SELECT count(bt_id) as total FROM business_tasks
								WHERE bt_bsn_id = $bus_id";
								
			$total = $fwDb -> queryOne($sql_countTaskTotal);
			
			
			$sql_countTaskCompleted = "SELECT count(bt_id) as completed FROM business_tasks
								WHERE bt_bsn_id = $bus_id AND bt_complete = 1";
								
			$total_completed = $fwDb -> queryOne($sql_countTaskCompleted);
			
			if($total['total']>0)
			{
				if(empty($total_completed['completed']))
				{
					$total_completed['completed'] = 0;
				}
				
				echo $total_completed['completed']."/".$total['total'];
			}
		break;
		
		
		

		case 'documents':
			$fwViewData['showDocumentsIframe'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
			
			
			if($tableid>0)
			{
				$sql = "SELECT bd.*, c.customer_name FROM business_documents as bd
						LEFT JOIN customers as c
						ON bd.bd_user_id = c.user_id
						WHERE bd.bd_id = $tableid ";
						
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;
			}			
			$business_documentsTable = new Fw_Db_Table('business_documents');
			$subDocument = $fwRequest -> getParam('subDocument','');
			
			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
							
				if(!$data['bd_upload_dossier']){$data['bd_upload_dossier'] = $data['bd_upload_dossier'] = 0;}
				
				$document = $_FILES['document'];

				
				if($_FILES['document']['error'] == 0)
						{
							$docfile = $_FILES['document']['name'];
							$file_type = $_FILES['document']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['document']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							$destination = 'https://deckquote.s3.amazonaws.com/files/business_documents/'.$docfile;
							
							upload_fdch($src,$docfile);
							unset($data['bd_doc_name']);
							$data['bd_doc_name'] = $docfile;
							
							
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							//else
//							{
//								if (!move_uploaded_file($src, $destination))
//								{
//									echo "Possible file upload attack";
//								}
//								else
//								{
//									unset($data['bd_doc_name']);
//									$data['bd_doc_name'] = $docfile;
//									chmod($destination, 0664);
//								}
//							}	
						}

			if(empty($file_exist_error))	
				{	
					if(!empty($data['bd_doc_name']))
					{
						
						
						
						if(!empty($data['bd_id']) AND $data['bd_id']>0)
						{
							$bd_id = $data['bd_id'];
							unset($data['bd_id']);
							$business_documentsTable -> setWhere("bd_id = $bd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$data['bd_user_id'] = $_SESSION['user']['user_id'];
							$data['bd_uploaded_date'] = date('Y-m-d H:i');
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['success_msg'] = $success_msg;
						$fwViewData['showDocumentsIframe'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory.... Please select the file.";
						$fwViewData['showDocumentsIframe'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showDocumentsIframe'] = 1;
				}
			}
		break;
		
		case 'showdocuments':
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getParamget('docperpage','');
			
			if($bus_id>0)
			{
				$sql = "SELECT bd.*, u.user_name FROM business_documents as bd
						LEFT JOIN users as u ON bd.bd_user_id = u.user_id
						WHERE bd.bd_bsi_id = $bus_id AND bd.bd_doc_inner = 0
						ORDER BY bd.bd_id DESC";
						
				$detail = $fwDb -> query($sql);
				/*************** Begin Pagination *****************/
				$userData = $detail;
			if(!empty($userData))
							{
							
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
							
								$rows = count($userData);
								
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 5;
								}
								
								$fwViewData['perpage'] =  $page_rows;
								
								
								$last = ceil($rows/$page_rows); 
								
								if ($pagenum <= 1)
								{
									$pagenum = 1;
								}
								elseif ($pagenum > $last)
								{
									$pagenum = $last;
								}
								$fwViewData['last'] = $last;
								$fwViewData['lastone'] = $last-1;
								$fwViewData['lasttow'] = $last-2;
								$fwViewData['pagenum'] = $pagenum;
								$pagenatedatanext = $pagenum;
								$pagenatedataprev = $pagenum;
								for($i=0; $i<9; $i++)
									{
									$paginate[$pagenatedatanext] = $pagenatedatanext;
									$pagenatedatanext ++;
									}
									$fwViewData['paginatenext'] = $paginate;
								$pagenatedataprev = $pagenum;	
								for($i=0; $i<9; $i++)
									{
									$paginateprev[$pagenatedataprev] = $pagenatedataprev;
									$pagenatedataprev --;
									}
								$fwViewData['paginateprev'] = array_reverse($paginateprev);
								
								$max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
								
								$sql2 =  $sql." ".$max;
							if($sql2){$new_detail= $fwDb->query($sql2);}
							  $count_detail = count($new_detail);
							for($i=0; $i<$count_detail; $i++)
								{
									if($new_detail[$i]['bd_uploaded_date']!=0)
									{
										$new_detail[$i]['bd_uploaded_date'] = changedate_d_m_Y($new_detail[$i]['bd_uploaded_date'])." ".changetime_h_m($new_detail[$i]['bd_uploaded_date']);	
									}
									else
									{
										$new_detail[$i]['bd_uploaded_date'] = '';
									}
								}
							  $fwViewData['documents_data'] = $new_detail;
							}
			/*************** End Pagnation ********************/
				$fwViewData['documents_data_show'] = "Show";
								$fwViewData['divid'] = $divid;
				
			}
		break;

		
		
		//inner documents//
		case 'intdocuments':
			$fwViewData['showDocumentsIframe'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
	
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
			
			
			if($tableid>0)
			{
				$sql = "SELECT bd.*, c.customer_name FROM business_documents as bd LEFT JOIN customers as c ON bd.bd_user_id = c.user_id WHERE bd.bd_id = $tableid";
						
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;

			}
						
			$business_documentsTable = new Fw_Db_Table('business_documents');
			$subDocument = $fwRequest -> getParam('subDocument','');
			$fwViewData['inrenaldocuments'] = "inrenaldocuments";	
			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
				if(!$data['bd_upload_dossier']){$data['bd_upload_dossier'] = $data['bd_upload_dossier'] = 0;}
				
				$document = $_FILES['document'];
				if($_FILES['document']['error'] == 0)
						{
							$docfile = $_FILES['document']['name'];
							$file_type = $_FILES['document']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['document']['tmp_name'];
							//$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
							
							$destination = 'https://deckquote.s3.amazonaws.com/files/business_documents/'.$docfile;
							
							upload_fdch($src,$docfile);


							unset($data['bd_doc_name']);
							$data['bd_doc_name'] = $docfile;
							
								
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							//else
//							{
//								if (!move_uploaded_file($src, $destination))
//								{
//									echo "Possible file upload attack.";
//								}
//								else
//								{
//									unset($data['bd_doc_name']);
//									$data['bd_doc_name'] = $docfile;
//									chmod($destination, 0664);
//								}
//							}	
						}
					
			
			if(empty($file_exist_error))	
				{	
					if(!empty($data['bd_doc_name']))
					{
						$data['bd_user_id'] = $_SESSION['user']['user_id'];
						$data['bd_uploaded_date'] = date('Y-m-d H:i');
	
						if(!empty($data['bd_id']) AND $data['bd_id']>0)
						{
							$bd_id = $data['bd_id'];
							unset($data['bd_id']);
							
							$business_documentsTable -> setWhere("bd_id = $bd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['success_msg'] = $success_msg;
						$fwViewData['showDocumentsIframe'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory. Please upload the Document.";
						$fwViewData['showDocumentsIframe'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showDocumentsIframe'] = 1;
				}
			}
		break;
		

		
	
  }
} 

$submit = $fwRequest->getParam('not_required_save', '');

$sqlPtask = "Select count(*) as tot from renovation_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 1" ;
$taskData = $fwDb->queryOne($sqlPtask);
$fwViewData['tot'] = $taskData['tot'];

$sqlPtask2 = "Select count(*) as tot2 from renovation_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 2" ;
$taskData2 = $fwDb->queryOne($sqlPtask2);
$fwViewData['tot2'] = $taskData2['tot2'];

$sqlPtask3 = "Select count(*) as tot3 from renovation_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 3" ;
$taskData3 = $fwDb->queryOne($sqlPtask3);
$fwViewData['tot3'] = $taskData3['tot3'];

$sqlPtask4 = "Select count(*) as tot4 from renovation_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 4" ;
$taskData4 = $fwDb->queryOne($sqlPtask4);
$fwViewData['tot4'] = $taskData4['tot4'];

$sqlPtask5 = "Select count(*) as tot5 from renovation_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 5" ;
$taskData5 = $fwDb->queryOne($sqlPtask5);
$fwViewData['tot5'] = $taskData5['tot5'];



$sqldone = "Select count(*) as done from renovation_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 1";
$taskdone = $fwDb->queryOne($sqldone);
$fwViewData['done'] = $taskdone['done'];

$sqldone2 = "Select count(*) as done2 from renovation_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 2";
$taskdone2 = $fwDb->queryOne($sqldone2);
$fwViewData['done2'] = $taskdone2['done2'];

$sqldone3 = "Select count(*) as done3 from renovation_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 3";
$taskdone3 = $fwDb->queryOne($sqldone3);
$fwViewData['done3'] = $taskdone3['done3'];

$sqldone4 = "Select count(*) as done4 from renovation_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 4";
$taskdone4 = $fwDb->queryOne($sqldone4);
$fwViewData['done4'] = $taskdone4['done4'];

$sqldone5 = "Select count(*) as done5 from renovation_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 5";
$taskdone5 = $fwDb->queryOne($sqldone5);
$fwViewData['done5'] = $taskdone5['done5'];