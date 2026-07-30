<?php

$id = $fwRequest->getParam('cn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update customer_nps_report set  cn_response_sent    = ".$value." where cn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update customer_nps_report set  cn_response_sent_user    = '".$user."' where cn_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update customer_nps_report set  cn_response_sent_date    = '".$dt."' where cn_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select cn_response_sent_user , cn_response_sent_date  from customer_nps_report where cn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['cn_response_sent_date'] ."<br>".$dataT['cn_response_sent_user'];

	echo $output;
	
}

 exit;