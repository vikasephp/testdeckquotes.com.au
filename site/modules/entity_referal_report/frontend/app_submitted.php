<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql = "Update document_proposal_name set  dpn_appl_submitted  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sql2 = "Update document_proposal_name set  dpn_er_app_sub_date  = '".$dt."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update document_proposal_name set  dpn_er_app_sub_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select dpn_er_app_sub_date, dpn_er_app_sub_user from document_proposal_name where dpn_unique_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['dpn_er_app_sub_date'] ."<br>".$dataT['dpn_er_app_sub_user'];
	
	//echo "Tana";
	echo $output;
}

 exit;