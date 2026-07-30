<?php
$table = new Fw_Db_Table($TABLE);
$tablebyersotherdata = new Fw_Db_Table('byers_other_data');
$tableemailtemplate = new Fw_Db_Table('email_template');
$edossiertemplate = new Fw_Db_Table('e_dossier_templates');
$buyerTable = new Fw_Db_Table('bus_customers');
$tablebuyerenq = new Fw_Db_Table('byer_enquiry');
$fwMainView = 'file:' . getcwd() . '/custdetail.tpl';
$request = $fwRequest->getParam('a_req', '');
$user_id = $_SESSION['user']['user_id'];
$pagenum = $fwRequest->getparamget('pagenum','');
$inspagenum = $fwRequest->getparamget('inspagenum','');
$mopagenum = $fwRequest->getparamget('mopagenum','');
$inforpagenum = $fwRequest->getparamget('inforpagenum','');

if($request) 
	{		
	
	if($request == 'byersaleenquiry')
			{
									$submit = $fwRequest->getParam('subAddDetail', '');
									$fwViewData['cust_id'] = $fwRequest->getParam('cust_id', '');
								
									$bsn_name = $fwRequest->getparamget('bsn_name', 'yes');
									$tablebyerenquiry = new Fw_Db_Table('business_sellers');
									$bbfs_id = $fwRequest->getparam('bs_id', 0); 
									$fwViewData['result'] =0;
									$fwViewData['button'] = "Add";	
									$fwViewData['customer_detail'] = "Customerinfo";	
								
									if($bbfs_id > 0)
										{
															$sql2="SELECT business_sellers.*, business.bsn_id,business.bsn_name FROM business_sellers 
															LEFT JOIN business ON business_sellers.bs_business_id =  business.bsn_id 
															WHERE business_sellers.bs_id = ".$bbfs_id;
															$userData= $fwDb->queryOne($sql2);
															$fwViewData['detail'] = $userData;
												
															$fwViewData['button'] = "Edit";
															$fwViewData['cust_id'] = $userData['bs_customers_id'];					
										}	
									if($submit)
									{
															$detail = $fwRequest->getParam($TABLE, array());
															$table_id = (int)$detail['bs_id'];
															$bs_business_id = (int)$detail['bs_business_id'];
															$bs_customers_id = (int)$detail['bs_customers_id'];
								
															if($table_id > 0)
																{
																$tablebyerenquiry->setWhere("bs_id = ".$table_id);
																$id= $tablebyerenquiry->updateRow($detail);
				
																}
															else
																{
							$tablebyerenquiry->setWhere("bs_business_id = ".$bs_business_id." AND bs_customers_id = ".$bs_customers_id);
																	if(!$tablebyerenquiry->rowExists())
																		{
																			$id=$tablebyerenquiry->insertRow($detail);
																		}
																}
															$fwViewData['result'] = 1;
						
									}
							
		
		
	}elseif($request == 'buyerenquiriesinfo'){
	
									$tablebyerenquiry = new Fw_Db_Table('byer_enquiry');
									$tablefollowups = new Fw_Db_Table('befollowups');
									$tablebyersotherdata = new Fw_Db_Table('byers_other_data');
									$submit = $fwRequest->getParam('subAddDetail2', '');
									$followsubmit = $fwRequest->getParam('followsubAddDetail', '');
									$addinspection = $fwRequest->getParam('addinspection', '');
									$addmakeoffer = $fwRequest->getParam('addmakeoffer', '');
									$addinforeq = $fwRequest->getParam('addinforeq', '');
									$cust_id  = $fwRequest->getParamget('cust_id', '');
									$be_id  = $fwRequest->getParamget('be_id', '');
									$be_id  = $fwRequest->getParam('be_id', '');
									$fwViewData['action']  = $fwRequest->getParamget('action', '');
									$delete  = $fwRequest->getParamget('delete', '');
									$bef_fups_id  = $fwRequest->getParamget('bef_fups_id', '');
									$fwViewData['be_id'] = $be_id;
									$fwViewData['msg'] =0;
									$fwViewData['button'] = "Add";	
									$fwViewData['follwbutton'] = "Add";	
									//$fwViewData['action'] = "hide";
									$fwViewData['customer_business_sale_detail'] = "Customerbusinesssaleinfo";	
									$fwViewData['cust_id'] = $cust_id;
									$fwViewData['user_id'] = $_SESSION['user']['user_id'];
	
	/*start inspection*/		
	
	

	
								$fwViewData['insbutton'] = "Add";		
								$insdelete  = $fwRequest->getParamget('insdelete', '');
								$bod_id = $fwRequest->getParamget('bod_id', '');
						    	if($bod_id)
										{
										$tablebyersotherdata->setWhere("bod_id = ".$bod_id);
										$fwViewData['insdata'] = $tablebyersotherdata->getRow();
									
										switch ($fwViewData['insdata']['bod_type'])
												{
													case 1:
													$fwViewData['action'] ="showinspection";
													$fwViewData['insbutton'] ="Edit";
													break;	
												
													case 2:
													$fwViewData['action'] ="showmakeoffer";
													$fwViewData['mobutton'] ="Edit";
													break;	
													
													case 3:
													$fwViewData['action'] ="showinfor";
													$fwViewData['insbutton'] ="Edit";
													break;	
												
												}
										
								
										}

									if($addinspection)
										{
										$addinspectiondata = $fwRequest->getParam($TABLE, array());
																
												$addinspectiondata['bod_type'] = 1;
												$bod_id = (int)$addinspectiondata['bod_id'];
												unset($addinspectiondata['bod_id']);
												$addinspectiondata['bod_body']=clean_data_special($addinspectiondata['bod_body']);
										
														if($bod_id > 0)
																{
																$tablefollowups->setWhere("bod_id = ".$bod_id);
																$tablebyersotherdata->updateRow($addinspectiondata);
																}
															else
																{
															$addinspectiondata['bod_user_id']= $user_id;	
															$tablebyersotherdata->insertRow($addinspectiondata);
																}
														$fwViewData['action'] ="hide";				
										}
									
									if($cust_id > 0 && $be_id > 0){
						
										$sqlins = "SELECT *  FROM byers_other_data WHERE bod_type = 1 AND bod_be_id = ".$be_id;
										$userData = $fwDb->query($sqlins);

									if(!empty($userData))
									{
									if (!(isset($inspagenum)))
										{
											$inspagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
										$inslast = ceil($rows/$page_rows); 
										
										if ($inspagenum <= 1)
										{
											$inspagenum = 1;
										}
										elseif ($inspagenum > $inslast)
										{
											$inspagenum = $inslast;
										}
										$fwViewData['inslast'] = $inslast;
										$fwViewData['inslastone'] = $inslast-1;
										$fwViewData['inslasttow'] = $inslast-2;
										$fwViewData['inspagenum'] = $inspagenum;
										$inspagenatedatanext = $inspagenum;
										$inspagenatedataprev = $inspagenum;
										for($i=0; $i<9; $i++)
											{
											$inspaginate[$inspagenatedatanext] = $inspagenatedatanext;
											$inspagenatedatanext ++;
											}
											$fwViewData['inspaginatenext'] = $inspaginate;
										$inspagenatedataprev = $inspagenum;	
										for($i=0; $i<9; $i++)
											{
											$inspaginateprev[$inspagenatedataprev] = $inspagenatedataprev;
											$inspagenatedataprev --;
											}
										$fwViewData['inspaginateprev'] = array_reverse($inspaginateprev);
										
										$max = 'limit ' .($inspagenum - 1) * $page_rows .',' .$page_rows;
										
										$sql2 =  $sqlins." ".$max;
							
									if($sql2){$fwViewData['inspectionlist']= $fwDb->query($sql2);}
									
									if(empty($fwViewData['inspectionlist']))
										{
										$fwViewData['inspectionlist'] = 1;
										
										}
									
									}}
									
								if($insdelete)	
									{
									$bod_id = $fwRequest->getParam('bod_id', '');
									$tablebyersotherdata->setWhere("bod_id = ".$bod_id);
									$tablebyersotherdata->deleteRow();
									$fwViewData['action'] ="hide";	
									}		
						
/*end inspection*/


/*start  Make Offer*/		
								$fwViewData['mobutton'] = "Add";		
									if($addmakeoffer)
										{
								
										$addmakeofferdata = $fwRequest->getParam($TABLE, array());
																	
												$addmakeofferdata['bod_type'] = 2;
												$bod_id = (int)$addmakeofferdata['bod_id'];
													unset($addmakeofferdata['bod_id']);
										
											$addmakeofferdata['bod_body']=clean_data_special($addmakeofferdata['bod_body']);
														if($bod_id > 0)
																{
																$tablefollowups->setWhere("bod_id = ".$bod_id);
																$tablebyersotherdata->updateRow($addmakeofferdata);
																}
															else
																{
															$addmakeofferdata['bod_user_id']= $user_id;			
															$tablebyersotherdata->insertRow($addmakeofferdata);
																}
														$fwViewData['action'] ="hide";				
										}
									
									if($cust_id > 0 && $be_id > 0){
						
										$sqlmo = "SELECT * FROM byers_other_data WHERE bod_type = 2 AND bod_be_id = ".$be_id;
										$userData = $fwDb->query($sqlmo);

									if(!empty($userData))
									{
									if (!(isset($mopagenum)))
										{
											$mopagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
										$molast = ceil($rows/$page_rows); 
										
										if ($mopagenum <= 1)
										{
											$mopagenum = 1;
										}
										elseif ($mopagenum > $molast)
										{
											$mopagenum = $molast;
										}
										$fwViewData['molast'] = $molast;
										$fwViewData['molastone'] = $molast-1;
										$fwViewData['molasttow'] = $molast-2;
										$fwViewData['mopagenum'] = $mopagenum;
										$mopagenatedatanext = $mopagenum;
										$mopagenatedataprev = $mopagenum;
										for($i=0; $i<9; $i++)
											{
											$mopaginate[$mopagenatedatanext] = $mopagenatedatanext;
											$mopagenatedatanext ++;
											}
											$fwViewData['mopaginatenext'] = $mopaginate;
										$mopagenatedataprev = $mopagenum;	
										for($i=0; $i<9; $i++)
											{
											$mopaginateprev[$mopagenatedataprev] = $mopagenatedataprev;
											$mopagenatedataprev --;
											}
										$fwViewData['mopaginateprev'] = array_reverse($mopaginateprev);
										
										$max = 'limit ' .($mopagenum - 1) * $page_rows .',' .$page_rows;
										
										$sqlmo =  $sqlmo." ".$max;
							
									if($sqlmo){$fwViewData['makeofferlist']= $fwDb->query($sqlmo);}
									}}
/*end  Make Offer*/
/*start Information Request*/		
								$fwViewData['inforbutton'] = "Add";		
									if($addinforeq)
										{
								
										$addinfordata = $fwRequest->getParam($TABLE, array());
																	
												$addinfordata['bod_type'] = 3;
												$bod_id = (int)$addinfordata['bod_id'];
													unset($addinfordata['bod_id']);
													 $addinfordata['bod_body']=clean_data_special($addinfordata['bod_body']);
														if($bod_id > 0)
																{
																$tablefollowups->setWhere("bod_id = ".$bod_id);
																$tablebyersotherdata->updateRow($addinfordata);
																}
															else
																{
															$addinfordata['bod_user_id']= $user_id;		
															$tablebyersotherdata->insertRow($addinfordata);
																}
														$fwViewData['action'] ="hide";				
										}
									
									if($cust_id > 0 && $be_id > 0){
						
										$sqlinfor = "SELECT * FROM byers_other_data WHERE bod_type = 3 AND bod_be_id = ".$be_id;
										$userData = $fwDb->query($sqlinfor);

									if(!empty($userData))
									{
									if (!(isset($inforpagenum)))
										{
											$inforpagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
										$inforlast = ceil($rows/$page_rows); 
										
										if ($inforpagenum <= 1)
										{
											$inforpagenum = 1;
										}
										elseif ($inforpagenum > $inforlast)
										{
											$inforpagenum = $inforlast;
										}
										$fwViewData['inforlast'] = $inforlast;
										$fwViewData['inforlastone'] = $inforlast-1;
										$fwViewData['inforlasttow'] = $inforlast-2;
										$fwViewData['inforpagenum'] = $inforpagenum;
										$inforpagenatedatanext = $inforpagenum;
										$inforpagenatedataprev = $inforpagenum;
										for($i=0; $i<9; $i++)
											{
											$inforpaginate[$inforpagenatedatanext] = $inforpagenatedatanext;
											$inforpagenatedatanext ++;
											}
											$fwViewData['inforpaginatenext'] = $inforpaginate;
										$inforpagenatedataprev = $inforpagenum;	
										for($i=0; $i<9; $i++)
											{
											$inforpaginateprev[$inforpagenatedataprev] = $inforpagenatedataprev;
											$inforpagenatedataprev --;
											}
										$fwViewData['inforpaginateprev'] = array_reverse($inforpaginateprev);
										
										$max = 'limit ' .($inforpagenum - 1) * $page_rows .',' .$page_rows;
										
										$sqlinfor =  $sqlinfor." ".$max;
							
									if($sqlinfor){$fwViewData['inforlist']= $fwDb->query($sqlinfor);}
	
									}}
	/*end  Information Request*/

									if($be_id > 0)
										{
		$sql100 = "SELECT byer_enquiry.*, business.bsn_id, business.bsn_name, bus_customers.bcust_id, bus_customers.bcust_gendec_signed_date,
			users.user_id, users.user_name, ipc.user_id as ipc_user_id,ipc.user_name as ipc_user_name,  
			sed.user_id as sed_user_id,sed.user_name as sed_user_name,
			easts.user_id as easts_user_id,easts.user_name as easts_user_name FROM byer_enquiry LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
															LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id
															LEFT JOIN users ON byer_enquiry.be_user = users.user_id
															LEFT JOIN users as ipc ON byer_enquiry.be_ipc_user = ipc.user_id
															LEFT JOIN users as sed ON byer_enquiry.be_sed_user = sed.user_id
															LEFT JOIN users as easts ON byer_enquiry.be_easts_user = easts.user_id
															WHERE byer_enquiry.be_id = ".$be_id." AND be_customer_id = ". $cust_id;	
															$detail = $fwDb->queryOne($sql100);
															$fwViewData['detail'] = clean_query_for_show($detail);
													
															$fwViewData['detail']['be_created_date'] = changedate_d_m_y($fwViewData['detail']['be_created_date']);
															$fwViewData['detail']['be_ipc_date'] = changedate_d_m_y($fwViewData['detail']['be_ipc_date']);
															$fwViewData['detail']['be_sed_date'] = changedate_d_m_y($fwViewData['detail']['be_sed_date']);
															$fwViewData['detail']['be_easts_date'] = changedate_d_m_y($fwViewData['detail']['be_easts_date']);	
															$fwViewData['button'] = "Edit";	
														//$fwViewData['cust_id'] = $detail['be_customer_id'];			
									
										}
										
												if($bef_fups_id > 0)
												{
												$tablefollowups->setWhere("bef_fups_id = ".$bef_fups_id);
												$fwViewData['ffdetail'] = $tablefollowups->getRow();
												$fwViewData['action'] ="show";	
													$fwViewData['follwbutton'] = "Edit";	
													if($fwViewData['detail']['bef_done_user'] == 0)
														{
														$fwViewData['detail']['bef_done_user'] = $user_id;
														
														}
													
																				
												}
												
										
										if($followsubmit)
												{
												
												$followdetail = $fwRequest->getParam($TABLE, array());
										
												$followdetail['bef_create_date'] = changedate_y_m_d($followdetail['bef_create_date']);
												$followdetail['bef_done_date'] = changedate_y_m_d($followdetail['bef_done_date']);
												
												$bef_fups_id = (int)$followdetail['bef_fups_id'];
													unset($followdetail['bef_fups_id']);
													
													if(empty($followdetail['bef_done_date']) || $followdetail['bef_done_date'] == '0000-00-00')
														{
														unset($followdetail['bef_done_user']);
														}
														$followdetail['bef_comments']=clean_data_special($followdetail['bef_comments']);
													if($bef_fups_id > 0)
																{
																$tablefollowups->setWhere("bef_fups_id = ".$bef_fups_id);
																$id= $tablefollowups->updateRow($followdetail);
																}
															else
																{
																$followdetail['bef_create_user'] = $_SESSION['user']['user_id'];
																$id=$tablefollowups->insertRow($followdetail);
																}
														$fwViewData['action'] ="hide";				
												
												}
								
														
							if($delete)
								{
								$bef_fups_id  = $fwRequest->getParamget('bef_fups_id', '');
								$tablefollowups->setWhere("bef_fups_id = ".$bef_fups_id);
								$tablefollowups->deleteRow();
								$fwViewData['action'] ="hide";	
								
								}		
												
										$be_id = (int)$be_id;
										if($cust_id > 0 && $be_id > 0){
						
									$sql = "SELECT befollowups.*,users.user_id, users.user_name  FROM befollowups
													LEFT JOIN users ON befollowups.bef_done_user  = users.user_id
													WHERE  befollowups.bef_cust_id  = ".$cust_id ." AND bef_be_id = ".$be_id;
									
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
	
									if($submit)
									{		
									$detail = $fwRequest->getParam($TABLE, array());
												

															$detail['be_created_date'] = changedate_y_m_d($detail['be_created_date']);
															$detail['be_ipc_date'] = changedate_y_m_d($detail['be_ipc_date']);
															$detail['be_sed_date'] = changedate_y_m_d($detail['be_sed_date']);
															$detail['be_easts_date'] = changedate_y_m_d($detail['be_easts_date']);
															$detail['be_user_ip'] = $_SERVER['REMOTE_ADDR'];
															if(empty($detail['be_ipc_date']))
																{
																unset($detail['be_ipc_user']);
																}
																else{
																$detail['be_ipc_user'] = $user_id;
																}
															if(empty($detail['be_sed_date']))
																{
																unset($detail['be_sed_user']);
																}
																else{
																$detail['be_sed_user'] = $user_id;
																}	
															if(empty($detail['be_easts_date']))
																{
																unset($detail['be_easts_user']);
																}
																else{
																$detail['be_easts_user'] = $user_id;
																}
															if(!$detail['be_answer_required'])
																{
																$detail['be_answer_required'] = 0;
																}
											if(empty($detail['be_created_date'])){$detail['be_created_date'] = date('Y-m-d');}
											if(empty($detail['be_created_time'])){$detail['be_created_time'] = date('H:i');	}					
																
															$table_id = (int)$detail['be_id'];
															$be_customer_id = (int)$detail['be_customer_id'];
															$be_business_id = (int)$detail['be_business_id'];
															unset($detail['be_id']);
									if($table_id > 0)
										{
											$tablebyerenquiry->setWhere("be_id = ".$table_id);
											$tablebyerenquiry->updateRow($detail);
											$fwViewData['msg'] = 1;
										}
															else
																{
					$tablebyerenquiry->setWhere("be_customer_id = ".$be_customer_id." AND be_business_id = ".$be_business_id);
																	if(!$tablebyerenquiry->rowExists())
																		{
																		$detail['be_user'] = $_SESSION['user']['user_id'];
																		
																		$table_id=$tablebyerenquiry->insertRow($detail);
																		
															// Buyer general disclaimer email
		
					$bsn_id = $detail['be_business_id'];
				if($detail['be_customer_id'])
					{		
						$buyerTable = new Fw_Db_Table('bus_customers');
						$buyerTable->setWhere("bcust_id=".$detail['be_customer_id']." AND bcust_gendec_signed_date = '0000-00-00'");
								$fromname = FROM_NAME;
								$from = SITE_EMAIL_SEND;
								
					if($buyerTable->rowExists())
						{
					$getbuyerdata = $buyerTable->getRow();
					
					
						// send general disclaimer
						//send_general_disclamer($getbuyerdata['bcust_fname'], $getbuyerdata['bcust_lname'], trim($getbuyerdata['bcust_misc_email1']));
						// send general disclaimer
						$buyerdata['bcust_gendec_sent_date'] = 	date('Y-m-d');
						$buyerdata['bcust_gendec_sent_time'] = 	date('H:i');
						$buyerdata['bcust_gendec_comments'] = "Auto sent, \nEmailed ".$getbuyerdata['bcust_misc_email1'];
						$id = $buyerTable->updateRow($buyerdata);

						}else{
						
						/////SEND E DOSSAIRE /////
					
						$edossiertemplate->setWhere("edt_bus_id = ".$bsn_id);
						$etemplatedata = $edossiertemplate->getRows();
						$buyerTable->setWhere("bcust_id=".$detail['be_customer_id']);
						$getbuyerdata = $buyerTable->getRow();
						$tablebusiness = new Fw_Db_Table('business');
						$tablebusiness->setWhere("bsn_id = ".$bsn_id." AND bsn_auto_edossier = 1");
							
						if($tablebusiness->rowExists())
							{
					
						if(count($etemplatedata) > 0)	
							{
								foreach($etemplatedata as $k => $v)
									{
										
							$email_subject = $v['edt_title'];
							$email_body =$v['edt_body'];
							$toname = ucwords(strtolower($getbuyerdata['bcust_fname']." ".$getbuyerdata['bcust_lname']));
							
							$to = trim($getbuyerdata['bcust_misc_email1']);
							//$to = "dhirephp@gmail.com";
							//$to = "frank@businessbuys.com.au";
							
					$attachment = "";
					
					
									
					if(send_email($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment))
						{
						//e-dossire tracking end
										$edossierlogs = new Fw_Db_Table('e_dossier_log'); 
										$edlogdata['edl_cust_id'] = $getbuyerdata['bcust_id'];
										$edlogdata['edl_bus_id'] = $v['edt_bus_id'];
										$edlogdata['edl_be_id'] = $table_id;	
										$edlogdata['edl_temp_id'] = $v['edt_id'];
										$edlogdata['edl_to'] = $to;
										$edlogdata['edl_toname'] = $toname;
										$edlogdata['edl_user_id'] = $_SESSION['user']['user_id'];
										$edlogdata['edl_title'] = $v['edt_title'];
										$edlogdata['edl_body'] = $v['edt_body'];
										$edlogdata['edl_ip'] = $_SERVER['REMOTE_ADDR'];								
										$edossierlogs->insertRow($edlogdata);
									//e-dossire tracking end

						email_tracking($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment, 9);
						}
					$buyer_emails .= $to."\n";
						}	
					}
						if($buyer_emails)
							{
						$emailedossairetobuyer['be_sed_date'] = date('Y-m-d');
						$emailedossairetobuyer['be_sed_time'] = date('H:i');
						$emailedossairetobuyer['be_sed_comments'] = "Auto sent, \nEmailed ".$buyer_emails;
						$emailedossairetobuyer['be_sed_user'] = $user_id;
						$tablebyerenquiry->setWhere("be_id=".$table_id);
						$tablebyerenquiry->updateRow($emailedossairetobuyer);
							}
			}		}
						
												
	 }	
				  											 // Buyer general disclaimer email
				   
															
																	
																	
															// vender e_idmail
						$tableemailtemplate = new Fw_Db_Table('email_template');							
													
 					$custenquiry_sql = "SELECT byer_enquiry.be_id, byer_enquiry.be_created_date, business.bsn_id, business.bsn_name, business.bsn_cd_contact, business.bsn_cd_email, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_gendec_signed_date, enquirysource.soe_id, enquirysource.soe_name
			FROM byer_enquiry 
			LEFT JOIN business ON business.bsn_id = byer_enquiry.be_business_id 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id
			LEFT JOIN enquirysource ON enquirysource.soe_id = byer_enquiry.be_source_of_enquiry WHERE byer_enquiry.be_id = ".$table_id;
 $customerdata= $fwDb->queryOne($custenquiry_sql);

  if($customerdata['bcust_gendec_signed_date'] != '0000-00-00'){$et_name = "Seller New Enquiry Disclaimer"; $gdstatus = "Yes";}else{$et_name = "Seller New Enquiry No Disclaimer"; $gdstatus = "No";}
			$bsn_id = $customerdata['bsn_id'];
  		$tableemailtemplate->setWhere("et_section = 4 AND et_name = '".$et_name."' AND et_status = 1");
  		$tempdata = $tableemailtemplate->getRow();
		
		if($tempdata)
			{
			$sellers_sql = "SELECT bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1
			FROM business_sellers 
			LEFT JOIN business ON business.bsn_id = business_sellers.bs_business_id 
			LEFT JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id
			 WHERE business_sellers.bs_business_id = ".$bsn_id;
 			$sellersdata= $fwDb->query($sellers_sql);			
			$sellers_emails = '';
		$fromname = FROM_NAME;
		$from = SITE_EMAIL_SEND;
			if($customerdata['be_created_date'] !== '0000-00-00'){ $ul_text ="Yes";}else{$ul_text ="No";}
		
			foreach($sellersdata as $k => $v)
					{
			$email_subject = $customerdata['bsn_name']." - ".$tempdata['et_subject'];
			
			$updatetempdata = $tempdata['et_body'];
			$cur_dt = date('d-m-Y H:i');
			$updatetempdata = str_replace("{{sellerfname}}", ucwords(strtolower($v['bcust_fname'])), $updatetempdata);
			$updatetempdata = str_replace("{{sellerlname}}", ucwords(strtolower($v['bcust_lname'])), $updatetempdata);
			$updatetempdata = str_replace("{{buyerfname}}", ucwords(strtolower($customerdata['bcust_fname'])), $updatetempdata);
			$updatetempdata = str_replace("{{buyerlname}}", ucwords(strtolower($customerdata['bcust_lname'])), $updatetempdata);
			$updatetempdata = str_replace("{{buyeremail}}", ucwords(strtolower($customerdata['bcust_misc_email1'])), $updatetempdata);
			$updatetempdata = str_replace("{{enquirysource}}", $customerdata['soe_name'], $updatetempdata);
			$updatetempdata = str_replace("{{businessname}}", $customerdata['bsn_name'], $updatetempdata);
			$updatetempdata = str_replace("{{currenttime}}", $cur_dt, $updatetempdata);
			$updatetempdata = str_replace("{{loggedstatus}}", $ul_text, $updatetempdata);
			$updatetempdata = str_replace("{{gdstatus}}", $gdstatus, $updatetempdata);
			$updatetempdata = str_replace("{{logourl}}", $LOGO, $updatetempdata);
			$email_body = $updatetempdata;
			$toname = ucwords(strtolower($v['bcust_fname']." ".$v['bcust_lname']));
			$to = trim($v['bcust_misc_email1']);
			//$to = "dharmendra@ephpsolutions.com";
			//$to = "frank@businessbuys.com.au";
	$subject = $email_template_data['et_subject'];
	$attachment = "";

	if(send_email($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment))
		{
	email_tracking($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment, 4);
		}
		$sellers_emails .= $to."\n";
		
				}	
						$emailadvicesenttoseller['be_easts_date'] = date('Y-m-d');
						$emailadvicesenttoseller['be_easts_time'] = date('H:i');
						$emailadvicesenttoseller['be_easts_comments'] = "Auto sent, \nEmailed ".$sellers_emails;
						$emailadvicesenttoseller['be_easts_user'] = 1;
						
						$tablebyerenquiry->setWhere("be_id=".$table_id);
						$tablebyerenquiry->updateRow($emailadvicesenttoseller);
					    	
						 	// vender e_idmail
							
							// send general disclaimer
				if($be_customer_id)
					{		
						$buyerTable = new Fw_Db_Table('bus_customers');
						$buyerTable->setWhere("bcust_id=".$be_customer_id." AND bcust_gendec_sent_date == '0000-00-00'");
			
					if($buyerTable->rowExists())
						{
						$getbuyerdata = $buyerTable->getRow();
						// send general disclaimer
					//send_general_disclamer($getbuyerdata['bcust_fname'], $getbuyerdata['bcust_lname'], trim($getbuyerdata['bcust_misc_email1']));
						// send general disclaimer
						$buyerdata['bcust_gendec_sent_date'] = 	date('Y-m-d');
						$buyerdata['bcust_gendec_sent_time'] = 	date('H:i');
						$buyerdata['bcust_gendec_comments'] = "Auto sent, \nEmailed ".$getbuyerdata['bcust_misc_email1'];
						$id = $buyerTable->updateRow($buyerdata);
						}		
					}	
							
						// send general disclaimer								
										$fwViewData['msg'] = 1;														
				}											
			}	
		}									
	
									$fwViewData['msgbuyerenquiryupdate'] = $id;
}
									if(empty($detail['user_id']))
									{$fwViewData['detail']['user_id'] = $_SESSION['user']['user_id'];
									$fwViewData['detail']['user_name'] = $_SESSION['user']['user_name'];}
								
									
									

		$tableenquirysource = new Fw_Db_Table('enquirysource');
		$tableenquirysource->setOrderBy('soe_order'.' ASC');
		$tableenquirysource->setWhere("soe_status = 1");
		$fwViewData['enquiry_source']=$tableenquirysource->getRows();
	
	}elseif($request == 'BuyerMatchesInfo'){
	
	$BM_Table = new Fw_Db_Table('byer_matches');
	$BMF_Table = new Fw_Db_Table('byer_matches_form');
$submit = $fwRequest->getParam('Addbuyermatches', '');
$fwViewData['cust_id'] = $fwRequest -> getParamget('cust_id', 0);
$bm_id = $fwRequest -> getParamget('bm_id',0);
$current_date = date('d-m-Y');
$current_time = date('H:i');
$fwViewData['BuyerMatchesInfo'] = "add";

if(!empty($submit))
	{
		$detail = $fwRequest->getParam($TABLE, array());
		$detailcustid = $fwRequest->getParam('cust_id', 0);

		if(empty($detail['bm_onweb']))
			{
			$detail['bm_onweb'] = 0;
			}	
		$bm_id = (int)$detail['bm_id'];
		unset($detail['bm_id']);
					
		if($detail['abc']){		
			foreach($detail['abc'] as $k => $v){if($v){$business_interest .= $v."/";}}
			}
		if($detail['states'])
			{
			foreach($detail['states'] as $k => $v){if($v){$set_states .= $v."/";}}
			}
		if($detail['bm_price_range'])
			{
			foreach($detail['bm_price_range'] as $k => $v)if($v){{$sprice_range .= $v."/";}}
			}	
		
	unset($detail['abc']);	
	unset($detail['states']);
	$detail['bm_create_date'] = changedate_y_m_d($detail['bm_create_date']);
	$detail['bm_interest'] = "/".$business_interest;
	$detail['bm_states'] = "/".$set_states;
	$detail['bm_price_range'] = "/".$sprice_range;
	if($detail['bm_like_new_business_date']){$detail['bm_like_new_business_date'] = changedate_y_m_d($detail['bm_like_new_business_date']);}
	
	if($bm_id >0)
		{
		$BM_Table->setWhere("bm_id = ".$bm_id);
		$BM_Table->updateRow($detail);
		}else{
		$detail['bm_create_user_id'] = $user_id;
		$BM_Table->insertRow($detail);
		}
		$fwViewData['dataupdate'] = "Success";
	}
$fwViewData['button'] = "Add";	
	
if($bm_id>0)
	{
	$BM_Table->setWhere("bm_id = ".$bm_id);
	$fwViewData['detail'] = $BM_Table->getRow();
	$fwViewData['ind_codes'] = explode("/", $fwViewData['detail']['bm_interest']);
	$fwViewData['states_codes'] = explode("/", $fwViewData['detail']['bm_states']);
	$fwViewData['price_range'] = explode("/", $fwViewData['detail']['bm_price_range']);
	$fwViewData['button'] = "Edit";	
	}
/********** Begin business_interest **********/
	$business_interest_Table = new Fw_Db_Table('business_interest');
	$business_interest_Table->setWhere("bi_parent = 0");
	$interest = $business_interest_Table->getAllRows();
	$fwViewData['interest'] =  $interest;
	
	$business_interest_Table->setWhere("bi_parent != 0");
	$business_interest_Table->setOrderBy('bi_title'.' ASC');
	$sub_interest = $business_interest_Table->getAllRows();
	$fwViewData['sub_interest'] =  $sub_interest;
/********** End business_interest **********/

/********** Begin States **********/
	$states_table = new Fw_Db_Table('states');
	$states_table -> setWhere("s_type = 'state'");
	$main_states = $states_table -> getRows();
	$fwViewData['main_states'] = $main_states;
/********** End States **********/
	if(empty($fwViewData['detail']['bm_create_date'])){$fwViewData['detail']['bm_create_date'] = $current_date;}
	if(empty($fwViewData['detail']['bm_create_time'])){$fwViewData['detail']['bm_create_time'] = $current_time;}	
}
if($request == 'Othercontactinfo')
		{
		$tableothercontact = new Fw_Db_Table('othercontact');
									$submit = $fwRequest->getParam('add_contact', '');
									$cust_id  = $fwRequest->getParam('cust_id', '');
									$oc_id  = $fwRequest->getParam('oc_id', 0);
									$fwViewData['oc_id'] = $oc_id;
									$fwViewData['cust_id'] = $cust_id;
									$fwViewData['show_other_contact'] ="show";
									$fwViewData['button'] = "Add";
		
							if($submit)
								{
								$detail = $fwRequest->getParam($TABLE, array());

							if(!$detail['oc_noti_enable']){$detail['oc_noti_enable'] =0;}
							
								$oc_id = (int)$detail['oc_id'];
								unset($detail['oc_id']);
									 	     			if($oc_id > 0)
																{
																$tableothercontact->setWhere("oc_id = ".$oc_id);
																$tableothercontact->updateRow($detail);
																}
															else
																{	
															$tableothercontact->insertRow($detail);
																}
															$fwViewData['oc_result'] = 1;
								
								}	
							
							if($oc_id > 0)
								{
								$tableothercontact->setWhere("oc_id = ".$oc_id);
								$fwViewData['detail'] = $tableothercontact->getRow();
								$fwViewData['button'] = "Edit";
								}
		
		$tableintrest =  new Fw_Db_Table('partners_type');
		$tableintrest->setOrderBy('pt_id'.' ASC');
		$fwViewData['customers_type']=$tableintrest->getAllRows();
		
		}

if($request == 'buyerenquiriesinfofollowups')
		{
		
		$tableothercontact = new Fw_Db_Table('befollowups');
									$submit = $fwRequest->getParam('add_contact', '');
									$cust_id  = $fwRequest->getParam('cust_id', '');
									$be_id  = $fwRequest->getParam('be_id', 0);
									$bef_fups_id  = $fwRequest->getParam('bef_fups_id', 0);
									$fwViewData['be_id'] = $be_id;
									$fwViewData['cust_id'] = $cust_id;
									$fwViewData['bef_fups_id'] = $bef_fups_id;
									$fwViewData['show_followups_contact'] ="show";
									$fwViewData['button'] = "Add";
									
									$fwViewData['detail']['bef_create_date'] = date('d-m-Y');
									$fwViewData['detail']['bef_cerate_time'] = date('h:i');
									$fwViewData['detail']['user_id'] = $_SESSION['user']['user_id'];
									$fwViewData['detail']['user_name'] = $_SESSION['user']['user_name'];
									
								
									
		
							if($submit)
								{
								$detail = $fwRequest->getParam($TABLE, array());
								$bef_fups_id = (int)$detail['bef_fups_id'];
								
									unset($detail['bef_fups_id']);
									$detail['bef_create_date'] = changedate_y_m_d($detail['bef_create_date']);
									$detail['bef_done_date'] = changedate_y_m_d($detail['bef_done_date']);
								
							
									if(empty($detail['bef_done_date']))
										{
										unset($detail['bef_done_date']);
										unset($detail['bef_done_time']);
										unset($detail['bef_done_user']);
										}
							
									if(empty($detail['bef_approved'])){$detail['bef_approved'] = 0;}
									
								
									
									
									 	     				if($bef_fups_id > 0)
																	{
																	
																	$tableothercontact->setWhere("bef_fups_id = ".$bef_fups_id);
																	$tableothercontact->updateRow($detail);
																	}
															else
																{	
																if(!empty($detail['bef_cust_id']))
																	{
																	
																	$tableothercontact->insertRow($detail);
																	}
															}
															$fwViewData['bef_fups_result'] = 1;
								
								}	
							
							if($bef_fups_id > 0)
								{
								$sql = "SELECT befollowups.*,users.user_id, users.user_name  FROM befollowups
													LEFT JOIN users ON befollowups.bef_done_user  = users.user_id
													WHERE  befollowups.bef_fups_id  = ".$bef_fups_id;
										
									$fwViewData['detail'] = $fwDb->queryOne($sql);
					
								$fwViewData['detail']['bef_create_date'] = changedate_d_m_y($fwViewData['detail']['bef_create_date']);
								$fwViewData['detail']['bef_done_date'] = changedate_d_m_y($fwViewData['detail']['bef_done_date']);
						
								$fwViewData['button'] = "Edit";
								}
		
		
		}


	
}
	
								