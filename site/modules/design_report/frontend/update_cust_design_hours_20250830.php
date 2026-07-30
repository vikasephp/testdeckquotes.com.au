<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];
$value = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update document_proposal_name set   dpn_dr_cust_des_hour  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update document_proposal_name set   dpn_dr_cdh_date  = '".$dt."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update document_proposal_name set   dpn_dr_cdh_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sqlT = "select dpn_dr_cdh_date, dpn_dr_cdh_user from document_proposal_name where dpn_unique_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['dpn_dr_cdh_date'] ."<br>".$dataT['dpn_dr_cdh_user'];
	
	//echo "Tana";
	echo $output;
}



 exit;