<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y'); 

if(!empty($value))
{
	$sql = "Update business_sellers set  bs_qr_delivery_method  = '".$value ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business_sellers set  bs_qr_dm_user  = '".$usr ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_qr_dm_date  = '".$dt ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql4 = "Select bs_qr_dm_user, bs_qr_dm_date from business_sellers where bs_business_id = ".$id;
	$data = $fwDb->queryOne($sql4);
	
	echo $data['bs_qr_dm_user'].'<br>'.$data['bs_qr_dm_date'];
	
}



 exit;