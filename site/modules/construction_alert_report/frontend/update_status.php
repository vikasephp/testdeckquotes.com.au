<?php


$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ',$value);

if(!empty($id))
{
	$sql = "Update construction_alert_report set  car_status  = '".$value."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;