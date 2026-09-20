<?php
$fwMainView = 'file:' . getcwd() . '/common.tpl';
$fwViewData['calcjs'] ='file:' . getcwd() . '/calcjs.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$editrequset = $fwRequest->getparamget('e_req', '');

$iPad    = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
$fwViewData['ipad'] = $iPad;

$fwViewData['ran'] =  rand(100000,999999);

if($requset)
{
		switch ($requset) {
		
		case 'quotes':
						$bus_id = $fwRequest -> getparamget('bus_id','');	
						$tablequote = new Fw_Db_Table('project_quote_data');
						$tablequotetotal = new Fw_Db_Table('project_quote_data_total');
			
			// Decking Value Load				
			$submit = $fwRequest -> getparam('submit','');	
			$dvalue = $fwRequest -> getparam('decking_value_set','');	
			if($dvalue)
			{
				$ddata = $fwRequest -> getparam($TABLE,'');
				$ctyid = $ddata['cd_type_id'];
				$fwViewData['ctyid'] = $ctyid;
				
				$sql = "SELECT * FROM calculator_decking_new WHERE cd_type_id = ".$ctyid;
				$dcaldata = $fwDb->query($sql);
				$fwViewData['dcaldata'] = $dcaldata; 
			}			
			// Decking Value Load End	
			
			// Wrapping Value Load
			$wvalue = 	$fwRequest -> getparam('wrapping_value_set','');	
			if($wvalue)
			{						
				$sql = "SELECT * FROM calculator_wrapping";
				$wrapdata = $fwDb->query($sql);
				$fwViewData['wrapdata'] = $wrapdata; 
			}
			// Wrapping Vaue Load Ends
			
			
			// SubFrame Value Load
			$sfvalue = 	$fwRequest -> getparam('subframe_value_set','');	
			if($sfvalue)
			{						
				$sql = "SELECT * FROM calculator_subframe";
				$sfdata = $fwDb->query($sql);
				$fwViewData['sfdata'] = $sfdata; 
			}
			// SubFrame Vaue Load Ends
			
			// Handrail Value Load
			$hrvalue = 	$fwRequest -> getparam('handrail_value_set','');	
			if($hrvalue)
			{						
				$sql = "SELECT * FROM calculator_handrail";
				$hrdata = $fwDb->query($sql);
				$fwViewData['hrdata'] = $hrdata; 
			}
			// Handrail Vaue Load Ends
			$stvalue = 	$fwRequest -> getparam('stairs_value_set','');	
			if($stvalue)
			{						
				$sql = "SELECT * FROM calculator_stairs";
				$stdata = $fwDb->query($sql);
				$fwViewData['stdata'] = $stdata; 
			}
			// Handrail Vaue Load Ends
							
			// Extras Vaue Load Ends
			$exvalue = 	$fwRequest -> getparam('extras_value_set','');	
			if($exvalue)
			{						
				$sql = "SELECT * FROM calculator_extras";
				$exdata = $fwDb->query($sql);
				$fwViewData['exdata'] = $exdata; 
			}
			// Extras Vaue Load Ends
			
			if($submit)				
				{
				$qdata = $fwRequest -> getparam($TABLE,'');
				 for($i=0; $i < count($qdata['pqd_key_id']); $i++)
					{
					$tablequote->setWhere("pqd_pr_id = {$bus_id} AND pqd_key_id = {$qdata['pqd_key_id'][$i]}");
					$qidata['pqd_pr_id'] = $bus_id;
					$qidata['pqd_key_id'] = $qdata['pqd_key_id'][$i];
					$qidata['pqd_target_values'] =$qdata['pqd_target_values'][$i];
					$qidata['pqd_quote_target_per'] = $qdata['pqd_quote_target_per'][$i];
					$qidata['pqd_quote_values'] = $qdata['pqd_quote_values'][$i];
					$qidata['pqd_quote_per'] = $qdata['pqd_quote_per'][$i];
					$qidata['pqd_acutal_values'] = $qdata['pqd_acutal_values'][$i];
					$qidata['pqd_acutal_per'] = $qdata['pqd_acutal_per'][$i];
					$qidata['pqd_variance_values'] = $qdata['pqd_variance_values'][$i];
					if($tablequote->rowExists()){ $tablequote->updateRow($qidata); }else{ $tablequote->insertRow($qidata); }
					}
				}					
							if($qdata['TE']){
							$qdata['TE']['pqdt_key_id'] = 'TE';
							$qdata['TE']['pqdt_pr_id'] = $bus_id;
							
							$datate = $qdata['TE'];
							$tablequotetotal->setWhere("pqdt_pr_id = {$bus_id} AND pqdt_key_id = 'TE'");
							if($tablequotetotal->rowExists())
								{
								$tablequotetotal->updateRow($datate);
								}else{
								$tablequotetotal->insertRow($datate);
								}
							}
							if($qdata['PF']){
							$qdata['PF']['pqdt_key_id'] = 'PF';
							$qdata['PF']['pqdt_pr_id'] = $bus_id;
							$datate = $qdata['PF'];
							$tablequotetotal->setWhere("pqdt_pr_id = {$bus_id} AND pqdt_key_id = 'PF'");
							if($tablequotetotal->rowExists())
								{
								$tablequotetotal->updateRow($datate);
								}else{
								$tablequotetotal->insertRow($datate);
								}
							}
							
							if($qdata['TPG']){
							$qdata['TPG']['pqdt_key_id'] = 'TPG';
							$qdata['TPG']['pqdt_pr_id'] = $bus_id;
							$datate = $qdata['TPG'];
							$tablequotetotal->setWhere("pqdt_pr_id = {$bus_id} AND pqdt_key_id = 'TPG'");
							if($tablequotetotal->rowExists())
								{
								$tablequotetotal->updateRow($datate);
								}else{
								$tablequotetotal->insertRow($datate);
								}
							}
	
						if($bus_id)
							{
								$sql = "SELECT * FROM project_cost_centres WHERE pcc_status = 'Active' Order By pcc_order ASC";
								$resultQdata = $fwDb->query($sql);
								$fwViewData['quotesdata'] = $resultQdata; 
			
								$tablequote->setWhere("pqd_pr_id = {$bus_id}");	
								$fwViewData['quotedata'] = 	$tablequote->getRows();	
								
								$tablequotetotal->setWhere("pqdt_pr_id = {$bus_id}");	
								$fwViewData['quotedatatot'] = $tablequotetotal->getRows();							
							}
						$fwViewData['p_id'] = $bus_id;	
						$fwViewData['button_text'] = "Insert Into Job Sheet";										
		break;					
		case 'GDSend':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id)
								{
								 $tablecust = new Fw_Db_Table('bus_customers');
								 $tablecust->setWhere('bcust_id ='.$cust_id);
								$custData = $tablecust->getRow();	
								if(send_general_disclamer($custData['bcust_fname'], $custData['bcust_lname'], $custData['bcust_misc_email1']))
									{
									 echo "set";
								 	}
								 }	
							exit;
		break;
		
		case 'BFinance':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id){if(send_template_email('Buyer Finance', $cust_id, '', 2)){ echo "set";}else{ echo "error";} }	
							exit;
		break;
		
		
		case 'BInfo':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id){if(send_template_email('Free Buyer Info', $cust_id, '', 2)){ echo "set";}else{ echo "error";} }	
							exit;
		break;
		
		
		case 'BSurvey':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id){if(send_template_email('Buyer Survey', $cust_id, '', 2)){ echo "set";}else{ echo "error";} }	
							exit;
		break;
		
		
		case 'BQuestion':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id){if(send_template_email('Business Question', $cust_id, '', 2)){ echo "set";}else{ echo "error";} }	
							exit;
		break;
		
		
		case 'MListing':
								$cust_id = $fwRequest->getparamget('cust_id', '');
								if($cust_id){if(send_template_email('Monthly Listing', $cust_id, '', 2)){ echo "set";}else{ echo "error";} }	
							exit;
		break;
		
		case 'RDossier':
								$cust_id = $fwRequest->getparamget('cust_id', 0);
								$bus_id = $fwRequest->getparamget('bus_id', 0);
								$edl_be_id = $fwRequest->getparamget('edl_be_id', 0);
								if($cust_id > 0){ echo send_all_edossier($cust_id, $bus_id, $edl_be_id);}	
							exit;
		break;
		
		
		
		case 'send_email':
								$bus_email_id = $fwRequest->getparamget('busid', '');
								if($bus_email_id)
								{
								 $_SESSION['attach']['bus_email_id']= $bus_email_id; 
								 }
								 echo "set";
									exit;
		break;
		case 'curdate':
						$d_id = $fwRequest->getparamget('b', 0);
						$t_id = $fwRequest->getparamget('c', 0);
						
						$current_date = date('d-m-Y');
						$current_time = date('H:i');
						print($d_id."|".$current_date."|".$t_id."|".$current_time);
						exit;
		break;
		case 'showelog':
						
						$bus_id = $fwRequest -> getparamget('bus_id','');
						$pagenum = $fwRequest -> getparamget('pagenum','');
			
						if($bus_id)
						{
						
	$sql_elog = "Select e_dossier_log.*, business.bsn_id, business.bsn_name, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, users.user_name 	  FROM e_dossier_log
	  Left join business on e_dossier_log.edl_bus_id = business.bsn_id
	  Left join bus_customers on e_dossier_log.edl_cust_id = bus_customers.bcust_id
	  Left join users on e_dossier_log.edl_user_id = users.user_id
	  WHERE e_dossier_log.edl_bus_id = ".$bus_id." ORDER BY e_dossier_log.edl_id DESC";
						
						$userData = $fwDb->query($sql_elog);
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
								
								$sql2 =  $sql_elog." ".$max;
							
							if($sql2){$new_detail= $fwDb->query($sql2);}
							$fwViewData['resultEdlogs'] = $new_detail;
							}
						}						
		break;
		
		
		case 'showelogdelete':
						$id = $fwRequest->getparamget('id', 0);
						$tabledelete = new Fw_Db_Table('e_dossier_log');
						$tabledelete->setWhere('edl_id ='.$id);
						$tabledelete->deleteRow();
				
		break;
		
		case 'advertdelete':
						$id = $fwRequest->getparamget('id', 0);
						$tabledelete = new Fw_Db_Table('seller_listing');
						$tabledelete->setWhere('sl_id ='.$id);
						$tabledelete->deleteRow();
						DB("ok");
						exit;
		break;
		
		
		case 'adverts':
						$bus_id = $fwRequest -> getparamget('bus_id','');
						$pagenum = $fwRequest -> getparamget('pnum','');
						if($bus_id)
						{
			 $sql_adv = "Select seller_listing.*, business.bsn_id, business.bsn_name, enquirysource.soe_id, enquirysource.soe_name, states.s_district FROM seller_listing
	         Left join business on seller_listing.sl_business_id = business.bsn_id
			 Left join states on seller_listing.sl_website_type = states.s_id
			 Left join enquirysource on seller_listing.sl_website_id = enquirysource.soe_id	WHERE seller_listing.sl_business_id = ".$bus_id." ORDER BY seller_listing.sl_website_id DESC";
			
						$userData = $fwDb->query($sql_adv);
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
								
								$sql2 =  $sql_adv." ".$max;
							
							if($sql2){$new_detail= $fwDb->query($sql2);}
							$fwViewData['resultAdverts'] = $new_detail;
							}	 
						}									
		break;
		
		case 'pricerange':
						$bus_id = $fwRequest -> getparamget('bus_id','');
						$pagenum = $fwRequest -> getparamget('pnum','');
						if($bus_id)
						{
			 $sql_adv = "Select bus_price_ranges.*, business.bsn_id, business.bsn_name, enquirysource.soe_id, enquirysource.soe_name, states.s_district FROM bus_price_ranges
	         Left join business on bus_price_ranges.bpr_bus_id = business.bsn_id
			 Left join seller_listing on bus_price_ranges.bpr_adv_id = seller_listing.sl_id
			 Left join states on seller_listing.sl_website_type = states.s_id
			 Left join enquirysource on seller_listing.sl_website_id = enquirysource.soe_id
			 WHERE bus_price_ranges.bpr_bus_id = ".$bus_id." ORDER BY bus_price_ranges.bpr_timestamp DESC";
	
						$userData = $fwDb->query($sql_adv);
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
								
								$sql2 =  $sql_adv." ".$max;
							if($sql2){$new_detail= $fwDb->query($sql2);}
							$fwViewData['resultPriceranges'] = $new_detail;
							}	 
						}									
		break;
		
		
		case 'othercontactdelete':
						$id = $fwRequest->getparamget('id', 0);
						$tabledelete = new Fw_Db_Table('othercontact');
						$tabledelete->setWhere('oc_id ='.$id);
						$tabledelete->deleteRow();
				
		break;
		
		
		
		
		case 'othercontact':
						$bus_id = $fwRequest -> getparamget('bus_id','');
						$pagenum = $fwRequest -> getparamget('pnum','');
						if($bus_id)
						{
							$sql_oc = "SELECT othercontact.*, customers_type.ct_id, customers_type.ct_name FROM othercontact LEFT JOIN customers_type ON customers_type.ct_id = othercontact.oc_contact_type	WHERE oc_bsn_id = ".$bus_id;
						
							$userData = $fwDb->query($sql_oc);
						
					
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
									$page_rows = 2;
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
								
								$sql2 =  $sql_oc." ".$max;
							
							if($sql2){$new_detail= $fwDb->query($sql2);}
							$fwViewData['resultOcontact'] = $new_detail;

							
							}
							
							 
						}
						
						//$tableStates = new Fw_Db_Table('states');
						//$tableStates -> setWhere							
		break;		
		case 'subhurb':
						$suburbValue = $fwRequest -> getparamget('suburbValue','');
						
						if($suburbValue)
						{
							$sql_suburb = "SELECT * FROM states WHERE s_name LIKE '".$suburbValue."%' AND s_parent_state!='0'";
							$resultStates = $fwDb -> query($sql_suburb);
							$fwViewData['resultStates'] = $resultStates; 
						}
						
						//$tableStates = new Fw_Db_Table('states');
						//$tableStates -> setWhere							
		break;
		case 'addStatusTask':
						/*** Begin create objects for tables ****/
							$business_tasksTable = new Fw_Db_Table('business_tasks');
							$busness_statusTable = new Fw_Db_Table('busness_status');
						/*** End create objects for tables ****/
						
						$bus_id = $fwRequest -> getParamget('bus_id','');			
						$taskStatusId = $fwRequest -> getParamget('taskStatusId','');
						
						
						$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
						$type = $fwDb -> queryOne($sql_bsn_type);
						if($type){$bsn_type = $type['bsn_type'];}
				
						$sql_checkExists = "SELECT * FROM business_tasks WHERE bt_bsn_id = $bus_id AND bt_task_status_id = $taskStatusId";
						$exists = $fwDb -> query($sql_checkExists);
						

							$sql_gettasks = "SELECT 
												st.st_id, 
												st.st_name, 
												bst.bst_id,
												bst.bst_business_types, 
												bst.bst_task_name 
												FROM busness_status as st
												LEFT JOIN busness_status_task as bst
												ON st.st_id = bst.bst_business_status_id
												WHERE st.st_id = $taskStatusId";
				
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
									$detail['bt_task_status_id'] = trim($v_tos['st_id']);
									$detail['bt_task_id'] = trim($v_tos['bst_id']);
	
			$business_tasksTable->setWhere("bt_bsn_id = {$detail['bt_bsn_id']} && bt_task_status_id = {$detail['bt_task_status_id']} && bt_task_id = {$detail['bt_task_id']}");	
									
				
									if(!$business_tasksTable->rowExists() && $detail){ $business_tasksTable -> insertRow($detail);
																										
									}


								if($v_tos['bst_business_types_id'] > 0){
									
									
											$sql_gettypes = "SELECT 
												pt.pt_id, 
												pt.pt_name, 
												pst.bst_id,
												pst.bst_business_status_id, 
												pst.bst_task_name 
												FROM  project_type as pt
												INNER JOIN  project_types_task as pst
												ON pt.pt_id = pst.bst_business_status_id
												WHERE pt.pt_id = ".$v_tos['bst_business_types_id']." AND pst.bst_status = 1";
							$tasksOftypes = $fwDb-> query($sql_gettypes);
							if($tasksOftypes)
								{
									foreach($tasksOftypes as $val)
											{
									$data['bt_bsn_id'] = trim($bus_id);
									$data['bt_task_status_id'] = trim($v_tos['st_id']);
									$data['bt_task_types_id'] = trim($val['pt_id']);
									$data['bt_task_id'] = trim($val['bst_id']);
									if($data){	$business_tasksTable -> insertRow($data);
										}	
											}
									}
								}		
							
							$sql_taskStatusName = $fwDb -> queryOne("SELECT st_name FROM busness_status WHERE st_id = $taskStatusId");
							$taskmsg = "Tasks for '".$sql_taskStatusName['st_name']."' has been added successfully.";
							$fwViewData['taskmsg'] = $taskmsg;
							
								}
							//}
						}	
						
						$business_status_subtaskTable = new Fw_Db_Table('busness_status_subtask');
						$business_status_subtaskTable->setWhere('bsst_business_status_id = '. $taskStatusId);
						
						$subtaskdetail = $business_status_subtaskTable->getRows();
						
						$business_tasks_subTable = new Fw_Db_Table('business_tasks_sub');
						
						foreach($subtaskdetail as $stv)
						{
							$business_tasks_subTable->setWhere('bts_bsn_id = '. $bus_id. ' And bts_bsst_id = '.$stv['bsst_id'] );
							if(!$business_tasks_subTable->rowExists())
							{
									$std['bts_bsst_id'] = $stv['bsst_id'];
									$std['bts_bsn_id'] = $bus_id;
									$std['bts_task_status_id'] = $stv['bsst_business_status_id'];
									$std['bts_task_id'] = $stv['bsst_bst_id'];
									$std['bts_task_name'] = $stv['bsst_task_name'];
																	
									$business_tasks_subTable->insertRow($std);
							}	
			      	  }
							
							//header('Location: '.$_SERVER['REQUEST_URI']);
						//exit;
						
													
		break;
		case 'getAllTasks':
				$bus_id = $fwRequest -> getParamget('bus_id','');
				$cts = $fwRequest -> getParamget('cts','');
				$bt_task_status_id = $fwRequest -> getParamget('bt_task_status_id',0);
				$pagenum = $fwRequest -> getParamget('pagenum','');
				$perpage = $fwRequest -> getParamget('perpage',''); 
				
			$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
						$type = $fwDb -> queryOne($sql_bsn_type);
						if($type){$bsn_type = $type['bsn_type'];}	

			        $sql1 = "SELECT bt.*, bs.st_name, bst.bst_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link,
				        bst.bst_order, bst_posid, bst.bst_auto_email_text, pos.p_name,
					bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id, bsto.*
					FROM business_tasks as bt
					INNER JOIN busness_status as bs
					ON bt.bt_task_status_id = bs.st_id
					INNER JOIN  busness_status_task as bst
					ON bt.bt_task_id = bst.bst_task_id AND bt.bt_task_types_id = 0
					LEFT JOIN business_status_task_orders as bsto
					ON bt.bt_task_id = bsto.business_status_task_orders_tasks_id AND bsto.business_status_task_orders_type_id = {$bsn_type} 

					LEFT JOIN users as u
					ON bt.bt_completed_by = u.user_id
					
					LEFT JOIN email_template as et
					ON bt.bt_task_id = et.et_task AND et.et_status = 1
					
					LEFT JOIN positions as pos
					ON bst.bst_posid  = pos.p_id
					
					WHERE bt.bt_bsn_id = {$bus_id}  ";
								
					if($cts == '0' OR $cts =='1'):	$sql1 .= " AND bt.bt_complete = ".$cts; endif;
				if($bt_task_status_id > 0): $sql1 .=" AND bt.bt_task_status_id = ".$bt_task_status_id; endif;
						
						$sql1 .= " ORDER BY bt_task_status_id DESC, bst.bst_order ASC ";	
						
						//$sql1 .= " ORDER BY  pos.p_name ASC, bst.bst_order ASC ";
								
				$sql2 = "SELECT bt.*, pt.pt_name, pst.bst_task_name, pst.bst_document, pst.bst_order, 
				                u.user_name, et.et_id FROM business_tasks as bt
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
				if($bt_task_status_id > 0): $sql2 .=" AND bt.bt_task_status_id = ".$bt_task_status_id; endif;			
				
				
				$sql2 .= " ORDER BY bst_order ASC ";	
				
				
				//$sql = $sql1." UNION ".$sql2;
				//$sql = $sql1." ORDER BY bsto.business_status_task_orders_tasks_oid ASC";
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
								
								//$fwViewData['allTasks']= $fwDb->query($sql2);
								
								foreach($all as $dv)
								{
									$dv['bst_task_doc_link'] =  explode(',',$dv['bst_task_doc_link']);	
									$all2[] = $dv;
								}
								
														                           
								//$fwViewData['allTasks']= $all;
								$fwViewData['allTasks']= $all2;
								
						
								$tpsql = "select * from busness_status_task_procedures";
								$fwViewData['allTasksProc'] = $fwDb->query($tpsql);
								
								
								$tpsqlemail = "select * from emaillibrary";
								$fwViewData['emaillinks'] = $fwDb->query($tpsqlemail);
								
								
								
								}
								}
				}								
		break;
		
		//all task proposal starts
		case 'getAllTasksProposal':
				$bus_id = $fwRequest -> getParamget('bus_id','');
				$cts = $fwRequest -> getParamget('cts','');
				$cts='';
				//$bt_task_status_id = $fwRequest -> getParamget('bt_task_status_id',0);
				$tn = $fwRequest -> getParamget('bt_task_list_number','');
				$fwViewData['n'] = $tn;
				$pagenum = $fwRequest -> getParamget('pagenum','');
				$perpage = $fwRequest -> getParamget('perpage',''); 
				//$bus_id = 726;
								
			$sql_bsn_type = "SELECT bsn_type FROM business WHERE bsn_id = $bus_id";
						$type = $fwDb -> queryOne($sql_bsn_type);
						if($type){$bsn_type = $type['bsn_type'];}	

		$sql1 = "SELECT bt.*, bst.bst_id, bst.bst_task_name, bst.bst_document, bst.bst_task_doc_link, bst.bst_order, 
						bst.bst_task_id, bst.bst_instruction, bst_video_link, u.user_name, et.et_id, bsto.*
						FROM proposal_tasks as bt
						INNER JOIN  proposal_task_list as bst
						ON bt.bt_task_id = bst.bst_id AND bt.bt_task_types_id = 0
						LEFT JOIN proposal_task_list_orders as bsto
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
				                u.user_name, et.et_id FROM proposal_tasks as bt
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
				
										
								$fwViewData['allTasksProposal']= $all2;
								
								$tpsql = "select * from proposal_task_list_procedures";
								$fwViewData['allTasksProcProposal'] = $fwDb->query($tpsql);
								
								
								$elsql = "select * from proposal_task_list_email_link";
								$fwViewData['proposalEmailLink'] = $fwDb->query($elsql);
								
								}
								}
				}								
		break;
		//all task proposal ends
		
		
		case "markTaskDone":
			$bt_id = $fwRequest -> getParamget('bt_id');
			$user_id = $_SESSION['user']['user_id'];
			
			$check_markdone = "SELECT * FROM business_tasks
								WHERE bt_id = $bt_id AND bt_complete = 1";			
			
			$done = $fwDb -> query($check_markdone);
			
			if(count($done) > 0)
			{
				$taskmsg = "This Task is already been marked as Done.";
				$fwViewData['taskmsg'] = $taskmsg;
			}
			else
			{
				$sql_markdone = "UPDATE business_tasks SET bt_complete = 1, bt_completed_date = now(), bt_completed_by = $user_id WHERE bt_id = $bt_id";
								
				$fwDb -> queryOne($sql_markdone);
				
				$taskmsg = "This Task is successfully marked as Done.";
				$fwViewData['taskmsg'] = $taskmsg;
				
				auto_email_auto_text($bt_id);
			}
			
		break;
		
		case "markTaskDoneProposal":
		
			$bt_id = $fwRequest -> getParamget('bt_id');
			$user_id = $_SESSION['user']['user_id'];
			
			$check_markdone = "SELECT * FROM proposal_tasks WHERE bt_id = $bt_id AND bt_complete = 1";			
			
			$done = $fwDb -> query($check_markdone);
			
			if(count($done) > 0)
			{
				$taskmsg = "This Task is already been marked as Done.";
				$fwViewData['taskmsgproposal'] = $taskmsg;
			}
			else
			{
				$sql_markdone = "UPDATE proposal_tasks SET bt_complete = 1, bt_completed_date = now(), bt_completed_by = $user_id WHERE bt_id = $bt_id";
								
				$fwDb -> queryOne($sql_markdone);
				
				$taskmsg = "This Task is successfully marked as Done.";
				$fwViewData['taskmsgproposal'] = $taskmsg;
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
		
		case "DocumentCheckList":
			$document_check_listTable = new Fw_Db_Table('document_check_list');
			$admin_document_check_listTable = new Fw_Db_Table('admin_document_check_list');
			
			$addList = $fwRequest -> getParamget('addList','');
			$bus_id = $fwRequest -> getParamget('bus_id','');
			
	
		
		if(!empty($addList) AND $addList == 'add')
		{
			if($bus_id>0)
			{
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
								
					//$admin_document_check_listTable -> setWhere('admin_doc_status = 1 AND admin_doc_proj_type IN ('.$pt_data1. ', 0) ');
					
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					//db($data_checklist);
					//exit;
					
					$fwViewData['data_checklist'] = $data_checklist;
						
					foreach($data_checklist as $k => $v)
					{
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_name_id'] = $v['admin_doc_id'];
						$data['doc_upload_to_dossier'] = $v['admin_doc_upload_to_dossier'];
						$document_check_listTable->setWhere("doc_name_id =".$v['admin_doc_id'] .' AND doc_bsn_id = '.$bus_id);
							if(!$document_check_listTable->rowExists())
							{
							$document_check_listTable -> insertRow($data);
							}					
					}
					
					$checkListErrorMsg = "Document Checklist has been added successfully.";
					$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			else
			{
				$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
			}
		}
		
		if($bus_id>0)
		{
			//$sql_print_data = "SELECT dcl.*, adcl.*, u.user_name 
//								FROM document_check_list as dcl
//								INNER JOIN admin_document_check_list as adcl
//								ON dcl.doc_name_id = adcl.admin_doc_id
//								LEFT JOIN users as u
//								ON dcl.doc_user_name = u.user_id
//								inner join business as bs 
//								on (adcl.admin_doc_proj_type = bs.bsn_type or adcl.admin_doc_proj_type = 0) and bs.bsn_id=".$bus_id." 
//								WHERE dcl.doc_bsn_id = $bus_id ORDER BY adcl.admin_doc_order ASC";
							
			$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list as dcl
								INNER JOIN admin_document_check_list as adcl
								ON dcl.doc_name_id = adcl.admin_doc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								inner join business as bs 
							on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
								WHERE dcl.doc_bsn_id = $bus_id ORDER BY adcl.admin_doc_order ASC";					
								
							
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
			$fwViewData['print_data'] = $print_data;
		}		





		break;
				
	
	case "DocumentCheckListMini":
			$document_check_listTable = new Fw_Db_Table('document_check_list_mini');
			$admin_document_check_listTable = new Fw_Db_Table('admin_document_check_list_mini');
			
			$addList = $fwRequest -> getParamget('addList','');
			$bus_id = $fwRequest -> getParamget('bus_id','');
		
		if(!empty($addList) AND $addList == 'add')
		{
			
			if($bus_id>0)
			{
					$businessTable = new Fw_Db_Table('business');
					$businessTable->setWhere('bsn_id =' .$bus_id);
					$pt_data = $businessTable->getRow();
					$pt_data1 = $pt_data['bsn_type'];
					
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					
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
					$countTable = new Fw_Db_Table('document_check_list_mini_count');
					$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
					
					if(!$countTable->rowExists())
					 {
						$counterdata['dcnt_bsn_id'] = $bus_id;
						$counterdata['dcnt_counter'] = 1;
						$countTable->insertRow($counterdata);
					 }
				
				    $dataTable = new Fw_Db_Table('document_proposal_name');
					$dataTable->setWhere('dpn_bsn_id = '.$bus_id);
					
					if(!$dataTable->rowExists())
					 {
					
					$sqlmax = "select max(dpn_unique_id) as duid from document_proposal_name";
					$m_data = $fwDb -> queryOne($sqlmax);
					$un_data = $m_data['duid'] + 1;
					$unqdata['dpn_bsn_id'] = $bus_id;
					$unqdata['dpn_unique_id'] = $un_data;
					$unqdata['dpn_proposal_number'] = 1;
					$unqdata['dpn_created_by'] = $_SESSION['user']['user_name'];
					$unqdata['dpn_created_date'] =  date('d-m-Y');
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
					
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					$fwViewData['data_checklist'] = $data_checklist;
					
					$countTable = new Fw_Db_Table('document_check_list_mini_count');
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
					
					$dataTable = new Fw_Db_Table('document_proposal_name');
					$sqlmax = "select max(dpn_unique_id) as duid from document_proposal_name";
					$m_data = $fwDb -> queryOne($sqlmax);
					$un_data = $m_data['duid'] + 1;
					$unqdata['dpn_bsn_id'] = $bus_id;
					$unqdata['dpn_unique_id'] = $un_data;
					$unqdata['dpn_proposal_number'] = $rn;
					$unqdata['dpn_created_by'] = $_SESSION['user']['user_name'];
					$unqdata['dpn_created_date'] =  date('d-m-Y');
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
					
					$admin_document_check_listTable -> setWhere("admin_doc_status = 1 AND admin_doc_proj_type LIKE '%".$pt_data1."%'");
					
					$admin_document_check_listTable -> setOrderBy('admin_doc_order ASC');
					$data_checklist = $admin_document_check_listTable -> getRows();
					
					$fwViewData['data_checklist'] = $data_checklist;
					
					$countTable = new Fw_Db_Table('document_check_list_mini_count');
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
							
			$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 	FROM document_check_list_mini as dcl
								INNER JOIN admin_document_check_list_mini as adcl
								ON dcl.doc_name_id = adcl.admin_doc_id
								LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
								inner join business as bs 
							on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
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
			$fwViewData['print_data_mini'] = $print_data;
			
			$namesql = "Select * from document_proposal_name where dpn_bsn_id = ". $bus_id . " and dpn_proposal_number =  1";
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
			$fwViewData['dpn_link1'] = $namedata_1['dpn_link1'];
			$fwViewData['dpn_link2'] = $namedata_1['dpn_link2'];
			$fwViewData['dpn_you_winter'] = $namedata_1['dpn_you_winter'];
			$fwViewData['dpn_you_summer'] = $namedata_1['dpn_you_summer'];
			$fwViewData['dpn_budget'] = $namedata_1['dpn_budget'];
			$fwViewData['dpn_ex_designno'] = $namedata_1['dpn_ex_designno'];
			$fwViewData['bsn_id_mini'] = $bus_id;
			$fwViewData['dpn_dr_hide'] = $namedata_1['dpn_dr_hide'];
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 1");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 2");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata2'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 3");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata3'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 4");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata4'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 5");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata5'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 6");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata6'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 7");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata7'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 8");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata8'] = $cus_minidata;
			
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 9");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata9'] = $cus_minidata;
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 10");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata10'] = $cus_minidata;		


			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 11");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata11'] = $cus_minidata;

			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 12");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata12'] = $cus_minidata;


			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 13");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata13'] = $cus_minidata;

			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 14");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata14'] = $cus_minidata;			
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 15");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata15'] = $cus_minidata;			
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 16");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata16'] = $cus_minidata;			
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 17");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata17'] = $cus_minidata;			
			
			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 18");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata18'] = $cus_minidata;

			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 19");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata19'] = $cus_minidata;

			$custom_document_miniTable = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_document_miniTable->setWhere('cdc_bsn_id =' .$bus_id. " AND cdc_checklist_number = 20");
			$cus_minidata = $custom_document_miniTable->getRows();
			$fwViewData['cus_minidata20'] = $cus_minidata;

			$countTable = new Fw_Db_Table('document_check_list_mini_count');
			$countTable->setWhere('dcnt_bsn_id = '.$bus_id);
			$ctval =  $countTable->getRow();
			
			for($a = 2; $a<=$ctval['dcnt_counter']; $a++)
			{
				
					$sql_print_data =  "SELECT dcl.*, adcl.*, u.user_name 	FROM document_check_list_mini as dcl
								INNER JOIN admin_document_check_list_mini as adcl
								ON dcl.doc_name_id = adcl.admin_doc_id
								LEFT JOIN users as u ON dcl.doc_user_name = u.user_id
								inner join business as bs 
							on (adcl.admin_doc_proj_type LIKE '%".$pt_data1."%') and bs.bsn_id=".$bus_id." 
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
			$fwViewData['print_data_mini'.$a] = $print_data;
			
			$namesql = "Select * from document_proposal_name where dpn_bsn_id = ". $bus_id . " and dpn_proposal_number =  ".$a;
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
						  $fwViewData['dpn_dr_hide_2'] = $namedata_more['dpn_dr_hide'];
						   //$fwViewData['dpn_created_by_2'] = $namedata_more['dpn_created_by'];
						   
						   if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_2'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_2'] = $_SESSION['user']['user_name'];
								
							}
						   
						   
						  // $fwViewData['dpn_created_date_2'] = $namedata_more['dpn_created_date'];
						   
						   if(!empty($namedata_more['dpn_created_date_2']))
								{
								$fwViewData['dpn_created_date_2'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_2'] = date('d-m-Y');
								
							}
						   
						   
						  
						  $fwViewData['dpn_you_winter_2'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_2'] = $namedata_more['dpn_you_summer'];
						  $fwViewData['dpn_budget_2']     = $namedata_more['dpn_budget'];
						  $fwViewData['dpn_ex_designno_2'] = $namedata_more['dpn_ex_designno'];
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
						  $fwViewData['dpn_dr_hide_3'] = $namedata_more['dpn_dr_hide'];
						  // $fwViewData['dpn_created_by_3'] = $namedata_more['dpn_created_by'];
						   
						   if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_3'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_3'] = $_SESSION['user']['user_name'];
								
							}
						   
						   
						   
						   
						  // $fwViewData['dpn_created_date_3'] = $namedata_more['dpn_created_date'];
						   
						   
						    if(!empty($namedata_more['dpn_created_date_3']))
								{
								$fwViewData['dpn_created_date_3'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_3'] = date('d-m-Y');
								
							}
						  
						  $fwViewData['dpn_you_winter_3'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_3'] = $namedata_more['dpn_you_summer'];
						  $fwViewData['dpn_budget_3']     = $namedata_more['dpn_budget'];						  
						  
						  $fwViewData['dpn_ex_designno_3'] = $namedata_more['dpn_ex_designno'];
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
						  $fwViewData['dpn_dr_hide_4'] = $namedata_more['dpn_dr_hide'];
						   //$fwViewData['dpn_created_by_4'] = $namedata_more['dpn_created_by'];
						   
						    if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_4'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_4'] = $_SESSION['user']['user_name'];
								
							}
						   
						   
						   
						  // $fwViewData['dpn_created_date_4'] = $namedata_more['dpn_created_date'];
						   
						   
						    if(!empty($namedata_more['dpn_created_date_4']))
								{
								$fwViewData['dpn_created_date_4'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_4'] = date('d-m-Y');
								
							}	
	
						  $fwViewData['dpn_you_winter_4'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_4'] = $namedata_more['dpn_you_summer'];						  
						  $fwViewData['dpn_budget_4']     = $namedata_more['dpn_budget'];
						  
						  $fwViewData['dpn_ex_designno_4'] = $namedata_more['dpn_ex_designno'];
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
						  $fwViewData['dpn_dr_hide_5'] = $namedata_more['dpn_dr_hide'];
						  // $fwViewData['dpn_created_by_5'] = $namedata_more['dpn_created_by'];
						   
						    if(!empty($namedata_more['dpn_created_by']))
								{
								$fwViewData['dpn_created_by_5'] = $namedata_more['dpn_created_by'];
							} else {
								$fwViewData['dpn_created_by_5'] = $_SESSION['user']['user_name'];
								
							}
						   
						   
						   //$fwViewData['dpn_created_date_5'] = $namedata_more['dpn_created_date'];
						   
						   
						    if(!empty($namedata_more['dpn_created_date_5']))
								{
								$fwViewData['dpn_created_date_5'] = $namedata_more['dpn_created_date'];
							} else {
								$fwViewData['dpn_created_date_5'] = date('d-m-Y');
								
							}
						  
						  $fwViewData['dpn_you_winter_5'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_5'] = $namedata_more['dpn_you_summer'];
						  $fwViewData['dpn_budget_5']     = $namedata_more['dpn_budget'];						  
						  
						  $fwViewData['dpn_ex_designno_5'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==6) {
						  $fwViewData['dpn_name_6'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_6'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_6'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_6'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_6'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_6'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_6'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_6'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_dr_hide_6'] = $namedata_more['dpn_dr_hide'];
						  $fwViewData['dpn_link1_6'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_6'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_you_winter_6'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_6'] = $namedata_more['dpn_you_summer'];						  
						  $fwViewData['dpn_ex_designno_6'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==7) {
						  $fwViewData['dpn_name_7'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_7'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_7'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_7'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_7'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_7'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_7'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_7'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_7'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_7'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_you_winter_7'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_7'] = $namedata_more['dpn_you_summer'];						  
						  $fwViewData['dpn_dr_hide_7'] = $namedata_more['dpn_dr_hide'];
						  $fwViewData['dpn_ex_designno_7'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==8) {
						  $fwViewData['dpn_name_8'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_8'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_8'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_8'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_8'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_8'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_8'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_8'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_8'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_8'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_you_winter_8'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_8'] = $namedata_more['dpn_you_summer'];						  
						  $fwViewData['dpn_dr_hide_8'] = $namedata_more['dpn_dr_hide'];
						  $fwViewData['dpn_ex_designno_8'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==9) {
						  $fwViewData['dpn_name_9'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_9'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_9'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_9'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_9'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_9'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_9'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_9'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_9'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_9'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_you_winter_9'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_9'] = $namedata_more['dpn_you_summer'];						  
						  $fwViewData['dpn_dr_hide_9'] = $namedata_more['dpn_dr_hide'];
						  $fwViewData['dpn_ex_designno_9'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==10) {
						  $fwViewData['dpn_name_10'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_10'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_10'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_10'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_10'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_10'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_10'] = $namedata_more['dpn_unique_id'];
						  $fwViewData['dpn_include_in_report_10'] = $namedata_more['dpn_include_in_report'];
						  $fwViewData['dpn_link1_10'] = $namedata_more['dpn_link1'];
						  $fwViewData['dpn_link2_10'] = $namedata_more['dpn_link2'];
						  $fwViewData['dpn_you_winter_10'] = $namedata_more['dpn_you_winter'];
						  $fwViewData['dpn_you_summer_10'] = $namedata_more['dpn_you_summer'];
						  $fwViewData['dpn_dr_hide_11'] = $namedata_more['dpn_dr_hide'];
						  $fwViewData['dpn_ex_designno_10'] = $namedata_more['dpn_ex_designno'];
						}elseif ($a==11) {
						  $fwViewData['dpn_name_11'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_11'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_11'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_11'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_11'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_11'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_11'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==12) {
						  $fwViewData['dpn_name_12'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_12'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_12'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_12'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_12'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_12'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_12'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==13) {
						  $fwViewData['dpn_name_13'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_13'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_13'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_13'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_13'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_13'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_13'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==14) {
						  $fwViewData['dpn_name_14'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_14'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_14'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_14'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_14'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_14'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_14'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==15) {
						  $fwViewData['dpn_name_15'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_15'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_15'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_15'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_15'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_15'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_15'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==16) {
						  $fwViewData['dpn_name_16'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_16'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_16'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_16'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_16'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_16'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_16'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==17) {
						  $fwViewData['dpn_name_17'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_17'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_17'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_17'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_17'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_17'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_17'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==18) {
						  $fwViewData['dpn_name_18'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_18'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_18'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_18'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_18'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_18'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_18'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==19) {
						  $fwViewData['dpn_name_19'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_19'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_19'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_19'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_19'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_19'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_19'] = $namedata_more['dpn_unique_id'];
						}elseif ($a==20) {
						  $fwViewData['dpn_name_20'] = $namedata_more['dpn_name'];
						  $fwViewData['dpn_primary_design_20'] = $namedata_more['dpn_primary_design'];
						  $fwViewData['dpn_design_type_20'] = $namedata_more['dpn_design_type'];
						  $fwViewData['dpn_customer_designer_20'] = $namedata_more['dpn_customer_designer'];
						  $fwViewData['dpn_project_type_20'] = $namedata_more['dpn_project_type'];
						  $fwViewData['dpn_notes_20'] = $namedata_more['dpn_notes'];
						  $fwViewData['dpn_unique_id_20'] = $namedata_more['dpn_unique_id'];
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
							$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['doc_file_name']= $docfile;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
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
				
		case "checklistmini":
			$fwViewData['iframe_data_mini'] = 1;

			$doc_id =  $fwRequest -> getParamget('doc_id','');
			$chk_num = $fwRequest -> getParamget('chknm','');
			//db($chk_num);
			//exit;	
			if(!empty($doc_id))
			{
					$sql_edit_data = "SELECT dcl.*, adcl.*, u.user_name 
							FROM document_check_list_mini as dcl
							
							INNER JOIN admin_document_check_list_mini as adcl
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
				$submit_iframe = $fwRequest -> getParam('submit_iframe_mini','');
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
							$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['doc_file_name']= $docfile;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
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
						$document_check_listTable = new Fw_Db_Table('document_check_list_mini');
						//$document_check_listTable -> setWhere("doc_id = $doc_id");
						$document_check_listTable -> setWhere("doc_id = " .$doc_id . " AND doc_checklist_number =  ".$dnum);
						$document_check_listTable -> updateRow($doc);
						$fwViewData['iframe_data_mini'] = 0;
						$fwViewData['iframe_msg_mini'] = '1';		
										
				}
				//******* End Store value in DB after submit*********//
			}
		break;
		
		case "adddoc_checklistmini":
		
			$fwViewData['iframe_data_mini_adddoc'] = 1;
			$doc_id = $fwRequest -> getParamget('doc_id','');
			$chknm = $fwRequest -> getParamget('chknm',0);
			
			$custom_mini = new Fw_Db_Table('custom_document_check_list_mini');
			$custom_mini->setWhere("cdc_id = $doc_id");
			$fwViewData['cdetail'] = $custom_mini->getRow();
			

				$submit_iframe = $fwRequest -> getParam('submit_iframe_mini_doc','');
				if(!empty($submit_iframe))
				{
					$minidetail = $fwRequest->getParam('mini', array());
					$bsn_id_m = $fwRequest -> getParamget('bsn_id_m','');
					$bus_id = $fwRequest -> getParamget('bus_id','');
		
						if($_FILES['custom_mini']['error'] == 0)
						{
							$docfile_mini = $_FILES['custom_mini']['name'];
							$file_type = $_FILES['custom_mini']['type'];
							
							$datetime = trim(date('d_m_Y_H_i_'),'0');
							$docfile_mini = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_mini);
							$src = $_FILES['custom_mini']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile_mini;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								//$minidetail['cdc_bsn_id']= $bus_id;
								$minidetail['cdc_file_name']= $docfile_mini;
								
								$minidetail['cdc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
						}
					
					
					if(empty($minidetail['cdc_file_name']) AND !empty($minidetail['cdc_file_name_temp']))
						{
							$minidetail['cdc_file_name'] = $cdc['doc_file_name_temp'];
							unset($minidetail['cdc_file_name_temp']);
							
						}
						elseif(empty($minidetail['cdc_file_name']))
						{
							$minidetail['cdc_file_name'] = '';
							$minidetail['cdc_date_uploaded']='';
							$minidetail['cdc_user_name']='';
						}
					
					
					$minidetail['cdc_bsn_id']= $bus_id;
					$minidetail['cdc_user_name'] = $_SESSION['user']['user_name'];
					$custom_mini = new Fw_Db_Table('custom_document_check_list_mini');
					
					$doc_id = $fwRequest -> getParamget('doc_id','');
				
					if(!empty($doc_id))
					{
						$custom_mini -> setWhere("cdc_id = $doc_id");
						$custom_mini -> updateRow($minidetail);
					}
					else
					   {
						   $minidetail['cdc_checklist_number'] = $chknm; 
						   $custom_mini -> insertRow($minidetail);
					   }
			
					$fwViewData['iframe_data_mini_adddoc'] = 0;
					//header('Location: '.$_SERVER['REQUEST_URI']);
					echo "<script type='text/javascript'>parent.hideiFrame('adddoc_checkListIframeMini','');</script>";
					echo "<script type='text/javascript'>parent.requestDocumentCheckListMini();</script>";
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
							$destination = BASE_DIR.FILE_PATH. 'files/document_check_list_files/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['doc_file_name']= $docfile;
								$doc['doc_user_name'] = $_SESSION['user']['user_id'];
								$doc['doc_date_uploaded'] = date('Y-m-d H:i');
								chmod($destination, 0664);
							}
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
		
		
		case "countptypeTask" :
			$bus_id = $fwRequest -> getParamget('bus_id','');
			
		  	$sql_countTaskTotal = "SELECT count(bt_id) as total FROM projects_tasks
								WHERE bt_bsn_id = $bus_id";
								
			$total = $fwDb -> queryOne($sql_countTaskTotal);
			
			
			$sql_countTaskCompleted = "SELECT count(bt_id) as completed FROM projects_tasks
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
							$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							else
							{
								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
								else
								{
									unset($data['bd_doc_name']);
									$data['bd_doc_name'] = $docfile;
									chmod($destination, 0664);
								}
							}	
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
						$fwViewData['file_exist'] = "Document is mandatory. Please select the file.";
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

		case 'delete_document':
			$tableid = $fwRequest -> getParamget('tableid','');
			$id = $fwRequest -> getParamget('id','');
			
			$sql = "DELETE FROM business_documents WHERE bd_id = $tableid";
			$temp = $fwDb->queryOne($sql);
			
			 echo "$id||Document deleted successfully.";
			 exit;
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
							$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							if(file_exists($destination))
								{
									$file_exist_error = 1;
								}	
							else
							{
								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack.";
								}
								else
								{
									unset($data['bd_doc_name']);
									$data['bd_doc_name'] = $docfile;
									chmod($destination, 0664);
								}
							}	
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
		
		
			//PA documents//
		case 'padocuments':
			$fwViewData['showpaDocumentsIframe'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
		
			if($tableid>0)
			{
				$sql = "SELECT bpd.*, c.customer_name FROM business_pa_documents as bpd LEFT JOIN customers as c ON bpd.bpd_user_id = c.user_id WHERE bpd.bpd_id = $tableid";
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;
			}
						
			$business_documentsTable = new Fw_Db_Table('business_pa_documents');
			$subDocument = $fwRequest -> getParam('subDocument','');
			$fwViewData['padocuments'] = "padocuments";	

			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
				if(!$data['bpd_upload_dossier']){$data['bpd_upload_dossier'] = $data['bpd_upload_dossier'] = 0;}
	
				$document = $_FILES['document'];
				if($_FILES['document']['error'] == 0)
						{
							$docfile = $_FILES['document']['name'];
							$file_type = $_FILES['document']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['document']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/business_documents/'.$docfile;
								
							if(file_exists($destination)){	$file_exist_error = 1; }	
							else{
								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack.";
								}
								else
								{
									unset($data['bpd_doc_name']);
									$data['bpd_doc_name'] = $docfile;
									chmod($destination, 0664);
								}
							}	
						}
					
			
			if(empty($file_exist_error))	
				{	
					if(!empty($data['bpd_doc_name']))
					{
						$data['bpd_user_id'] = $_SESSION['user']['user_id'];
						$data['bpd_uploaded_date'] = date('Y-m-d H:i');

	
						if(!empty($data['bpd_id']) AND $data['bpd_id']>0)
						{
							$bpd_id = $data['bpd_id'];
							unset($data['bpd_id']);
							
							$business_documentsTable -> setWhere("bpd_id = $bpd_id");
							$business_documentsTable -> updateRow($data);
							$success_msg = "Document Updated Successfully.";
						}
						else
						{
							$business_documentsTable -> insertRow($data);
							$success_msg = "Document Added Successfully.";
						}
						
						$fwViewData['padocs_success_msg'] = $success_msg;
						$fwViewData['showpaDocumentsIframe'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Document is mandatory. Please upload the Document.";
						$fwViewData['showpaDocumentsIframe'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showpaDocumentsIframe'] = 1;
				}
			}
		break;
		
		case 'cdocuments':
			$pagenum = $fwRequest -> getParamget('pagenum','');	
			$bus_id = $fwRequest -> getParamget('bus_id','');
			
			$businessTable = new Fw_Db_Table('business');
			$businessTable->setWhere('bsn_id =' .$bus_id);
			$pt_data = $businessTable->getRow();
			$pt_data1 = $pt_data['bsn_type'];
			
			$fwViewData['showcDocumentsIframe'] = 1;
			$cdata1 = $fwRequest -> getParamget('cdata','');
			
			$subDocument = $fwRequest -> getParam('subDocument','');
						
			if($cdata1 > 0 and empty($subDocument) Or ($cdata1==0 or empty($cdata1)) )
			{
				$cdata = $cdata1;
				$fwViewData['cdata'] = $cdata;
				$doc_id = $fwRequest -> getParamget('docid','');
				$sql_disena = "UPDATE document_check_list SET doc_disable = doc_disable * -1 WHERE doc_id = $doc_id";
				$fwDb -> queryOne($sql_disena);
				
					if($cdata == 1) 	  { $type = "Document check list A"; }
					else if($cdata == 2) { $type = "Document check list B"; }	
					else if($cdata == 3) { $type = "Document check list C"; }	
					else if($cdata == 4) { $type = "Document check list D"; }
					$fwViewData['type'] = $type;
			}
								
			if(!empty($subDocument))
			{
			$cdata = $fwRequest -> getParam('cdata','');	
			
			$fwViewData['cdata'] = $cdata;
			
			if($cdata == 1) 	  { $type = "Document check list A"; }
			else if($cdata == 2) { $type = "Document check list B"; }	
			else if($cdata == 3) { $type = "Document check list C"; }	
			else if($cdata == 4) { $type = "Document check list D"; }	
			
			$fwViewData['type'] = $type;
						
			$document_check_listTable = new Fw_Db_Table('document_check_list');
			$admin_custom_document_check_listTable = new Fw_Db_Table('admin_custom_document_check_list');
			
			if($bus_id>0)
			{
					//$admin_custom_document_check_listTable -> setWhere("admin_cdoc_status = 1 AND admin_cdoc_type LIKE '%".$cdata."%' and admin_doc_proj_type IN( ".$pt_data1.",0)");
				
				$admin_custom_document_check_listTable -> setWhere("admin_cdoc_status = 1 AND admin_cdoc_type LIKE '%".$cdata."%'");
				
					$admin_custom_document_check_listTable -> setOrderBy('admin_cdoc_order ASC');
					
					$data_checklist = $admin_custom_document_check_listTable -> getRows();
									
					$fwViewData['data_checklist'] = $data_checklist;
													
					foreach($data_checklist as $k => $v)
					{
						$data['doc_bsn_id'] = $bus_id;
						$data['doc_type_id'] = $v['admin_cdoc_id'];
						$data['doc_file_name'] = $v['admin_cdoc_manual'];
						$data['doc_upload_to_dossier'] = $v['admin_cdoc_upload_to_dossier'];
						
						$document_check_listTable->setWhere("doc_type_id =".$v['admin_cdoc_id'] .' AND doc_bsn_id = '.$bus_id);
						
							if(!$document_check_listTable->rowExists())
							{
									$document_check_listTable -> insertRow($data);
							}					
					}
					
			$checkListErrorMsg = "Document Checklist has been added successfully.";
			$fwViewData['checkListErrorMsg'] = $checkListErrorMsg;
			}
			else
			{
				$fwViewData['checkListErrorMsg'] = 'Business Id is not available. Please save the business and then try again.';
			}
			}	
			
		if($bus_id>0)
		{
		
			if($cdata > 0)
			{
			$sql_print_data = "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list as dcl
								INNER JOIN admin_custom_document_check_list as adcl
								ON dcl.doc_type_id = adcl.admin_cdoc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								WHERE dcl.doc_bsn_id = $bus_id and adcl.admin_cdoc_type like '%". $cdata. "%' 
								ORDER BY adcl.admin_cdoc_order ASC";
								
								//WHERE dcl.doc_bsn_id = $bus_id and adcl.admin_doc_proj_type = ".$pt_data1." 
			}
			else {
				$sql_print_data = "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list as dcl
								INNER JOIN admin_custom_document_check_list as adcl
								ON dcl.doc_type_id = adcl.admin_cdoc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								WHERE dcl.doc_bsn_id = $bus_id  
								ORDER BY adcl.admin_cdoc_order ASC";
				
			}
			
							
			$cprint_data = $fwDb -> query($sql_print_data);
				
						/*************** Begin Pagination *****************/
						
			if(!empty($cprint_data))
							{
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
								
								$rows = count($cprint_data);
							
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 30;
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
								
								$sql2 =  $sql_print_data." ".$max;
							
										
							if($sql2){$cprint_data = $fwDb->query($sql2);}
									
						$count_print_data = count($cprint_data);
						for($i=0; $i<$count_print_data; $i++)
						{
							if($cprint_data[$i]['doc_date_uploaded']!=0)
							{
							$cprint_data[$i]['doc_date_uploaded'] = changedate_d_m_Y($cprint_data[$i]['doc_date_uploaded'])." ".changetime_h_m($cprint_data[$i]['doc_date_uploaded']);	
							}
							else
							{
							$cprint_data[$i]['doc_date_uploaded'] = '';
							}
						}
							
								foreach($cprint_data as $k=>$v)
								{
									$detail =  explode("|",$v['admin_cdoc_type']);
									$str = '';
									foreach($detail as $k1=>$v1)
									{
										if($v1==1)
											$str .= " Document Checklist A ";
										elseif($v1 == 2)
											$str .= " Document Checklist B ";	
										elseif($v1 == 3)
											$str .= " Document Checklist C ";
										elseif($v1 == 4)
											$str .= " Document Checklist D ";
									}
			
									$cprint_data[$k]['admin_cdoc_type'] = $str;
									$cprint_data[$k]['cdata'] = $cdata;
									
								}
									
								$fwViewData['cprint_data'] = $cprint_data;
								$fwViewData['cdata'] = $cdata;
								
							}	
						}
			
		break;
		
			case 'dedocuments':
			
			$pagenum = $fwRequest -> getParamget('pagenum','');	
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$doc_id = $fwRequest -> getParamget('docid','');
			$cdata1 = $fwRequest -> getParamget('cdata','');
			$cdata = $fwRequest -> getParam('cdata','');
							
			$fwViewData['cdata'] = $cdata;
			
			if($cdata == 1) 	 { $type = "Document check list A"; }
			else if($cdata == 2) { $type = "Document check list B"; }	
			else if($cdata == 3) { $type = "Document check list C"; }	
			else if($cdata == 4) { $type = "Document check list D"; }	
			
			$fwViewData['type'] = $type;
				
			$businessTable = new Fw_Db_Table('business');
			$businessTable->setWhere('bsn_id =' .$bus_id);
			$pt_data = $businessTable->getRow();
			$pt_data1 = $pt_data['bsn_type'];
						
			$fwViewData['showcDocumentsIframe'] = 1;
			
			$sql_disena = "UPDATE document_check_list SET doc_disable = doc_disable * -1 WHERE doc_id = $doc_id";
			$fwDb -> queryOne($sql_disena);
			
			if($bus_id>0)
			{
		
			if($cdata > 0)
			{
			$sql_print_data = "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list as dcl
								INNER JOIN admin_custom_document_check_list as adcl
								ON dcl.doc_type_id = adcl.admin_cdoc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								WHERE dcl.doc_bsn_id = $bus_id and adcl.admin_cdoc_type like '%". $cdata. "%' 
								ORDER BY adcl.admin_cdoc_order ASC";
								
								//WHERE dcl.doc_bsn_id = $bus_id and adcl.admin_doc_proj_type = ".$pt_data1." 
			}
			else {
				$sql_print_data = "SELECT dcl.*, adcl.*, u.user_name 
								FROM document_check_list as dcl
								INNER JOIN admin_custom_document_check_list as adcl
								ON dcl.doc_type_id = adcl.admin_cdoc_id
								LEFT JOIN users as u
								ON dcl.doc_user_name = u.user_id
								WHERE dcl.doc_bsn_id = $bus_id  
								ORDER BY adcl.admin_cdoc_order ASC";
				
			}
							
			$cprint_data = $fwDb -> query($sql_print_data);
		
						/*************** Begin Pagination *****************/
						
			if(!empty($cprint_data))
							{
							if (!(isset($pagenum)))
								{
									$pagenum = 1;
								} 
								
								$rows = count($cprint_data);
							
								if($perpage>0)
								{
									$page_rows = $perpage;
								}
								else
								{
									$page_rows = 30;
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
								
								$sql2 =  $sql_print_data." ".$max;
							
										
							if($sql2){$cprint_data = $fwDb->query($sql2);}
									
						$count_print_data = count($cprint_data);
						for($i=0; $i<$count_print_data; $i++)
						{
							if($cprint_data[$i]['doc_date_uploaded']!=0)
							{
							$cprint_data[$i]['doc_date_uploaded'] = changedate_d_m_Y($cprint_data[$i]['doc_date_uploaded'])." ".changetime_h_m($cprint_data[$i]['doc_date_uploaded']);	
							}
							else
							{
							$cprint_data[$i]['doc_date_uploaded'] = '';
							}
						}
									
							foreach($cprint_data as $k=>$v)
							{
								$detail =  explode("|",$v['admin_cdoc_type']);
								$str = '';
								foreach($detail as $k2=>$v2)
								{
									if($v2==1)
										$str .= " Document Checklist A ";
									elseif($v2 == 2)
										$str .= " Document Checklist B ";	
									elseif($v2 == 3)
										$str .= " Document Checklist C ";
									elseif($v2 == 4)
										$str .= " Document Checklist D ";
								}
								$cprint_data[$k]['admin_cdoc_type'] = $str;
								$cprint_data[$k]['cdata'] = $cdata;
							}			
								$fwViewData['cprint_data'] = $cprint_data;
								
								//$fwViewData['cdata'] = $cdata;
							}	
						}
			
		break;
		
		
		case 'showpadocs':
			//db("Testing1");
			//exit;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getparamget('padocperpage','');
			
			if($bus_id>0)
			{
				$sql = "SELECT bf.*, c.user_name FROM business_pa_documents as bf
						LEFT JOIN users as c
						ON bf.bpd_user_id = c.user_id
						WHERE bf.bpd_bsi_id = $bus_id 
						ORDER BY bpd_id DESC";
			
						
				$detail = $fwDb -> query($sql);
				
			$userData = $detail;
			//db($sql);
			//exit;
			/*************** Begin Pagination *****************/
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
									if($new_detail[$i]['bpd_uploaded_date']!=0)
									{
						$new_detail[$i]['bpd_uploaded_date'] = changedate_d_m_Y($new_detail[$i]['bpd_uploaded_date'])." ".changetime_h_m($new_detail[$i]['bpd_uploaded_date']);	
									}
									else
									{
										$new_detail[$i]['bpd_uploaded_date'] = '';
									}
								}
								
								$fwViewData['pddocs_data'] = $new_detail;
							}
			/*************** End Pagnation ********************/
			$fwViewData['show_pddocs_data'] = "show";
			$fwViewData['divid'] = $divid;
			}
		break;
		
		
		case 'delete_padocs':
			$tableid = $fwRequest -> getParamget('tableid','');
			$id = $fwRequest -> getParamget('id','');
			
			$sql = "DELETE FROM business_pa_documents WHERE bpd_id = $tableid";
			$temp = $fwDb->queryOne($sql);
			
			echo "$id||Docs deleted successfully.";
			exit;
		break;


	//PA documents//
		case 'panotes':
			$fwViewData['showpaNotesIframe'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid',0);
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
		
			if($tableid>0)
			{
			$sql = "SELECT bpn.*, c.customer_name FROM business_pa_notes as bpn LEFT JOIN customers as c ON bpn.bpn_user_id = c.user_id WHERE bpn.bpn_id = $tableid";
				$fwViewData['detail'] = $fwDb -> queryOne($sql);
			}
		
			$business_documentsTable = new Fw_Db_Table('business_pa_notes');
			$subDocument = $fwRequest -> getParam('subDocument','');
			$fwViewData['padocuments'] = "padocuments";	

			if(!empty($subDocument))
			{
				$data = $fwRequest -> getParam('data',array());
				$data['bpn_user_id'] = $_SESSION['user']['user_id'];
				$data['bpn_uploaded_date'] = date('Y-m-d H:i');

				if(!empty($data['bpn_id']) AND $data['bpn_id']>0)
				{
					$bpn_id = $data['bpn_id'];
					unset($data['bpn_id']);
					
					$business_documentsTable -> setWhere("bpn_id = $bpn_id");
					$business_documentsTable -> updateRow($data);
					$success_msg = "Notes Updated Successfully.";
				}
				else
				{
					$business_documentsTable -> insertRow($data);
					$success_msg = "Notes Added Successfully.";
				}
				$fwViewData['notes_success_msg'] = 	$success_msg;	
			}
		break;


case 'showpanotes':
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getparamget('panotesperpage','');
			
			if($bus_id>0)
			{
				$sql = "SELECT bpn.*, c.user_name FROM business_pa_notes as bpn
						LEFT JOIN users as c
						ON bpn.bpn_user_id = c.user_id
						WHERE bpn.bpn_bsi_id = $bus_id 
						ORDER BY bpn_id DESC";
				$userData = $fwDb -> query($sql);
			
			/*************** Begin Pagination *****************/
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
									if($new_detail[$i]['bpn_uploaded_date']!=0)
									{
						$new_detail[$i]['bpn_uploaded_date'] = changedate_d_m_Y($new_detail[$i]['bpn_uploaded_date'])." ".changetime_h_m($new_detail[$i]['bpn_uploaded_date']);	
									}
									else
									{
										$new_detail[$i]['bpn_uploaded_date'] = '';
									}
								}
								
								$fwViewData['pnnotes_data'] = $new_detail;
							}
			/*************** End Pagnation ********************/
			$fwViewData['show_pnnotes_data'] = "show";
			$fwViewData['divid'] = $divid;
			}
		break;

		case 'delete_pnotes':
			$tableid = $fwRequest -> getParamget('tableid','');
			$id = $fwRequest -> getParamget('id','');
			$temp = $fwDb->queryOne("DELETE FROM business_pa_notes WHERE bpn_id = $tableid");
			echo "$id||Notes deleted successfully.";
			exit;
		break;
		
		case 'showintdocuments':
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getParamget('docperpage','');
			
			if($bus_id>0)
			{
				$sql = "SELECT bd.*, c.customer_name FROM business_documents as bd
						LEFT JOIN customers as c
						ON bd.bd_user_id = c.user_id
						WHERE bd.bd_bsi_id = $bus_id AND bd.bd_doc_inner = 1
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
								$fwViewData['inrenaldocuments'] = "inrenaldocuments";	
								$fwViewData['documents_data'] = $new_detail;
						}
			/*************** End Pagnation ********************/
				$fwViewData['documents_data_show'] = "Show";
				$fwViewData['divid'] = $divid;
			}
		break;

		//inner documents //
		case 'images':
			$fwViewData['showImagesIframe'] = 1;
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$tableid = $fwRequest -> getParamget('tableid','');
			
			$fwViewData['bus_id'] = $bus_id;
			$fwViewData['divid'] = $divid;
					
			if($tableid>0)
			{
				$sql = "SELECT bf.* FROM business_file as bf
						WHERE bf.bf_id = $tableid";
						
				$detail = $fwDb -> queryOne($sql);
				$fwViewData['detail'] = $detail;
			}
			
			$business_fileTable = new Fw_Db_Table('business_file');
			
			$subImage = $fwRequest -> getParam('subImage','');
				
			if(!empty($subImage))
			{
				$data = $fwRequest -> getParam('data',array());
					
				$images = $_FILES['images'];
						
				if($_FILES['images']['error'] == 0)
						{
							$docfile = $_FILES['images']['name'];
							$file_type = $_FILES['images']['type'];
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $docfile);
							$src = $_FILES['images']['tmp_name'];
							$destination = BASE_DIR.FILE_PATH.'files/business_images/'.$docfile;
							$thumbdestination = BASE_DIR.FILE_PATH.'files/business_images/thumb_'.$docfile;
						

								if (!move_uploaded_file($src, $destination))
								{
									echo "Possible file upload attack";
								}
								else
								{
									unset($data['bd_doc_name']);
									$image_param = getimagesize($destination);
									
									$data['bf_width'] = $image_param[0];
									$data['bf_height'] = $image_param[1];
									$data['bf_attr'] = $image_param[3];
									$data['bf_name'] = preg_replace('/[^A-Z0-9._]/i', '_', $images['name']);
									chmod($destination, 0664);
									
									include_once(LIB_DIR."imagemagic/php-image-resizing.php");
									$image = new SimpleImage();
									$image->load($destination);
									$image->resizeToWidth(50);
									$image->save($thumbdestination);					
								}
							
						}
			
			if(empty($file_exist_error))	
				{	
					if(!empty($data['bf_name']))
					{
						$data['bf_user_id'] = $_SESSION['user']['user_id'];
						$data['bf_uploaded_date'] = date('Y-m-d H:i');
							
							
						if(!empty($data['bf_id']) AND $data['bf_id']>0)
						{
							$bf_id = $data['bf_id'];
							unset($data['bf_id']);
							
							$business_fileTable -> setWhere("bf_id = $bf_id");
							$business_fileTable -> updateRow($data);
							$success_msg = "Image Updated Successfully.";
						}
						else
						{
							$business_fileTable -> insertRow($data);
							$success_msg = "Image Added Successfully.";
						}
						
						if($data['bf_role'] == 1)
						{
							$bf_name = $data['bf_name'];
							$bsn_id = $data['bf_bsn_id'];
							$sql_main_img = "UPDATE business_file SET bf_role = 0 WHERE bf_name != '$bf_name' AND bf_bsn_id =  $bsn_id";
							$fwDb -> queryOne($sql_main_img);
						}
						
						$fwViewData['img_success_msg'] = $success_msg;
						$fwViewData['showImagesIframe'] = '0';
					}
					else
					{
						$fwViewData['file_exist'] = "Image is mandatory. Please upload the Image.";
						$fwViewData['showImagesIframe'] = 1;
					}
				}
				else
				{
					$fwViewData['detail'] = $data;
					$fwViewData['file_exist'] = "A file already exists with this filename. Please Rename the file and Upload it again.";
					$fwViewData['showImagesIframe'] = 1;
				}
			}
		break;

		case 'showimages':
			$bus_id = $fwRequest -> getParamget('bus_id','');
			$divid = $fwRequest -> getParamget('divid','');
			$pagenum = $fwRequest -> getParamget('pagenum','');
			$perpage = $fwRequest -> getparamget('imgperpage','');
			
			if($bus_id>0)
			{
				$sql = "SELECT bf.*, c.customer_name FROM business_file as bf
						LEFT JOIN customers as c
						ON bf.bf_user_id = c.user_id
						WHERE bf.bf_bsn_id = $bus_id 
						ORDER BY bf_id DESC";
						
				$detail = $fwDb -> query($sql);
				
			$userData = $detail;
			
			/*************** Begin Pagination *****************/
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
									if($new_detail[$i]['bf_uploaded_date']!=0)
									{
						$new_detail[$i]['bf_uploaded_date'] = changedate_d_m_Y($new_detail[$i]['bf_uploaded_date'])." ".changetime_h_m($new_detail[$i]['bf_uploaded_date']);	
									}
									else
									{
										$new_detail[$i]['bf_uploaded_date'] = '';
									}
								}
								
								$fwViewData['images_data'] = $new_detail;
				
							}
			/*************** End Pagnation ********************/
			$fwViewData['show_images_data'] = "show";
			$fwViewData['divid'] = $divid;
			}
		break;
		
		case 'delete_image':
			$tableid = $fwRequest -> getParamget('tableid','');
			$id = $fwRequest -> getParamget('id','');
			
			$sql = "DELETE FROM business_file WHERE bf_id = $tableid";
			$temp = $fwDb->queryOne($sql);
			
			echo "$id||Image deleted successfully.";
			exit;
		break;
		
		case 'showSeller':
			$pagenum = $fwRequest->getparamget('pagenum','');
			$bus_id = $fwRequest->getparamget('bus_id', 0);			
			
			if($bus_id > 0){
			$sql = "SELECT business_sellers.*, business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_fname,bus_customers.bcust_lname,bus_customers.bcust_misc_email1, bus_customers.bcust_misc_email2, bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home FROM business_sellers
							LEFT JOIN business ON business_sellers.bs_business_id = business.bsn_id
							LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id
							WHERE  business_sellers.bs_business_id = ".$bus_id;
				
			$userData = $fwDb->query($sql);
			
			if($sql){$userData = $fwDb->query($sql);}
			
			if(!empty($userData))
			{
			if (!(isset($pagenum)))
				{
					$pagenum = 1;
				} 
			
				$rows = count($userData);
				
				$page_rows = 5;
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
			
			if($sql2){$fwViewData['list']= $fwDb->query($sql2);}
			
			}}
		break;
		
		
		case 'quickView':
			$bcust_id = $fwRequest -> getParamget('bcust_id','');
			$sql = "SELECT bus_customers.*, customers_status.cs_name FROM bus_customers LEFT JOIN customers_status ON bus_customers.bcust_status = customers_status.cs_id  WHERE bcust_id = $bcust_id";
			$data = $fwDb -> queryOne($sql);
			$fwViewData['quickViewData'] = $data;
		break;
		
		
	case 'nwen':
		$bus_id = $fwRequest ->getparamget('bus_id','');
					
					$submit_email = $fwRequest ->getparam('submit_email','');
					if($_SESSION['attach']['file_name'])
						{
						//$fwViewData['attachments'] = addslashes($_SESSION['attach']['file_name']);
						$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
						}
					else{
					$fwViewData['attach_file']="";
					}		
					if($submit_email)
						{
						$semail= $fwRequest -> getParam('semail',array());
						
						$from = SITE_EMAIL_SEND;
						$fromname = FROM_NAME;
						$subject = $semail['title'];
						$email_body = $semail['body'];
						   $attachmentsend ="None";
							if($_SESSION['attach']['file_name'])
								{   
							$attachmentsend = $_SESSION['attach']['file_name'];
							
							$attachdata = unserialize($_SESSION['attach']['file_name']);
							
							foreach($attachdata as $k => $v)
									{
									if($v)
										{
										$finalatta = BASE_URL.FILE_PATH."files/template_files/".$v;
										$fdata[] = $finalatta;
										}
									}
							$attachmentsend = serialize($fdata);				
							}
							
						$email_section = 6;
						$counter = 0;
						foreach($semail['sellers'] as $k => $v)
								{	
								list($to, $fname, $lname) = explode("||",$v);	
								$email_body1 = str_replace("{{sellerfname}}", $fname, $email_body);
								$email_body = str_replace("{{sellerlname}}", $lname, $email_body1);
								
							$toname = $fname." ".$lname;

							  if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
								{
										email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, $email_section);
									$counter++;	
								}
								$fwViewData['sent_mail'] = $counter." message(s) has sent successfully.";
							}
						
						}
						if($bus_id)
						{
							$sql_busseller = "SELECT business_sellers.bs_customers_id, bus_customers.bcust_id, 
							bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 
							FROM business_sellers
							LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id
							WHERE business_sellers.bs_business_id = ".$bus_id;
							
							$fwViewData['bus_id'] = $bus_id;
							$fwViewData['bussellers'] = $fwDb -> query($sql_busseller);
							$fwViewData['bussellers_count'] = count($fwViewData['bussellers']);

						$et_id = 6;
						$sql = "SELECT email_template.et_subject, email_template.et_body, email_template.et_attachment, email_type.emt_id FROM email_template 
						LEFT JOIN email_type ON email_template.et_section = email_type.emt_id 
						WHERE email_type.emt_id = ".$et_id. " AND email_template.et_status = 1";
						$fwViewData['compose_email_temp_data'] = $fwDb->queryOne($sql);
						

					if(!empty($fwViewData['email_temp_data']['et_attachment']) && empty($fwViewData['attach_file']))
							{
							$_SESSION['attach']['file_name'] = $fwViewData['email_temp_data']['et_attachment'];	
							$fwViewData['attach_file'] = unserialize($_SESSION['attach']['file_name']);
							}
						}	
										
		break;
		
		case 'truelog':
		$bus_id = $fwRequest ->getparamget('bus_id','');
		$edossiertemplate = new Fw_Db_Table('e_dossier_templates'); 
		
					$submit_email = $fwRequest->getparam('submit_email','');
					$save_email= $fwRequest->getparam('save_email','');	
					$delete_email= $fwRequest->getparam('delete_email','');	
					$semail= $fwRequest->getParam('semail',array());
								
					if($delete_email)
						{
						
						$this_id = $semail['edt_id'];
						$edossiertemplate->setWhere("edt_id = ".$this_id);
						$edossiertemplate->deleteRow();
						$fwViewData['sent_mail'] = "Template has been deleted successfully.";
						unset($semail);
						}
										
										
					if($save_email && empty($delete_email))
						{
						$this_id = $semail['edt_id'];
						unset($semail['edt_id']);
						$etempdata['edt_bus_id'] = $semail['bus_id'];
						$etempdata['edt_title'] = $semail['title'];
						$etempdata['edt_body'] = $semail['body'];
						if($semail['edt_status']){
						$etempdata['edt_status'] = $semail['edt_status'];
							}else{$etempdata['edt_status'] =0;}
						if($this_id > 0) 
							{
						$edossiertemplate->setWhere("edt_id = ".$this_id);	
						$edossiertemplate->updateRow($etempdata);							
							
							$fwViewData['sent_mail'] = "Template has been updated successfully.";
							
							}else
								{
												
						$edossiertemplate->setWhere("edt_title = '".trim($etempdata['edt_title'])."'");	
						if(!$edossiertemplate->rowExists())	
							{
						$edossiertemplate->insertRow($etempdata);
						$fwViewData['sent_mail'] = "Template has been saved successfully.";
							}else{
						$fwViewData['error'] = "Title already taken please try different.";
							}
						  }
						}
					
					if($submit_email && empty($delete_email))
						{
						
						$from = SITE_EMAIL_SEND;
						$fromname = FROM_NAME;
						$subject = $semail['title'];
					
						$email_body = $semail['body'];
					
						$attachmentsend ="None";
					
						$email_section = 9;
						$counter = 0;
			
					if($submit_email == 'Send')
							{
						foreach($semail['buyers'] as $k => $v)
								{	
								list($cust_id, $to, $fname, $lname) = explode("||",$v);	
								$toname = $fname." ".$lname;
								//$to = "dhirephp@gmail.com";

					   if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
								{
									//e-dossire tracking end
									$edossierlogs = new Fw_Db_Table('e_dossier_log'); 
									$edlogdata['edl_cust_id'] = $cust_id;
									$edlogdata['edl_bus_id'] = $semail['bus_id'];
									$edlogdata['edl_temp_id'] = $semail['edt_id'];
									$edlogdata['edl_to'] = $to;
									$edlogdata['edl_toname'] = $toname;
									$edlogdata['edl_user_id'] = $_SESSION['user']['user_id'];
									$edlogdata['edl_title'] = $subject;
									$edlogdata['edl_body'] = $email_body;
									$edlogdata['edl_ip'] = $_SERVER['REMOTE_ADDR'];
									$edossierlogs->insertRow($edlogdata);
									//e-dossire tracking end
									email_tracking($toname,$to, $fromname, $from, $subject, $email_body,$attachmentsend, $email_section);
									$counter++;	
								}
								
							
						  }	
						  $fwViewData['sent_mail'] = $counter." message(s) has been sent successfully.";
						  }else{
						  	$toname = SITE_NAME;
							$to = SITE_EMAIL;
							$to = "sales@capitalcommercial.com.au";
				
						   if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend))
								{
						   			$fwViewData['sent_mail'] = "Test message has been sent successfully.";
		
						  		}
						  }
						}
						if($bus_id)
						{
						
						$buyertype = $semail['buyertype'];
						$fwViewData['buyertype'] = 	$buyertype;
						
							
							switch($buyertype)
								  {
								  	case 1:
								  	$condition = "AND byer_enquiry.be_business_id = ".$bus_id;
									$condition_main = " LEFT JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id ";
								  	break;
									
									case 2:
								  	$condition = " AND bus_customers.bcust_gendec_signed_date != '0000-00-00'";
								  	break;
									
									case 3:
								  	$condition = " AND bus_customers.bcust_gendec_signed_date = '0000-00-00'";
								  	break;
									
									case 4:
								  	$condition = "";
								  	break;
									
									default :
									$condition = "AND byer_enquiry.be_business_id = ".$bus_id;
									$condition_main = " LEFT JOIN byer_enquiry ON byer_enquiry.be_customer_id = bus_customers.bcust_id ";
								  	break;
								  
								  }	
										
				$sql_busseller = "SELECT bus_customers.bcust_id,bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1 FROM bus_customers ".$condition_main." WHERE bus_customers.bcust_isbuyer = 1 ".$condition;
						
							$fwViewData['bus_id'] = $bus_id;
							$fwViewData['busbuyers'] = $fwDb->query($sql_busseller);
							$fwViewData['busbuyers_count'] = count($fwViewData['busbuyers']);
							
							$sql_bus = "SELECT business.bsn_name FROM business WHERE business.bsn_id = ".$bus_id;
							$fwViewData['bus_detail'] = $fwDb->queryOne($sql_bus);
							
							
					$sql_bus_docs = "SELECT document_check_list.doc_file_name FROM document_check_list WHERE document_check_list.doc_bsn_id = ".$bus_id." AND doc_upload_to_dossier = 1";
					
					
							$checkdocs = $fwDb->query($sql_bus_docs);
								if(count($checkdocs) > 0)
									{
										foreach($checkdocs as $key => $val)
											{
												if($val['doc_file_name'])
													{
$docsname .= " &#62;&#62; <a href='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['doc_file_name']."' title='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['doc_file_name']."'>".$val['doc_file_name']."</a>";
													}
											}
								}
								
								
					$sql_bus_docs = "SELECT business_documents.bd_doc_name FROM business_documents WHERE business_documents.bd_bsi_id = ".$bus_id." AND bd_upload_dossier = 1";
					
				
							$checkdocs = $fwDb->query($sql_bus_docs);
				
								if(count($checkdocs) > 0)
									{
										foreach($checkdocs as $key => $val)
											{
												if($val['bd_doc_name'])
													{
$docsname .= " >> <a href='".BASE_URL.FILE_PATH."files/business_documents/".$val['bd_doc_name']."' title='".BASE_URL.FILE_PATH."files/business_documents/".$val['bd_doc_name']."'>".$val['bd_doc_name']."</a>";
													}
											}
								}			
		
			
						if(($semail['temp_id'] || $this_id) && (empty($delete_email)))
							{
							if($this_id){$tempid = $this_id;}else{ 
							$tempid = $semail['temp_id'];}
							$edossiertemplate->setWhere("edt_id = ".$tempid); 
							$tempdata = $edossiertemplate->getRow();
							
							$tempnewdata['edt_id'] = $tempdata['edt_id'];
							$tempnewdata['et_subject'] = $tempdata['edt_title'];
							$tempnewdata['et_body'] = $tempdata['edt_body'];
							$tempnewdata['edt_status'] = $tempdata['edt_status'];
							$fwViewData['email_temp_data'] = $tempnewdata; 
						
							}else{						
							$et_id = 9;
							$sql = "SELECT email_template.et_subject, email_template.et_body, email_template.et_attachment, email_type.emt_id FROM email_template 
							LEFT JOIN email_type ON email_template.et_section = email_type.emt_id 
							WHERE email_type.emt_id = ".$et_id. " AND email_template.et_status = 1 AND email_template.et_name = 'E_DOSSIER'";
							$tempdata = $fwDb->queryOne($sql);
					
							$tempbody = str_replace("{{businessname}}", $fwViewData['bus_detail']['bsn_name'], $tempdata['et_body']);
							$tempbody = str_replace("{{downloads}}", $docsname, $tempbody);
							
	
							$tempdata['et_body'] = $tempbody;	
							$tempdata['et_subject'] = $fwViewData['bus_detail']['bsn_name'].$tempdata['et_subject'];
							
							$fwViewData['email_temp_data'] = $tempdata;
							}
				$edossiertemplate->setWhere("edt_bus_id = ".$bus_id);			
		$fwViewData['templates'] = 	$edossiertemplate->getRows();	
						}										
		break;
		
		case 'followupslist':
								$tablesalesfollowup = new Fw_Db_Table('sales_followup');
								$bus_id = $fwRequest->getparamget('bus_id', 0);
								$pagenum = $fwRequest -> getparamget('pagenum','');
								
								$sql = "SELECT sales_followup.*, sales_followup_options.sfo_name, sales_followup_types.tfo_name, users.user_name FROM sales_followup
							LEFT JOIN sales_followup_options ON sales_followup.sf_source = sales_followup_options.sfo_id
							LEFT JOIN sales_followup_types ON sales_followup.sf_types = sales_followup_types.tfo_id
							LEFT JOIN users ON users.user_id = sales_followup.sf_user_id
							WHERE sales_followup.sf_pid = ".$bus_id ." Order by sales_followup.sf_date DESC";
				
										$userData = $fwDb->query($sql);
										
										if($sql){$userData = $fwDb->query($sql);}
										
										if(!empty($userData))
										{
										if (!(isset($pagenum)))
											{
												$pagenum = 1;
											} 
										
											$rows = count($userData);
											
											$page_rows = 100;
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
										
			if($sql2){$fwViewData['listsalesfollowup']= $fwDb->query($sql2);}						
								}
																
		break;
		case 'followups':
								$tablesalesfollowup = new Fw_Db_Table('sales_followup');
								$sf_id = $fwRequest->getparamget('sf_id', 0);
								$bus_id = $fwRequest->getparamget('bus_id', 0);
								$submit = $fwRequest->getparam('savefollows','');

								if($submit)
									{
									$detail = $fwRequest->getparam('follows',array());
									$detail['sf_notes'] = stripslashes($detail['sf_notes']);
									
									
									$this_id = (int)$detail['sf_id'];
									unset($detail['sf_id']);
									if($detail['sf_date']): $detail['sf_date'] = changedate_y_m_d($detail['sf_date']); endif;
									if($this_id > 0){
									$tablesalesfollowup->setWhere("sf_id = ".$this_id);	
									$tablesalesfollowup->updateRow($detail);
									}else{
									$detail['sf_pid'] = $bus_id;
									$detail['sf_user_id'] = $_SESSION['user']['user_id'];
									$detail['sf_status'] = 'Active';
									$tablesalesfollowup->insertRow($detail);
									}
										$fwViewData['oprsucces'] = "Saved";
									}
								
								if($sf_id > 0){
									$tablesalesfollowup->setWhere("sf_id = ".$sf_id);
									$fwViewData['followupsdetail'] = $tablesalesfollowup->getRow(); 
									}
								 
								$tablefollowsource = new Fw_Db_Table('sales_followup_options');
								$tablefollowsource -> setWhere("sfo_status = 'Active'");
								$fwViewData['alltablefollowsource'] = $tablefollowsource->getRows();
								
								$tablefollowtypes = new Fw_Db_Table('sales_followup_types');
								$tablefollowtypes -> setWhere("tfo_status = 'Active'");
								$fwViewData['alltablefollowtypes'] = $tablefollowtypes->getRows();

								$fwViewData['followupsform'] = "Show"; 	
						
		break;
		case 'followupsdel':
		$tablesalesfollowup = new Fw_Db_Table('sales_followup');
		$sf_id = $fwRequest->getparamget('sf_id', 0);	
							if($sf_id > 0){
							   $tablesalesfollowup->setWhere("sf_id = ".$sf_id);
								$tablesalesfollowup->deleteRow();
								echo "Record has been deleted.";	
							 }
		exit;							 
		break;
		
		
	case 'getpms':
		$tablemoney = new Fw_Db_Table('project_money');
			$bus_id = $fwRequest->getparamget('bus_id', 0);	
			if($bus_id > 0){
			   $tablemoney->setWhere("pm_business_id = ".$bus_id);						   
			   $fwViewData['listmoney'] = $tablemoney->getRows();
			   $fwViewData['showlistmoney'] = "Show";
							 }						 
		break;	
		
		case 'deletepms':
		$tablemoney = new Fw_Db_Table('project_money');
		$pm_id = $fwRequest->getparamget('pm_id', 0);	
							if($pm_id > 0){
							   $tablemoney->setWhere("pm_id = ".$pm_id);
							   $tablemoney->deleteRow();
							echo "Record has been deleted.";	
							 }
		exit;							 
		break;
  }
} 

$submit = $fwRequest->getParam('not_required_save', '');

$sqlPtask = "Select count(*) as tot from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 1" ;
$taskData = $fwDb->queryOne($sqlPtask);
$fwViewData['tot'] = $taskData['tot'];

$sqlPtask2 = "Select count(*) as tot2 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 2" ;
$taskData2 = $fwDb->queryOne($sqlPtask2);
$fwViewData['tot2'] = $taskData2['tot2'];

$sqlPtask3 = "Select count(*) as tot3 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 3" ;
$taskData3 = $fwDb->queryOne($sqlPtask3);
$fwViewData['tot3'] = $taskData3['tot3'];

$sqlPtask4 = "Select count(*) as tot4 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 4" ;
$taskData4 = $fwDb->queryOne($sqlPtask4);
$fwViewData['tot4'] = $taskData4['tot4'];

$sqlPtask5 = "Select count(*) as tot5 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 5" ;
$taskData5 = $fwDb->queryOne($sqlPtask5);
$fwViewData['tot5'] = $taskData5['tot5'];

$sqlPtask6 = "Select count(*) as tot6 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 6" ;
$taskData6 = $fwDb->queryOne($sqlPtask6);
$fwViewData['tot6'] = $taskData6['tot6'];


$sqlPtask7 = "Select count(*) as tot7 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 7" ;
$taskData7 = $fwDb->queryOne($sqlPtask7);
$fwViewData['tot7'] = $taskData7['tot7'];

$sqlPtask8 = "Select count(*) as tot8 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 8" ;
$taskData8 = $fwDb->queryOne($sqlPtask8);
$fwViewData['tot8'] = $taskData8['tot8'];

$sqlPtask9 = "Select count(*) as tot9 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 9" ;
$taskData9 = $fwDb->queryOne($sqlPtask9);
$fwViewData['tot9'] = $taskData9['tot9'];

$sqlPtask10 = "Select count(*) as tot10 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 10" ;
$taskData10 = $fwDb->queryOne($sqlPtask10);
$fwViewData['tot10'] = $taskData10['tot10'];

$sqlPtask11 = "Select count(*) as tot11 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 11" ;
$taskData11 = $fwDb->queryOne($sqlPtask11);
$fwViewData['tot11'] = $taskData11['tot11'];

$sqlPtask12 = "Select count(*) as tot12 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 12" ;
$taskData12 = $fwDb->queryOne($sqlPtask12);
$fwViewData['tot12'] = $taskData12['tot12'];

$sqlPtask13 = "Select count(*) as tot13 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 13" ;
$taskData13 = $fwDb->queryOne($sqlPtask13);
$fwViewData['tot13'] = $taskData13['tot13'];

$sqlPtask14 = "Select count(*) as tot14 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 14" ;
$taskData14 = $fwDb->queryOne($sqlPtask14);
$fwViewData['tot14'] = $taskData14['tot14'];

$sqlPtask15 = "Select count(*) as tot15 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 15" ;
$taskData15 = $fwDb->queryOne($sqlPtask15);
$fwViewData['tot15'] = $taskData15['tot15'];


$sqlPtask16 = "Select count(*) as tot16 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 16" ;
$taskData16 = $fwDb->queryOne($sqlPtask16);
$fwViewData['tot16'] = $taskData16['tot16'];

$sqlPtask17 = "Select count(*) as tot17 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 17" ;
$taskData17 = $fwDb->queryOne($sqlPtask17);
$fwViewData['tot17'] = $taskData17['tot17'];

$sqlPtask18 = "Select count(*) as tot18 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 18" ;
$taskData18 = $fwDb->queryOne($sqlPtask18);
$fwViewData['tot18'] = $taskData18['tot18'];

$sqlPtask19 = "Select count(*) as tot19 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 19" ;
$taskData19 = $fwDb->queryOne($sqlPtask19);
$fwViewData['tot19'] = $taskData19['tot19'];

$sqlPtask20 = "Select count(*) as tot20 from proposal_tasks where bt_bsn_id = ". $bus_id . " And  bt_task_list_number = 20" ;
$taskData20 = $fwDb->queryOne($sqlPtask20);
$fwViewData['tot20'] = $taskData20['tot20'];

$sqldone = "Select count(*) as done from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 1";
$taskdone = $fwDb->queryOne($sqldone);
$fwViewData['done'] = $taskdone['done'];

$sqldone2 = "Select count(*) as done2 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 2";
$taskdone2 = $fwDb->queryOne($sqldone2);
$fwViewData['done2'] = $taskdone2['done2'];

$sqldone3 = "Select count(*) as done3 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 3";
$taskdone3 = $fwDb->queryOne($sqldone3);
$fwViewData['done3'] = $taskdone3['done3'];

$sqldone4 = "Select count(*) as done4 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 4";
$taskdone4 = $fwDb->queryOne($sqldone4);
$fwViewData['done4'] = $taskdone4['done4'];

$sqldone5 = "Select count(*) as done5 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 5";
$taskdone5 = $fwDb->queryOne($sqldone5);
$fwViewData['done5'] = $taskdone5['done5'];

$sqldone6 = "Select count(*) as done6 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 6";
$taskdone6 = $fwDb->queryOne($sqldone6);
$fwViewData['done6'] = $taskdone6['done6'];

$sqldone7 = "Select count(*) as done7 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 7";
$taskdone7 = $fwDb->queryOne($sqldone7);
$fwViewData['done7'] = $taskdone7['done7'];


$sqldone8 = "Select count(*) as done8 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 8";
$taskdone8 = $fwDb->queryOne($sqldone8);
$fwViewData['done8'] = $taskdone8['done8'];

$sqldone9 = "Select count(*) as done9 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 9";
$taskdone9 = $fwDb->queryOne($sqldone9);
$fwViewData['done9'] = $taskdone9['done9'];

$sqldone10 = "Select count(*) as done10 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 10";
$taskdone10 = $fwDb->queryOne($sqldone10);
$fwViewData['done10'] = $taskdone10['done10'];

$sqldone11 = "Select count(*) as done11 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 11";
$taskdone11 = $fwDb->queryOne($sqldone11);
$fwViewData['done11'] = $taskdone11['done11'];

$sqldone12 = "Select count(*) as done12 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 12";
$taskdone12 = $fwDb->queryOne($sqldone12);
$fwViewData['done12'] = $taskdone12['done12'];

$sqldone13 = "Select count(*) as done13 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 13";
$taskdone13 = $fwDb->queryOne($sqldone13);
$fwViewData['done13'] = $taskdone13['done13'];

$sqldone14 = "Select count(*) as done14 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 14";
$taskdone14 = $fwDb->queryOne($sqldone14);
$fwViewData['done14'] = $taskdone14['done14'];

$sqldone15 = "Select count(*) as done15 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 15";
$taskdone15 = $fwDb->queryOne($sqldone15);
$fwViewData['done15'] = $taskdone15['done15'];

$sqldone16 = "Select count(*) as done16 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 16";
$taskdone16 = $fwDb->queryOne($sqldone16);
$fwViewData['done16'] = $taskdone16['done16'];

$sqldone17 = "Select count(*) as done17 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 17";
$taskdone17 = $fwDb->queryOne($sqldone17);
$fwViewData['done17'] = $taskdone17['done17'];

$sqldone18 = "Select count(*) as done18 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 18";
$taskdone18 = $fwDb->queryOne($sqldone18);
$fwViewData['done18'] = $taskdone18['done18'];

$sqldone19 = "Select count(*) as done19 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 19";
$taskdone19 = $fwDb->queryOne($sqldone19);
$fwViewData['done19'] = $taskdone19['done19'];

$sqldone20 = "Select count(*) as done20 from proposal_tasks where bt_bsn_id = ". $bus_id . " And bt_complete = 1 And  bt_task_list_number = 20";
$taskdone20 = $fwDb->queryOne($sqldone20);
$fwViewData['done20'] = $taskdone20['done20'];

















