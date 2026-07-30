<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql_1 = "Update business_sellers set  bs_cip_letter_text  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update business_sellers set  bs_cip_letter_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update business_sellers set  bs_cip_letter_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
}



 exit;