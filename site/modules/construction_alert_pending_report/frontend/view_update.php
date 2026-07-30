<?php
$fwMainView = 'file:' . getcwd() . '/view_update.tpl';


$car_id = $fwRequest->getParam('car_id', '');

	
	$sql_1 = "Select car_comment, car_which_suplier,car_attachment from construction_alert_report where  car_id = ".$car_id;
	$carData = $fwDb->queryOne($sql_1);
	
	$sql_2 = "Select cu_supplier_name, cu_update_text,cu_attachment from car_supplier_update where  cu_car_id = ".$car_id;
	$suData = $fwDb->query($sql_2);
	

$fwViewData['updatedata'] = $carData;
$fwViewData['sudata'] = $suData;
