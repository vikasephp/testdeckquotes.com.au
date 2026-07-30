<?php


$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ',$value);

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_what_is_holding  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business_sellers set  bs_holding_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_holding_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select bs_holding_user, bs_holding_date from business_sellers where bs_business_id  = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bs_holding_user'] ."<br>".$dataT['bs_holding_date'];
	
	//echo "Tana";
	echo $output;
}

 exit;