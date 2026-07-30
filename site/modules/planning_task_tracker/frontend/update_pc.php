<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_ptt_pc_option  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business_sellers set  bs_ptt_pc_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business_sellers set  bs_ptt_pc_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlT = "select bs_ptt_pc_date, bs_ptt_pc_user from business_sellers where bs_business_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bs_ptt_pc_date'] ."<br>".$dataT['bs_ptt_pc_user'];
	
	//echo "Tana";
	echo $output;
	
}

 exit;