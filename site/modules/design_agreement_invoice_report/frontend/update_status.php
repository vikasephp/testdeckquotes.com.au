<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update business set  bsn_dair_inv_status  = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	//$sql_2 = "Update sub_pages set  sp_status_user  = '".$usr."' where sp_id = ".$id;	 
//	$fwDb -> queryOne($sql_2);
//	
//	$sql_3 = "Update sub_pages set  sp_status_date  = '".$dt."' where sp_id = ".$id;	 
//	$fwDb -> queryOne($sql_3);
//	
//	
//	$sqlT = "select sp_status_user, sp_status_date from sub_pages where sp_id = ".$id;
//	$dataT = $fwDb->queryOne($sqlT);
//	
//	$output = $dataT['sp_status_user'] ."<br>".$dataT['sp_status_date'];
//	
//	//echo "Tana";
//	echo $output;
//	
	
 exit;