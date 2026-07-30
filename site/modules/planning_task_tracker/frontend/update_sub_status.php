<?php


$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql =  "Update business_sellers set  bs_ptt_sub_status  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business_sellers set  bs_ptt_sub_status_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_ptt_sub_status_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql_o = "Select pst_order from ptt_sub_type where pst_id =  ".$value;
	$data_o = $fwDb->queryOne($sql_o);
	$setorder = $data_o['pst_order'];
	
	$sql9 = "update business_sellers set bs_ptt_sub_status_order = ".$setorder . " where bs_business_id = ".$id;
	$detail  = $fwDb->queryOne($sql9);
	
	$sqlT = "select bs_ptt_sub_status_date, bs_ptt_sub_status_user from business_sellers where bs_business_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	
	$output = $dataT['bs_ptt_sub_status_date'] ."<br>".$dataT['bs_ptt_sub_status_user'];
	
	//echo "Tana";
	echo $output;
}



 exit;