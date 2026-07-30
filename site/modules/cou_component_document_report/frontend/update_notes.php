<?php


$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ',$value);

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_cou_notes  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business_sellers set  bs_cou_notes_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_cou_notes_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select bs_cou_notes_user, bs_cou_notes_date from business_sellers where bs_business_id  = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bs_cou_notes_user'] ."<br>".$dataT['bs_cou_notes_date'];
	
	//echo "Tana";
	echo $output;
}

 exit;