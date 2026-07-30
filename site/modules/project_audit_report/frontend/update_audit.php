<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

//$dt = date('d-m-Y');
//$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update business set  bsn_par_audit  = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
//	$sql_2 = "Update bus_variations set  va_status_user  = '".$usr."' where va_id = ".$id;	 
//	$fwDb -> queryOne($sql_2);
//	
//	$sql_3 = "Update bus_variations set  va_status_date  = '".$dt."' where va_id = ".$id;	 
//	$fwDb -> queryOne($sql_3);
//	
//	
//	$sqlT = "select va_status_user, va_status_date from bus_variations where va_id = ".$id;
//	$dataT = $fwDb->queryOne($sqlT);
//	
//	$output = $dataT['va_status_user'] ."<br>".$dataT['va_status_date'];
//	
//	//echo "Tana";
//	echo $output;
	
	
 exit;