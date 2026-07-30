<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_cou_letter_text  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business_sellers set  bs_cou_letter_text_date   = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business_sellers set   bs_cou_letter_text_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlT = "select bs_cou_letter_text_date , bs_cou_letter_text_user from business_sellers where bs_business_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bs_cou_letter_text_date'] ."<br>".$dataT['bs_cou_letter_text_user'];
	
	//echo "Tana";
	echo $output;
	
}



 exit;