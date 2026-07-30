<?php

$id = $fwRequest->getParam('td_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');
	
	$sql_1 = "Update property_sale_task_detail set  td_status  = '".$value."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update property_sale_task_detail set  td_user  = '".$usr."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update property_sale_task_detail set  td_date  = '".$dt."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	
	$sqlT = "select td_user, td_date from property_sale_task_detail where td_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['td_user'] ."<br>".$dataT['td_date'];
	
	//echo "Tana";
	echo $output;
	
	
 exit;