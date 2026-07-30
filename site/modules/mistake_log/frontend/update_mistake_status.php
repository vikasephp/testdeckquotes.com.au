<?php

$id = $fwRequest->getParam('ml_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql = "Update mistake_log set ml_status = '".$value."' where ml_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_1 = "Update mistake_log set ml_status_by = '".$user."' where ml_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update mistake_log set ml_status_date = '".$dt."' where ml_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
}

 exit;