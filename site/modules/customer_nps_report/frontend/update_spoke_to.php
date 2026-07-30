<?php

$id = $fwRequest->getParam('cn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update customer_nps_report set  cn_spoke_to_cust   = ".$value." where cn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update customer_nps_report set  cn_spoke_to_user   = '".$user."' where cn_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update customer_nps_report set  cn_spoke_to_date   = '".$dt."' where cn_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select cn_spoke_to_user, cn_spoke_to_date from customer_nps_report where cn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['cn_spoke_to_date'] ."<br>".$dataT['cn_spoke_to_user'];

	echo $output;
	
}

 exit;