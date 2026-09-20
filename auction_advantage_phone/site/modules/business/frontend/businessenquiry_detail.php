<?php 
$fwMainView = 'file:' . getcwd() . '/businessenquiry_detail.tpl';
$tableenquirysource = new Fw_Db_Table('enquirysource');
$tablebusinessseller = new Fw_Db_Table('byer_enquiry');
$tablefollowups = new Fw_Db_Table('befollowups');
$tablebyersotherdata = new Fw_Db_Table('byers_other_data');
$tableemailtemplate = new Fw_Db_Table('email_template');
$tablebusiness = new Fw_Db_Table('business');
$edossiertemplate = new Fw_Db_Table('e_dossier_templates');
$addinspection = $fwRequest->getParam('addinspection', '');
$addmakeoffer = $fwRequest->getParam('addmakeoffer', '');
$addinforeq = $fwRequest->getParam('addinforeq', '');
$current_date = date('Y-m-d');
$current_time = date('H:i');
$submit = $fwRequest->getParam('subAddDetail', '');
$pagenum = $fwRequest->getparamget('pagenum','');

$inspagenum = $fwRequest->getparamget('inspagenum','');
$mopagenum = $fwRequest->getparamget('mopagenum','');
$inforpagenum = $fwRequest->getparamget('inforpagenum','');


$user_id = $_SESSION['user']['user_id'];
$fwViewData['user_id']=$user_id;
$bsn_id = $fwRequest->getParam('bsn_id', '');
$buse_id = $fwRequest->getparam('buse_id', 0); 

if(empty($bsn_id))
{
$bsn_id = $fwRequest->getParam('bsns_id', '');
}
$cust_id = $fwRequest->getParam('cust_id', '');
$bef_fups_id = $fwRequest->getParam('bef_fups_id', '');
$submitfollowup = $fwRequest->getParam('add_foolowup', '');
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
$tableenquirysource->setOrderBy('soe_order'.' ASC');
$tableenquirysource->setWhere("soe_status = 1");
$fwViewData['enquiry_source']=$tableenquirysource->getRows();

if($submitfollowup)
	{
	
	 $detail = $fwRequest->getParam($TABLE, array());	
	$detail['bef_create_date'] = changedate_y_m_d($detail['bef_create_date']);
	$detail['bef_done_date'] = changedate_y_m_d($detail['bef_done_date']);
	$detail['bef_comments'] = clean_data_special($detail['bef_comments']);

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
$sql3="SELECT business.bsn_id, business.bsn_name,business.bsn_cd_enquiry_source FROM business WHERE business.bsn_id = ".$bsn_id;
$data= $fwDb->queryOne($sql3);
$fwViewData['business_name'] = $data['bsn_name'];
$fwViewData['bsn_cd_enquiry_source'] = $data['bsn_cd_enquiry_source'];
$fwViewData['bsn_id'] = $data['bsn_id'];
}


if($submit)
{
 $detail = $fwRequest->getParam($TABLE, array());	
	$table_id =  (int)$detail['be_id'];
	$detail['be_user_ip'] = $_SERVER['REMOTE_ADDR'];
	unset($detail['be_id']);

						if($table_id > 0)
							{
								$tablebusinessseller->setWhere("be_id=".$table_id);
								$table_id= $tablebusinessseller->updateRow($detail);
							}
						else
							{			
								$detail['be_user'] = $user_id;			
								$table_id=$tablebusinessseller->insertRow($detail);
							}
$fwViewData['msg'] = $table_id;
}