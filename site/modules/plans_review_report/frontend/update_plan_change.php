<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_ppr_plan_changed  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sql = "Update business_sellers set   bs_ppr_plan_changed_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sqlT = "select bs_ppr_plan_changed, bs_ppr_plan_changed_user from business_sellers where bs_business_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	//$output = $dataT['bs_ppr_plan_changed'] ."<br>".$dataT['bs_ppr_plan_changed_user'];
	
	
	$output = $dataT['bs_ppr_plan_changed_user'];
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;