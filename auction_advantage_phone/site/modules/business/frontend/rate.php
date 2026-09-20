<?php 

$tableenquirysource = new Fw_Db_Table('enquirysource');
$tablebusinessseller = new Fw_Db_Table('byer_enquiry');
$tablefollowups = new Fw_Db_Table('befollowups');
$tablebyersotherdata = new Fw_Db_Table('byers_other_data');
$tableemailtemplate = new Fw_Db_Table('email_template');
$tablebusiness = new Fw_Db_Table('business');
$tablestates = new Fw_Db_Table('states');
$tablebyermatches = new Fw_Db_Table('byer_matches');
$buyerTable = new Fw_Db_Table('bus_customers');

$edossiertemplate = new Fw_Db_Table('e_dossier_templates');
$addinspection = $fwRequest->getParam('addinspection', '');
$addmakeoffer = $fwRequest->getParam('addmakeoffer', '');
$addinforeq = $fwRequest->getParam('addinforeq', '');
date_default_timezone_set('Australia/Canberra');
$current_date = date('Y-m-d');
$current_time = date('H:i');
$submit = $fwRequest->getParam('subAddDetail', '');
$pagenum = $fwRequest->getparamget('pagenum','');

$inspagenum = $fwRequest->getparamget('inspagenum','');
$mopagenum = $fwRequest->getparamget('mopagenum','');
$inforpagenum = $fwRequest->getparamget('inforpagenum','');
$submit_save_story = $fwRequest->getParam('save_story', '');


$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_id']=$user_id;
$bsn_id = $fwRequest->getParam('bsn_id', '');
$buse_id = $fwRequest->getparam('buse_id', 0); 
$bcus_id = $fwRequest->getparam('bcus_id', 0); 

$fwViewData['bcus_id'] = $bcus_id;

if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}
$cust_id = $fwRequest->getParam('cust_id', '');
$bef_fups_id = $fwRequest->getParam('bef_fups_id', '');
$submitfollowup = $fwRequest->getParam('add_foolowup', '');

$emailfollowupSubmit = $fwRequest->getParam('emailfollowupSubmit', '');

$bcustid = $fwRequest->getParam('cust_id', '');

if(empty($bsn_id))
{
if($buse_id){$bsn_id = $buse_id;}
}
$fwViewData['cust_id'] = $fwRequest->getParam('cust_id', '');

$fwViewData['bsn_id'] = $bsn_id;
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}
$action = $fwRequest->getParam('action', '');

 if($action == "add")
		{
		$fwViewData['followupform'] = "show";
		$fwViewData['folloupbutton'] = "Add";
		}
		else
		{
		$fwViewData['action'] = $action;
		}
$tableenquirysource->setOrderBy('soe_id'.' ASC');
$fwViewData['enquiry_source']=$tableenquirysource->getAllRows();

if($submitfollowup)
	{
	
	$detail = $fwRequest->getParam($TABLE, array());
		
	
	
	if(empty($detail['bef_approved'])) { $detail['bef_approved'] = 0; }
	

	$detail['bef_create_date'] = changedate_y_m_d($detail['bef_create_date']);
	$detail['bef_done_date'] = changedate_y_m_d($detail['bef_done_date']);
	$detail['bef_comments'] = clean_data_special($detail['bef_comments']);
	$detail['bef_comments'] = stripslashes($detail['bef_comments']);
	$detail['bef_agent_comment'] = stripslashes($detail['bef_agent_comment']);
	

	if(empty($detail['bef_done_date']))
		{
		unset($detail['bef_done_date']);
		$detail['bef_done_user'] = 0;;	
		}
	$table_id =  (int)$detail['bef_fups_id'];
	unset($detail['bef_fups_id']);
						if($table_id > 0)
						{
							$tablefollowups->setWhere("bef_fups_id =".$table_id);
							$id= $tablefollowups->updateRow($detail);
						}
						else
						{	
							$detail['bef_create_user'] = $user_id;				
							$id=$tablefollowups->insertRow($detail);
						}	
	
$buse_id = $detail['bef_be_id'];
$cust_id = $detail['bef_cust_id'];
$bef_fups_id = $detail['bef_fups_id'];
$bsn_id = $detail['bef_be_id'];

$fwViewData['followupform'] = "hide";	

// add buyer story
//$buyerTable->setWhere("bcust_id=".$detail['bef_cust_id']);
//$storyDetail['bcust_buyer_story'] = $detail['bcust_buyer_story'];
//$buyerTable->updateRow($storyDetail);

// add buyer story Ends

// add rating
$tablebusinessseller->setWhere("be_customer_id=".$detail['bef_cust_id']);
$ratingDetail['be_rating_score'] = $detail['be_rating_score'];
$tablebusinessseller->updateRow($ratingDetail);
// add rating ends
	}

if($emailfollowupSubmit)
	{
		
		$emailfollowdetail = $fwRequest->getParam($TABLE, array());	
		//db($emailfollowdetail);
		
		$tablebusiness_sellers = new Fw_Db_Table('business_sellers');	
		$tablebusiness_sellers->setWhere("bs_business_id=".$emailfollowdetail['bef_bus_id']);
		$sellerdata = $tablebusiness_sellers->getRow();
		
		//db($sellerdata);
											
		$sqlBsn = "Select bsn_name from business where bsn_id = ".$emailfollowdetail['bef_bus_id']; 
		$detailbsnname = $fwDb->queryOne($sqlBsn);
		
		//db($detailbsnname);
		
											
		$sellersemail = new Fw_Db_Table('bus_customers');	
		$sellersemail->setWhere("bcust_id=".$sellerdata['bs_customers_id']);
		$emaildata = $sellersemail->getRow();
														
		$fwViewData['followupdetail'] = $emailfollowdetail;
		
		$tableemailtemplate = new Fw_Db_Table('bus_customers');	
		$tableemailtemplate->setWhere("bcust_id=".$emailfollowdetail['bef_cust_id']);
		$buyerEmail = $tableemailtemplate->getRow();
		
																																				
		$toname = $emaildata['bcust_fname'];
		$to = $emaildata['bcust_misc_email1'];
		//$to = "manojsoniephp@gmail.com";
										
		$fromname = FROM_NAME;
		$from = SITE_EMAIL_SEND;
																								
		$subject = 'Instant Feedback';
		$email_body = "<span style='font-family:Verdana, Geneva, sans-serif;'>" . $buyerEmail['bcust_fname'] . '<br><br>';
		$email_body .= "Please find the feedback just provided about your business, ".$detailbsnname['bsn_name'] . "<br><br>";						
		$email_body .= "<html><body><table border=1 cellspacing=0 cellpadding=4 style='font-family:Verdana;'><tr> <td>";
		$email_body .= "Buyer Name: ". $buyerEmail['bcust_fname']."</td></tr>";
		$email_body .= "<tr><td>Feedback: ".$emailfollowdetail['bef_comments']."</td></tr>";
		
		if($emailfollowdetail['bef_comments']) {
			$email_body .= "<tr><td>Agent Comment: ".$emailfollowdetail['bef_agent_comment']."</td></tr></table><br>";	
		}
		$email_body .= "We will endeavour to continue to follow up all buyers that we enquired about your business. </span>"; 
		if(send_email($toname,$to, $fromname, $from, $subject, $email_body, $attachmentsend=''))
		{
			$fwViewData['ifumsg'] = "Email has been sent to seller";
		}
												
		
		
		
	}


	
if($buse_id > 0)
	{
	
$sql2="SELECT byer_enquiry.*, buse_initial_phone_call.user_id, buse_initial_phone_call.user_name as buse_initial_phone_call_username, buse_sent_dossier.user_id, buse_sent_dossier.user_name as buse_sent_dossier_username, buse_email_advice_sent_to_seller.user_id, buse_email_advice_sent_to_seller.user_name as buse_email_advice_sent_to_seller_username, business.bsn_id, business.bsn_name, bus_customers.bcust_fname, bus_customers.bcust_lname  FROM byer_enquiry
LEFT JOIN business ON business.bsn_id = byer_enquiry.be_business_id
LEFT JOIN bus_customers ON bus_customers.bcust_id = byer_enquiry.be_customer_id
LEFT JOIN users as buse_initial_phone_call ON buse_initial_phone_call.user_id = byer_enquiry.be_ipc_user
LEFT JOIN users as buse_sent_dossier ON buse_sent_dossier.user_id = byer_enquiry.be_sed_user
LEFT JOIN users as buse_email_advice_sent_to_seller ON buse_email_advice_sent_to_seller.user_id = byer_enquiry.	be_easts_user
WHERE byer_enquiry.be_id = ".$buse_id;


$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;

$cust_id = $fwViewData['detail']['be_customer_id'];
$bef_be_id = $fwViewData['detail']['be_id'];
$bsn_id =  $fwViewData['detail']['be_business_id'];
$fwViewData['buse_id'] = $buse_id;
$fwViewData['cust_id'] = $cust_id;
$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";
}	

if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}


if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	

$detail['be_created_date'] = changedate_y_m_d($detail['be_created_date']);
if(empty($detail['be_created_date']) || $detail['be_created_date'] == '0000-00-00' || $detail['be_created_date'] == '1999-11-30')
	{
	$detail['be_created_date'] = date('Y-m-d');
	$detail['be_created_time'] = date('H:i');		
	}
if($detail['be_ipc_date'] == '0000-00-00' || empty($detail['be_ipc_date']))
	{
	unset($detail['be_ipc_date']);
	unset($detail['be_ipc_time']);
	unset($detail['be_ipc_comments']);
	unset($detail['be_ipc_user']);
	}
	else
	{
	$detail['be_ipc_date'] = changedate_y_m_d($detail['be_ipc_date']);
	}
if($detail['be_sed_date'] == '0000-00-00' || empty($detail['be_sed_date']))
	{
	unset($detail['be_sed_date']);
	unset($detail['be_sed_time']);
	unset($detail['be_sed_comments']);
	unset($detail['be_sed_user']);
	}
else
	{
	$detail['be_sed_date'] = changedate_y_m_d($detail['be_sed_date']);
	}	
if($detail['be_easts_date'] == '0000-00-00' || empty($detail['be_easts_date']))
	{
	unset($detail['be_easts_date']);
	unset($detail['be_easts_time']);
	unset($detail['be_easts_user']);
	unset($detail['be_easts_comments']);
	}
else
	{
	$detail['be_easts_date'] = changedate_y_m_d($detail['be_easts_date']);
	}

if(!$detail['be_answer_required'])
	{
	$detail['be_answer_required'] = 0;
	}

$table_id =  (int)$detail['be_id'];
$detail['be_user_ip'] = $_SERVER['REMOTE_ADDR'];
unset($detail['be_id']);

if($detail['be_business_id'] > 0):
											$tablebusiness->setWhere("bsn_id = {$detail['be_business_id']}");
											$busdetail = $tablebusiness->getRow();

											if($busdetail['bsn_state']): 
											$tablestates->setWhere("s_shortcodes = '{$busdetail['bsn_state']}'");
											$bsdata = $tablestates->getRow();
											endif;
											 
											if($detail['be_customer_id'] > 0): 
											$tablebyermatches->setWhere("bm_cust_id = {$detail['be_customer_id']}");
											//
											if(!$tablebyermatches->rowExists())
												{
												$bmdata['bm_cust_id'] = $detail['be_customer_id'];
												$bmdata['bm_create_user_id'] = $_SESSION['user']['user_id'];
												$bmdata['bm_states'] = "/".$bsdata['s_id']."/";
												$bmdata['bm_interest'] = "/".$busdetail['bsn_interest']."/";
												$bmdata['bm_create_date'] = date('Y-m-d');
												$bmdata['bm_create_time'] = date('h:m:i');
												$tablebyermatches->insertRow($bmdata);
												}else{
												$bmdata = $tablebyermatches->getRow(); 
												
												if($bmdata['bm_states']): $bmstates = explode("/", $bmdata['bm_states']); 
													if(!in_array($bsdata['s_id'], $bmstates)): $bmdata['bm_states'] .= $bsdata['s_id']."/"; endif;	
												endif;
												
												if($bmdata['bm_interest']): $bminterest = explode("/", $bmdata['bm_interest']); 
													if(!in_array($busdetail['bsn_interest'], $bminterest)): $bmdata['bm_interest'] .= $busdetail['bsn_interest']."/"; endif;	
												endif;									
												$tablebyermatches->setWhere("bm_id = ".$bmdata['bm_id']);
												unset($bmdata['bm_id']);
												$tablebyermatches->updateRow($bmdata);
												}
												
																			
											endif;
											endif;

						if($table_id > 0)
						{
							$tablebusinessseller->setWhere("be_id=".$table_id);
							$table_id= $tablebusinessseller->updateRow($detail);
						}
						else
						{			
							$detail['be_user'] = $user_id;			
							$table_id=$tablebusinessseller->insertRow($detail);

						// vender e_idmail
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

			if($customerdata['be_created_date'] !== '0000-00-00'){ $ul_text ="Yes";}else{$ul_text ="No";}
			$sellers_emails = '';
			$fromname = FROM_NAME;
			$from = SITE_EMAIL_SEND;
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
			//$to = "dhirephp@gmail.com";
			//$to = "frank@businessbuys.com.au";
			
	$subject = $email_template_data['et_subject'];
	$attachment = "";

	if(send_email($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment))
		{
		email_tracking($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment, 4);
		}
	$sellers_emails .= $to."\n";
				}		
				// vender e_idmail	
						$emailadvicesenttoseller['be_easts_date'] = date('Y-m-d');
						$emailadvicesenttoseller['be_easts_time'] = date('H:i');
						$emailadvicesenttoseller['be_easts_comments'] = "Auto sent, \nEmailed ".$sellers_emails;
						$emailadvicesenttoseller['be_easts_user'] = 1;
						$tablebusinessseller->setWhere("be_id=".$table_id);
						$tablebusinessseller->updateRow($emailadvicesenttoseller);
						
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
						send_general_disclamer($getbuyerdata['bcust_fname'], $getbuyerdata['bcust_lname'], trim($getbuyerdata['bcust_misc_email1']));
						// send general disclaimer
						$buyerdata['bcust_gendec_sent_date'] = 	date('Y-m-d');
						$buyerdata['bcust_gendec_sent_time'] = 	date('H:i');
						$buyerdata['bcust_gendec_comments'] = "Auto sent, \nEmailed ".$getbuyerdata['bcust_misc_email1'];
						$id = $buyerTable->updateRow($buyerdata);

						}else{
						
						/////SEND E DOSSIER /////
						$tablebusiness->setWhere("bsn_id = ".$bsn_id." AND bsn_auto_edossier = 1");
							
						if($tablebusiness->rowExists())
							{
						$edossiertemplate->setWhere("edt_bus_id = ".$bsn_id);
						$etemplatedata = $edossiertemplate->getRows();
						$buyerTable->setWhere("bcust_id=".$detail['be_customer_id']);
						$getbuyerdata = $buyerTable->getRow();
						
						if(count($etemplatedata) > 0)	
							{
								foreach($etemplatedata as $k => $v)
									{
										
							$email_subject = $v['edt_title'];
							$email_body =$v['edt_body'];
							$toname = ucwords(strtolower($getbuyerdata['bcust_fname']." ".$getbuyerdata['bcust_lname']));
							
							$to = trim($getbuyerdata['bcust_misc_email1']);
							
							//$to = "manojsoniephp@gmail.com";
							//$to = "frank@businessbuys.com.au";
							
								$attachment = "";
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
					
					// Adding Docs Name to eDossier
					
					$busidm = $v['edt_bus_id'];
					
					$sql_bus_docs = "SELECT document_check_list.doc_file_name , admin_document_check_list.admin_doc_name FROM document_check_list
					 Inner join admin_document_check_list ON document_check_list.doc_name_id = admin_document_check_list.admin_doc_id
				 	 WHERE document_check_list.doc_bsn_id = ".$busidm." AND doc_upload_to_dossier = 1";
	
	$docsname = "<div> Downloads </div> </br> <table cellspacing='0' cellpadding='3' style='border:1px solid #333; width:75%;border-collapse:collapse;' >";
					
							$checkdocs = $fwDb->query($sql_bus_docs);
								if(count($checkdocs) > 0)
									{
										foreach($checkdocs as $key => $val)
											{
												if($val['doc_file_name'])
												{
$docsname .= "<tr><td style='border:1px solid #333; width:55%;border-collapse:collapse;'>".$val['admin_doc_name']."</<td><td style='border:1px solid #333; width:50%;border-collapse:collapse;'> <a href='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['doc_file_name']."' title='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['doc_file_name']."'>".$val['doc_file_name']."</a> </td></tr>";
													}
											}
								   }
								   
	
			$sql_bus_docs = "SELECT business_documents.bd_doc_name,business_documents.bd_type FROM business_documents WHERE business_documents.bd_bsi_id = ".$busidm." AND bd_upload_dossier = 1";
					
							$checkdocs = $fwDb->query($sql_bus_docs);
				
								if(count($checkdocs) > 0)
									{
										foreach($checkdocs as $key => $val)
											{
												if($val['bd_doc_name'])
													{
$docsname .= "<tr><td style='border:1px solid #333; width:55%;'>".$val['bd_type']." </<td><td style='border:1px solid #333;'> <a href='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['bd_doc_name']."' title='".BASE_URL.FILE_PATH."files/document_check_list_files/".$val['bd_doc_name']."'>".$val['bd_doc_name']."</a></td></tr>";
													}
											}
								    }								   
					$docsname .= "</table>";	
					
					$email_body .= $docsname;
					
					// Adding docs Ends
					
					
										$qa_report_name = qa_pdf_for_bip($v['edt_bus_id']);
										
										$email_body .= "<br>";
										$email_body .= "<a href=".$qa_report_name.">Click Here to download qa report </a>";
										
																	
					if(send_email($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment))
						{
						email_tracking($toname, $to, $fromname, $from, $email_subject, $email_body,$attachment, 9);
						}
					$buyer_emails .= $to."\n";
					
								}
								
							}
							
						/////SEND E DOSSIER /////	
						}
					

			}
												
	 }	
	 				if($buyer_emails)
							{
						$emailedossairetobuyer['be_sed_date'] = date('Y-m-d');
						$emailedossairetobuyer['be_sed_time'] = date('H:i');
						$emailedossairetobuyer['be_sed_comments'] = "Auto sent, \nEmailed ".$buyer_emails;
						$emailedossairetobuyer['be_sed_user'] = $user_id;
						$tablebusinessseller->setWhere("be_id=".$table_id);
						$tablebusinessseller->updateRow($emailedossairetobuyer);
							}				
						
						
  }						
}
$fwViewData['msg'] = $table_id;
}
if($cust_id){
	$sql = "SELECT befollowups.*,users.user_id, users.user_name FROM befollowups 
	LEFT JOIN users ON befollowups.bef_done_user = users.user_id 
	WHERE befollowups.bef_cust_id  = ".$cust_id ." AND befollowups.bef_be_id = ".$bef_be_id. " Order by befollowups.bef_create_date DESC";
									$userData = $fwDb->query($sql);
									
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
									    if($sql2)
									    {
												$fwViewData['followuplist']= $fwDb->query($sql2);
										}
									}
if($bef_fups_id)  
	{
	$fsql = "SELECT befollowups.*, users.user_id, users.user_name FROM befollowups 
	LEFT JOIN users ON users.user_id = befollowups.bef_done_user
	WHERE bef_fups_id = ".$bef_fups_id;
	$fwViewData['followupdetail']= $fwDb->queryOne($fsql);

	$fwViewData['followupdetail']['bef_create_date'] = changedate_d_m_Y($fwViewData['followupdetail']['bef_create_date']);
	$fwViewData['followupdetail']['bef_done_date'] = changedate_d_m_Y($fwViewData['followupdetail']['bef_done_date']);
	
	$fwViewData['followupdetail']['bef_comments'] =  stripslashes($fwViewData['followupdetail']['bef_comments']);
	
	$fwViewData['folloupbutton'] = "Edit";
	$fwViewData['followupform'] = "show";

	}

$fwViewData['buyer_enquiry_page'] = 1;
}
if($fwViewData['detail']['be_ipc_date'] == '0000-00-00' || empty($fwViewData['detail']['be_ipc_date']))
	{
	unset($fwViewData['detail']['be_ipc_date']);
	unset($fwViewData['detail']['be_ipc_time']);
	unset($fwViewData['detail']['be_ipc_comments']);
	unset($fwViewData['detail']['be_ipc_user']);
	}

if($fwViewData['detail']['be_sed_date'] == '0000-00-00' || empty($fwViewData['detail']['be_sed_date']))
	{
	unset($fwViewData['detail']['be_sed_date']);
	unset($fwViewData['detail']['be_sed_time']);
	unset($fwViewData['detail']['be_sed_comments']);
	unset($fwViewData['detail']['be_sed_user']);
	}
	
if($fwViewData['detail']['be_easts_date'] == '0000-00-00' || empty($fwViewData['detail']['be_easts_date']))
	{
	unset($fwViewData['detail']['be_easts_date']);
	unset($fwViewData['detail']['be_easts_time']);
	unset($fwViewData['detail']['be_easts_user']);
	unset($fwViewData['detail']['be_easts_comments']);
	}	
	
	/*start inspection*/		
								$fwViewData['insbutton'] = "Add";		
								$insdelete  = $fwRequest->getParamget('insdelete', '');
								$bod_id = $fwRequest->getParamget('bod_id', '');
										if($insdelete)	
												{
												$bod_id  = $fwRequest->getParam('bod_id', '');
												$tablebyersotherdata->setWhere("bod_id = ".$bod_id);
												$tablebyersotherdata->deleteRow();
												$fwViewData['action'] ="hide";	
												}
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
							
									if($buse_id > 0){
						
										$sqlins = "SELECT * FROM byers_other_data WHERE bod_type = 1 AND bod_be_id = ".$buse_id;
										$userData = $fwDb->query($sqlins);

									if(!empty($userData))
									{
									if (!(isset($inspagenum)))
										{
											$inspagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 5;
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
	
									}}
								
						
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
									
									if($buse_id > 0){
						
										$sqlmo = "SELECT * FROM byers_other_data WHERE bod_type = 2 AND bod_be_id = ".$buse_id;
										$userData = $fwDb->query($sqlmo);
									if(!empty($userData))
									{
									if (!(isset($mopagenum)))
										{
											$mopagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 5;
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
							
									if($sql2){$fwViewData['makeofferlist']= $fwDb->query($sqlmo);}

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
									
									if($buse_id > 0){
						
										$sqlinfor = "SELECT * FROM byers_other_data WHERE bod_type = 3 AND bod_be_id = ".$buse_id;
										$userData = $fwDb->query($sqlinfor);

									if(!empty($userData))
									{
									if (!(isset($inforpagenum)))
										{
											$inforpagenum = 1;
										} 
									
										$rows = count($userData);
										
										$page_rows = 5;
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
							
									if($sql2){$fwViewData['inforlist']= $fwDb->query($sqlinfor);}
	
									}}
//$fwViewData['be_id']= $buse_id;
						
/*end  Information Request*/


$bcustid = $fwRequest->getParam('cust_id', '');

if($bcustid>0) { $bcus_id = $bcustid ;}


$buyerTable->setWhere("bcust_id=".$bcustid);
$fwViewData['getStorydata'] = $buyerTable->getRow();		

//db($bcustid);
//db($bcus_id);
//exit;
if($submit_save_story)
{
	$story['bcust_buyer_story'] = $fwRequest->getParam('bcust_buyer_story', '');
	$story['bcust_bstory_in_feedback'] = $fwRequest->getParam('bcust_bstory_in_feedback', '');
	$cust_id1 = $fwRequest->getParam('bcus_id', '');
	$buyerTable->setWhere("bcust_id=".$cust_id1);
	$id = $buyerTable->updateRow($story);
 
}

	
$stsql = "select bcust_buyer_story, bcust_bstory_in_feedback from bus_customers where bcust_id=".$bcus_id;
$story = $fwDb->queryOne($stsql);

$story['bcust_buyer_story'] = stripslashes($story['bcust_buyer_story']);

$fwViewData['storyData'] = $story;

	
	
	
