<?php
$fwMainView = 'file:' . getcwd() . '/common.tpl';
$requset = $fwRequest->getparamget('a_req', '');
$bus_customers = new Fw_Db_Table('bus_customers');
$pagenum = $fwRequest->getparamget('pagenum','');
if($requset)
{
		switch ($requset) {
		
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
		
		case 'curdate':
									$d_id = $fwRequest->getparamget('b', 0);
									$t_id = $fwRequest->getparamget('t_id', 0);
									curdate($d_id, $t_id);
									exit;
		break;
		case 'send_email':
								$email_id = $fwRequest->getparamget('email', '');
								if($email_id)
								{
								 $_SESSION['attach']['email_name']= $email_id; 
								 }
								 echo "set";
									exit;
		break;
		case 'byerlistdata':
									
									$cust_id = $fwRequest->getparamget('cust_id', 0);
									$export = $fwRequest->getparamget('export', 0);
									
									////////////////////// export to xls ////
if($export > 0)
	{
if($cust_id){

if($_SESSION['sql'])
	{$sql = $_SESSION['sql'];}
$exportData = $fwDb->query($sql);	
}
$csv_output = "";
$fields = array("bcust_fname", "bcust_lname", "bcust_misc_email1", "bcust_misc_moble", "bcust_gendec_signed_date", "cs_name", "be_created_date", "be_answer_required", "be_sed_date", "be_easts_date", "be_ipc_date");
$fields_list = array("Customer_First_Name", "Customer_Last_Name", "Email", "Phone_Number","signed_disclaimer", "Status", "created_date", "answer_required", "Send_dossier", "Email_Advice", "Initial_Phone_Call");

$csv_output .= strtoupper(implode("\t", $fields_list));

$csv_output .= "\n";
if($exportData){
foreach($exportData as $k => $v)
		{
			foreach($v as $k2 => $v2)
					{
						if(in_array($k2, $fields))
						{
							if($k2 == 'be_answer_required')
							{
									if($v2 == 1)
										{
										$csv_output .="Yes \t";
										}
										else{
											$csv_output .= "No \t";
											}
							}
							else
							{
							$csv_output .= trim($v2)."\t";
							}	
						
						}
					}
			$csv_output .= "\n";	
		}
}
$filename ="export"."_".date("YmdHi",time()).".xls";
$contents = "testdata1 \t testdata2 \t testdata3 \t \n";
header('Content-type: application/ms-excel');
header('Content-Disposition: attachment; filename='.$filename);
echo $csv_output;
exit;
}
									
									$opt = $fwRequest->getparamget('opt','');
									$div_id = $fwRequest->getparamget('divid', 0);
									$fwViewData['div_id'] = $div_id;
									$fwViewData['requester'] = $requset;
								
									if($cust_id){								
									$fromdate = $fwRequest->getparamget('fromdate','');
									$todate = $fwRequest->getparamget('todate','');

		if($fromdate || $todate)
			{
			if($fromdate){$fdate = changedate_y_m_d($fromdate);}
			if($todate){$tdate = changedate_y_m_d($todate);}
				if($todate && $fromdate){$subque = " AND byer_enquiry.be_created_date BETWEEN '".$fdate."' AND '".$tdate."'";}
				elseif($todate){$subque = " AND byer_enquiry.be_created_date <= '".$tdate."'";}
				elseif($fromdate){$subque = " AND byer_enquiry.be_created_date >= '".$fdate."'";}
			}
	if($opt)
		{
		
		switch($opt) 
			{
				case 'All':
				$sql = "SELECT bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, byer_enquiry.*, business.bsn_id, business.bsn_name FROM byer_enquiry
					LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
					LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id
					WHERE byer_enquiry.be_customer_id = ".$cust_id.$subque;	
	
				$fwViewData['opt']=	$opt;
				break;
				
				case 'Active':
				$sql = "SELECT bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, byer_enquiry.*, business.bsn_id, business.bsn_name FROM byer_enquiry
					LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
					LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id
					WHERE byer_enquiry.be_customer_id = ".$cust_id ." AND byer_enquiry.be_status = 1 ".$subque;
	
				$fwViewData['opt']=	$opt;
				break;
				
							case 'Inactive':
				$sql = "SELECT bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname,bus_customers.bcust_misc_email1,bus_customers.bcust_misc_email2,bus_customers.bcust_misc_moble, bus_customers.bcust_misc_business, bus_customers.bcust_misc_home, byer_enquiry.*, business.bsn_id, business.bsn_name FROM byer_enquiry
					LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
					LEFT JOIN bus_customers ON byer_enquiry.be_customer_id = bus_customers.bcust_id
					WHERE byer_enquiry.be_customer_id = ".$cust_id ." AND byer_enquiry.be_status = 0 ".$subque;

				$fwViewData['opt']=	$opt;
				break;
	}
}									
		
		
									$userData = $fwDb->query($sql);
									
									if($sql){$userData = $fwDb->query($sql);}
										$_SESSION['sql'] = $sql;
									if(!empty($userData))
									{
									if (!(isset($pagenum)))
										{
											$pagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
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
									$fwViewData['cust_list_data'] = "show";
								
		break;
		case 'byerfollowups':
									
									$cust_id = $fwRequest->getparamget('cust_id', 0);
									$div_id = $fwRequest->getparamget('divid', 0);
									$fwViewData['div_id'] = $div_id;
									$fwViewData['cust_id'] = $cust_id;
									$fwViewData['requester'] = $requset;
									
									if($cust_id){
									$sql = "SELECT befollowups.*,users.user_id, users.user_name  FROM befollowups
													LEFT JOIN users ON befollowups.bef_done_user  = users.user_id
													WHERE  befollowups.bef_cust_id  = ".$cust_id;
										
		
									
									if($sql){$userData = $fwDb->query($sql);}
									
									if(!empty($userData))
									{
									if (!(isset($pagenum)))
										{
											$pagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
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
									$fwViewData['folowups_list_data'] = "show";
								
		break;
		case 'deletebyerfollowup':
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('befollowups');
											$thisTable->setWhere("bef_fups_id = $this_id");
											$thisTable->deleteRow();
										print("byerfollowups||buyerenquiriesinfofollowupsreturn");	
										}
		exit;
		case 'byerbslistdata':
									$pagenum = $fwRequest->getparamget('pagenum','');
									$cust_id = $fwRequest->getparamget('cust_id', 0);
									$div_id = $fwRequest->getparamget('divid', 0);
									$fwViewData['div_id'] = $div_id;
									$fwViewData['requester'] = $requset;
									if($cust_id){
									$sql = "SELECT business_sellers.*, business.bsn_id, business.bsn_name  FROM business_sellers
													LEFT JOIN business ON business_sellers.bs_business_id = business.bsn_id
													WHERE  business_sellers.bs_customers_id = ".$cust_id;
										
									$userData = $fwDb->query($sql);
									
									if($sql){$userData = $fwDb->query($sql);}
									
									if(!empty($userData))
									{
									if (!(isset($pagenum)))
										{
											$pagenum = 2;
										} 
									
										$rows = count($userData);
										
										$page_rows = 2;
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
								$fwViewData['cust_bslist_data'] = "show";	
		break;
		case 'deletebuyerenquiry':
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('byer_enquiry');
											$thisTable->setWhere("be_id = $this_id");
											$thisTable->deleteRow();
										print("byerlistdata||divbyerInfoToReturn");	
										}
		exit;
		break;
		case 'deletebuyersaleenquiry':
		
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
	
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('buyer_business_for_sale');
											$thisTable->setWhere("bbfs_id = $this_id");
											$thisTable->deleteRow();
										print("byerbslistdata||divbyersaleInfoToReturn");	
										}
	
		exit;
		break;
		case 'deleteBuyerMatches':
		
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
	
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('byer_matches');
											$thisTable->setWhere("bm_id = $this_id");
											$thisTable->deleteRow();
										print("BuyerMatchesInfo||BuyerMatchesInforeturn");	
										}
	
		exit;
		case 'deletebyersaleenquiry':
		
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
	
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('business_sellers');
											$thisTable->setWhere("bs_id = $this_id");
											$thisTable->deleteRow();
										print("byersaleenquiry||divbyersaleInfoToReturn");	
										}
	
		exit;
		break;
		case 'deleteothercontact':
		
										$this_id = (int)$fwRequest->getparamget('id', 0);
										if ($this_id > 0)
										{
											$thisTable = new Fw_Db_Table('othercontact');
											$thisTable->setWhere("oc_id = $this_id");
											$thisTable->deleteRow();
										
										}
										print("byerothercontact||divOthercontactinforeturn");	
		exit;
		break;
		case 'all_businesses':
										$bsn_name = $fwRequest->getparamget('bsn_name', '');
										if($bsn_name){
									$sql="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_name LIKE '%".search_query(trim($bsn_name))."%'";
										$userData= $fwDb->query($sql);
										foreach($userData as $k => $v)
												{
												$data = clean_query_for_show($v);	
												
												$data2[] = $data;
												}
										
										$fwViewData['businesses'] = $data2;}
										$fwViewData['businessesshow'] = "Show";
		break;
		case "add_disclaimer":
			$fwViewData['iframe_data'] = 1;
			$fwViewData['iframe_post_data'] =0;
			$divid = $fwRequest -> getParamget('divid','');
			$cust_id = $fwRequest -> getParamget('cust_id','');
				//******* Begin Store value in DB after submit*********//
				$submit_iframe = $fwRequest -> getParam('submit_iframe','');			
			if(!empty($submit_iframe))
				{
			
					$cust_id = $fwRequest -> getParam('cust_id','');
				
					if($cust_id)
					{
					$cust_name = $fwRequest -> getParam('cust_name','');
					if($_FILES['image']['error'] == 0)
						{
							$docfile = $_FILES['image']['name'];
							$file_type = $_FILES['image']['type'];
							
							
							$docname = explode(".", $docfile);
							$fileext = end($docname);
							$datetime = trim(date('_Hi'),'0');
							$new_file_name = trim($cust_name).$datetime .".".$fileext;
						
							
							$docfile = preg_replace('/[^A-Z0-9._]/i', '_', $new_file_name);
							$src = $_FILES['image']['tmp_name'];
						
							$destination = BASE_DIR.FILE_PATH.'files/disclaimers/'.$docfile;
										
							if (!move_uploaded_file($src, $destination))
							{
								echo "Possible file upload attack";
							}
							else
							{
								$doc['bcust_gendec_file']= $docfile;
								chmod($destination, 0664);
							}
						}
					if($doc)
							{
							$doc['bcust_gendec_signed_date'] = date('Y-m-d');
							$doc['bcust_gendec_signed_time'] = date('H:i');	
							$doc['bcust_gendec_signed_user_id'] = $_SESSION['user']['user_id'];
							$bus_customers->setWhere("bcust_id = $cust_id");
							
							$bus_customers->updateRow($doc);
							/// SEND THANKYOU EMAIL///					
							send_GD_thankyou_email($cust_id);
							/// SEND THANKYOU EMAIL///

							/// SEND ALL E-Dossier	///					
							send_all_dossaire($cust_id);
							/// SEND ALL E-Dossier	///	
							}
							else
							{
							$fwViewData['iframe_msg'] = 'please select file.';
							}		
						
					}else
					{
					$fwViewData['iframe_msg'] = 'Must save customer listing first.';
					}						
						
						
							$fwViewData['iframe_data'] = 1;
						$fwViewData['iframe_post_data'] = 1;
				}
				//******* End Store value in DB after submit*********//
					
							$bus_customers -> setWhere("bcust_id = $cust_id");
							$fwViewData['disc_doc']  = 	$bus_customers->getRow();
					
		break;
		case 'list_disclaimer':
							$cust_id = $fwRequest -> getParamget('cust_id','');
							
							$submit_iframe = $fwRequest -> getParam('submit_iframe','');
									if(!empty($submit_iframe))
									{
									
										$cust_id = $fwRequest -> getParam('cust_id','');
										$data['bcust_gendec_file'] = "";
										$bus_customers -> setWhere("bcust_id = $cust_id");
										$bus_customers ->updateRow($data);
									}			
							
							$bus_customers -> setWhere("bcust_id = $cust_id");
							$fwViewData['list_doc']  = 	$bus_customers->getRow();
							
							
		break;
		case 'BuyerMatchesInfo':
					$cust_id = $fwRequest -> getParamget('cust_id','');
					$fwViewData['requester'] = $requset;	
					$fwViewData['cust_id'] = $cust_id;
							$fwViewData['div_id'] = $fwRequest -> getParamget('divid','');
							$sql = "SELECT * FROM byer_matches WHERE bm_cust_id = ".$cust_id ." ORDER BY bm_id DESC ";

									if($sql){$userData = $fwDb->query($sql);}
									
									if(!empty($userData))
									{
											if (!(isset($pagenum)))
												{
													$pagenum = 2;
												} 
											
												$rows = count($userData);
												
												$page_rows = 2;
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
											
											if($sql2){$newdata= $fwDb->query($sql2);
											
											foreach($newdata as $key => $value) 
													{
											$inrest_ids = explode("/", $value['bm_interest']);
											$state_ids	= explode("/", $value['bm_states']);
											$price_range = explode("/", $value['bm_price_range']);	
											
											
											$intt = "";
											foreach($inrest_ids as $k => $v)
													{
													if($v){$intt .= $v.", ";}
													}
											$ints = substr($intt, 0, -2);		
											if($ints)
													{
													$ints_sql = "SELECT bi_id, bi_title FROM business_interest WHERE bi_id IN ($ints)";
													$intrData =$fwDb->query($ints_sql); 
													$intr_code="";												
														foreach($intrData as $key => $val)
														{
														$intr_code .= $val['bi_title']."<br>";
														}
													$value['intrest_code'] = $intr_code;				
													}

											$in = "";
											foreach($state_ids as $k => $v)
													{
													if($v){$in .= $v.", ";}
													}
											$ins = substr($in, 0, -2);		
											if($ins)
													{
								$ins_sql = "SELECT s_id, s_name, s_shortcodes, s_type, s_parent_state FROM states WHERE s_id IN ($ins)";
													$staesData =$fwDb->query($ins_sql);
													$states_code=""; 												
														foreach($staesData as $key => $val)
														{
														$states_code .= $val['s_shortcodes']."<br>";
														}
													$value['states_code'] = $states_code;				
													}
													
													if($price_range)
														{
															foreach($price_range as $k => $v)
																	{
																	if($v){
																	
																	list($min, $max) = explode("-",$v);
																
																		$price_ranges .= "<br>$".number_format($min)." - $". number_format($max);	
																	}
																	}
														$value['price_ranges'] = $price_ranges;
														unset($price_ranges);			
														}			
													
													
								
										$new2data[] = $value;
										}
											$fwViewData['byer_matches_list_div'] = "show";		
											$fwViewData['byer_matches_list'] = $new2data;
											}
							
								}			
							
		break;
		case 'byersaleenquiry':
					$cust_id = $fwRequest -> getParamget('cust_id','');
					$fwViewData['requester'] = $requset;	
					$fwViewData['cust_id'] = $cust_id;
							$fwViewData['div_id'] = $fwRequest -> getParamget('divid','');
							$sql = "SELECT business_sellers.*, business.bsn_id, business.bsn_name FROM business_sellers
							LEFT JOIN business ON business_sellers.bs_business_id = business.bsn_id 		
							WHERE business_sellers.bs_customers_id = ".$cust_id ." ORDER BY bs_id DESC";
									if($sql){$userData = $fwDb->query($sql);}
									if(!empty($userData))
									{
											if (!(isset($pagenum)))
												{
													$pagenum = 2;
												} 
											
												$rows = count($userData);
												
												$page_rows = 2;
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
												$fwViewData['buyer_business_for_sale_list_div']="show";
											if($sql2){$fwViewData['buyer_business_for_sale_list']= $fwDb->query($sql2);		
									}
				}				
		break;
		case 'byerothercontact':
					$cust_id = $fwRequest -> getParamget('cust_id','');
					$fwViewData['requester'] = $requset;	
					$fwViewData['cust_id'] = $cust_id;
							$fwViewData['div_id'] = $fwRequest -> getParamget('divid','');
							$sql = "SELECT othercontact.*, partners_type.* FROM othercontact 
							LEFT JOIN partners_type ON othercontact.oc_contact_type = partners_type.pt_id
							WHERE othercontact.oc_cust_id = ".$cust_id." ORDER BY othercontact.oc_id DESC";

									if($sql){$userData = $fwDb->query($sql);}
									if(!empty($userData))
									{
											if (!(isset($pagenum)))
												{
													$pagenum = 2;
												} 
											
												$rows = count($userData);
												
												$page_rows = 2;
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
										
											if($sql2){$fwViewData['byerothercontact_list']= $fwDb->query($sql2);
									}
				}				
		break;
  }
}  