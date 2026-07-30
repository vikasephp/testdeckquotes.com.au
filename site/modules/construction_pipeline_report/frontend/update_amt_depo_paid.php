<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$user = $_SESSION['user']['user_name'];
$dt = date("d-m-Y");

if(!empty($value))
{
	$sql1 = "Update business_sellers set  bs_cpr_amt_depo_paid   = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	$sql2 = "Update business_sellers set  bs_cpr_paid_user   = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	//$sql3 = "Update business_sellers set  bs_cpr_paid_date   = '".$dt."' where bs_business_id = ".$id;	 
	//$fwDb -> queryOne($sql3);
	
}


 exit;