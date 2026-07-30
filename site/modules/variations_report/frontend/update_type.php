<?php

$id = $fwRequest->getParam('va_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update bus_variations set  va_type  = ".$value." where va_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update bus_variations set  va_type_user  = '".$usr."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update bus_variations set  va_type_date  = '".$dt."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	
	$sqlT = "select va_type_user, va_type_date from bus_variations where va_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['va_type_user'] ."<br>".$dataT['va_type_date'];
	
	//echo "Tana";
	echo $output;
	
	
 exit;