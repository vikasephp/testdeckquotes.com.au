<?php

$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');

$table = new Fw_Db_Table('car_due_date_history');

$user = $_SESSION['user']['user_name'];
$date = date('d-m-Y');

if(!empty($id))
{
	$sql = "Update construction_alert_report set car_new_date = '".$value."', car_new_date_updated_by = '$user', car_new_date_updated_at = '$date' where car_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	if(!empty($value)) {
		$table->setWhere("car_car_id = " . $id ." AND car_due_date = '".$value. "' AND car_change_date = '".$date."'");
		
		if (!$table->rowExists()) {
			$detailH['car_car_id'] = $id;
			$detailH['car_due_date'] = $value;
			$detailH['car_change_date'] = $date;
			$detailH['car_change_user'] = $user;
			$opr = $table->insertRow($detailH);
		}
	}
	
	$sql_data_get = "Select car_new_date_updated_by, car_new_date_updated_at from construction_alert_report where car_new_date IS NOT NULL and car_new_date != '' and car_id = ".$id;
	$data_get = $fwDb->queryOne($sql_data_get);
	echo $data_get['car_new_date_updated_by']."<br/>".$data_get['car_new_date_updated_at'];
	
	unset($id);
}

exit;