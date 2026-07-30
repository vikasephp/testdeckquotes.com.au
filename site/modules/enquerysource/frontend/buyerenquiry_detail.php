<?php
$fwMainView = 'file:' . getcwd() . '/buyerenquiry_detail.tpl';
$submit = $fwRequest->getParam('subAddDetail', '');
$pagenum = $fwRequest->getparamget('pagenum','');
$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_id']=$user_id;
$fwViewData['bsn_id'] = $fwRequest->getParam('bsn_id', '');
$action = $fwRequest->getParam('action', '');
	if($action)
		{
		$fwViewData['followupform'] = "show";
		$fwViewData['folloupbutton'] = "Add";
		}
$tableenquirysource = new Fw_Db_Table('enquirysource');
$tablefollowups = new Fw_Db_Table('befollowups');
$tableenquirysource->setOrderBy('soe_id'.' ASC');
$fwViewData['enquiry_source']=$tableenquirysource->getAllRows();

$current_date = date('Y-m-d');
$current_time = date('H:i');
$tablebusinessseller = new Fw_Db_Table('business_enquiry');
$buse_id = $fwRequest->getparam('buse_id', 0); 

$bsns_id = $fwRequest->getParam('bsns_id', '');
$cust_id = $fwRequest->getParam('cust_id', '');
$bef_fups_id = $fwRequest->getParam('bef_fups_id', '');


$submitfollowup = $fwRequest->getParam('add_foolowup', '');

if($submitfollowup)
	{
	
	 $detail = $fwRequest->getParam($TABLE, array());	
	$detail['bef_create_date'] = changedate_y_m_d($detail['bef_create_date']);
	$detail['bef_done_date'] = changedate_y_m_d($detail['bef_done_date']);
	
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
							$id=$tablefollowups->insertRow($detail);
						}	
	
$bsn_id = $detail['bsn_id'];
$cust_id = $detail['bef_cust_id'];
$bef_fups_id = $detail['bef_fups_id'];
$fwViewData['followupform'] = "hide";	
	}
if($buse_id > 0)
	{
$sql2="SELECT byer_enquiry.*, buse_initial_phone_call.user_id, buse_initial_phone_call.user_name as buse_initial_phone_call_username, buse_sent_dossier.user_id, buse_sent_dossier.user_name as buse_sent_dossier_username, buse_email_advice_sent_to_seller.user_id, buse_email_advice_sent_to_seller.user_name as buse_email_advice_sent_to_seller_username FROM business_enquiry
LEFT JOIN users as buse_initial_phone_call ON buse_initial_phone_call.user_id = business_enquiry.buse_initial_phone_call_user
LEFT JOIN users as buse_sent_dossier ON buse_sent_dossier.user_id = business_enquiry.buse_sent_dossier_user
LEFT JOIN users as buse_email_advice_sent_to_seller ON buse_email_advice_sent_to_seller.user_id = business_enquiry.buse_email_advice_sent_to_seller_user
WHERE business_enquiry.buse_id = ".$buse_id;
$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;

$fwViewData['button'] = "Edit";
}else{$fwViewData['msg'] =0;
$fwViewData['button'] = "Add";
}	
if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	

if($detail['buse_initial_phone_call_date'] == '0000-00-00' || empty($detail['buse_initial_phone_call_date']))
	{
	unset($detail['buse_initial_phone_call_date']);
	unset($detail['buse_initial_phone_call_time']);
	unset($detail['buse_initial_phone_call_comment']);
	unset($detail['buse_initial_phone_call_user']);
	}
	else
	{
	$detail['buse_initial_phone_call_date'] = changedate_y_m_d($detail['buse_initial_phone_call_date']);
	}
if($detail['buse_sent_dossier_date'] == '0000-00-00' || empty($detail['buse_sent_dossier_date']))
	{
	unset($detail['buse_sent_dossier_date']);
	unset($detail['buse_sent_dossier_time']);
	unset($detail['buse_sent_dossier_comment']);
	unset($detail['buse_sent_dossier_user']);
	}
else
	{
	$detail['buse_sent_dossier_date'] = changedate_y_m_d($detail['buse_sent_dossier_date']);
	}	
if($detail['buse_email_advice_sent_to_seller_date'] == '0000-00-00' || empty($detail['buse_email_advice_sent_to_seller_date']))
	{
	unset($detail['buse_email_advice_sent_to_seller_date']);
	unset($detail['buse_email_advice_sent_to_seller_time']);
	unset($detail['buse_email_advice_sent_to_seller_user']);
	unset($detail['buse_email_advice_sent_to_seller_comment']);
	}
else
	{
	$detail['buse_email_advice_sent_to_seller_date'] = changedate_y_m_d($detail['buse_email_advice_sent_to_seller_date']);
	}



$table_id =  (int)$detail['buse_id'];
unset($detail['buse_id']);
						if($table_id > 0)
						{
							$tablebusinessseller->setWhere("buse_id=".$table_id);
							$id= $tablebusinessseller->updateRow($detail);
						}
						else
						{						
							$id=$tablebusinessseller->insertRow($detail);
						}

$fwViewData['msg'] = $id;
}

if(empty($fwViewData['bsn_id']))
{$fwViewData['bsn_id'] = $_SESSION['bsn_id'];}
$bsn_id = $fwViewData['bsn_id'];
if($bsn_id){
$sql3="SELECT business.bsn_id, business.bsn_name FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}
if($bsns_id && $cust_id)
	{
$sql2="SELECT business_enquiry.*, buse_initial_phone_call.user_id, buse_initial_phone_call.user_name as buse_initial_phone_call_username, buse_sent_dossier.user_id, buse_sent_dossier.user_name as buse_sent_dossier_username, buse_email_advice_sent_to_seller.user_id, buse_email_advice_sent_to_seller.user_name as buse_email_advice_sent_to_seller_username FROM business_enquiry
LEFT JOIN users as buse_initial_phone_call ON buse_initial_phone_call.user_id = business_enquiry.buse_initial_phone_call_user
LEFT JOIN users as buse_sent_dossier ON buse_sent_dossier.user_id = business_enquiry.buse_sent_dossier_user
LEFT JOIN users as buse_email_advice_sent_to_seller ON buse_email_advice_sent_to_seller.user_id = business_enquiry.buse_email_advice_sent_to_seller_user
WHERE business_enquiry.buse_bsn_id = ".$bsns_id." AND business_enquiry.buse_cust_id = ".$cust_id;
$userData= $fwDb->queryOne($sql2);
$fwViewData['detail'] = $userData;
$fwViewData['bsn_id'] = $bsns_id;
$fwViewData['button'] = "Edit";
$fwViewData['cust_id'] = $cust_id;
if($cust_id){
	$sql = "SELECT befollowups.*,users.user_id, users.user_name  FROM befollowups LEFT JOIN users ON befollowups.bef_done_user  = users.user_id	WHERE befollowups.bef_cust_id  = ".$cust_id;
									
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
									
									if($sql2){$fwViewData['followuplist']= $fwDb->query($sql2);}
									
									}}


if($bef_fups_id)  
	{
	$fsql = "SELECT befollowups.*, users.user_id, users.user_name FROM befollowups 
	LEFT JOIN users ON users.user_id = befollowups.bef_done_user
	WHERE bef_fups_id = ".$bef_fups_id;
	$fwViewData['followupdetail']= $fwDb->queryOne($fsql);
	
	$fwViewData['followupdetail']['bef_create_date'] = changedate_d_m_Y($fwViewData['followupdetail']['bef_create_date']);
	$fwViewData['followupdetail']['bef_done_date'] = changedate_d_m_Y($fwViewData['followupdetail']['bef_done_date']);
	$fwViewData['folloupbutton'] = "Edit";
	$fwViewData['followupform'] = "show";
	}

$fwViewData['buyer_enquiry_page'] = 1;
}
if($fwViewData['detail']['buse_initial_phone_call_date'] == '0000-00-00' || empty($fwViewData['detail']['buse_initial_phone_call_date']))
	{
	unset($fwViewData['detail']['buse_initial_phone_call_date']);
	unset($fwViewData['detail']['buse_initial_phone_call_time']);
	unset($fwViewData['detail']['buse_initial_phone_call_comment']);
	unset($fwViewData['detail']['buse_initial_phone_call_user']);
	}

if($fwViewData['detail']['buse_sent_dossier_date'] == '0000-00-00' || empty($fwViewData['detail']['buse_sent_dossier_date']))
	{
	unset($fwViewData['detail']['buse_sent_dossier_date']);
	unset($fwViewData['detail']['buse_sent_dossier_time']);
	unset($fwViewData['detail']['buse_sent_dossier_comment']);
	unset($fwViewData['detail']['buse_sent_dossier_user']);
	}
	
if($fwViewData['detail']['buse_email_advice_sent_to_seller_date'] == '0000-00-00' || empty($fwViewData['detail']['buse_email_advice_sent_to_seller_date']))
	{
	unset($fwViewData['detail']['buse_email_advice_sent_to_seller_date']);
	unset($fwViewData['detail']['buse_email_advice_sent_to_seller_time']);
	unset($fwViewData['detail']['buse_email_advice_sent_to_seller_user']);
	unset($fwViewData['detail']['buse_email_advice_sent_to_seller_comment']);
	}	
	
	
	
	
	
	
	