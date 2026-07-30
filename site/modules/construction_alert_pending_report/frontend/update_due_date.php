<?php


$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update construction_alert_report set  car_new_date  = '".$value."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;