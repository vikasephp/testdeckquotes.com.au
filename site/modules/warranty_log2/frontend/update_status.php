<?php

$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

$date = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql = "Update warranty_log set wa_status = '".$value."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_2 = "Update warranty_log set wa_status_user = '".$user."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql_2);

	$sql_3 = "Update warranty_log set wa_status_date = '".$date."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
}

 exit;