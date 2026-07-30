<?php

$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business set  bsn_cip_total_days_added  = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business set  bsn_cip_daysadded_date  = '".$dt."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql2 = "Update business set  bsn_cip_daysadded_user  = '".$user."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Select bsn_cip_daysadded_date, bsn_cip_daysadded_user from business where bsn_id = ".$id;
	$data3 = $fwDb->queryOne($sql3);
	
	$output = $data3['bsn_cip_daysadded_date'] . "<br> ". $data3['bsn_cip_daysadded_user'];
	
	//echo "Tana";
	echo $output;	
}


//bsn_cip_daysadded_date
 exit;