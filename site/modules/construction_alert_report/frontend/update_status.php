<?php


$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ',$value);

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update construction_alert_report  set  car_status  = '".$value."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update construction_alert_report set  car_status_date  = '".$dt."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update construction_alert_report set  car_status_user  = '".$usr."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlA = "select car_status_date, car_status_user from construction_alert_report  where car_id = ".$id;	
	$data = $fwDb -> queryOne($sqlA);
	
	echo $data['car_status_date'] .'<br>' . $data['car_status_user'];
	
}



 exit;