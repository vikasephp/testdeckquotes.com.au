<?php

$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');

$user = $_SESSION['user']['user_name'];
$date = date('d-m-Y');

if(!empty($id))
{
	$sql = "Update construction_alert_report set car_new_date = '".$value."', car_new_date_updated_by = '$user', car_new_date_updated_at = '$date' where car_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_data_get = "Select car_new_date_updated_by, car_new_date_updated_at from construction_alert_report where car_new_date IS NOT NULL and car_new_date != '' and car_id = ".$id;
	$data_get = $fwDb->queryOne($sql_data_get);
	echo $data_get['car_new_date_updated_by']."<br/>".$data_get['car_new_date_updated_at'];
}

exit;