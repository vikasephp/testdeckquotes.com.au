<?php


$id = $fwRequest->getParam('bcust_id', '');
$value = $fwRequest->getparam('value', '');
$user = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql_1 = "Update bus_customers set bcust_wcr_occ_date  = '".$value."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update bus_customers set bcust_wcr_occ_dt_who  = '".$user."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
}


 exit;