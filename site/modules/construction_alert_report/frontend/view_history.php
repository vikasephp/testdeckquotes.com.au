<?php
$fwMainView = 'file:' . getcwd() . '/view_history.tpl';
$car_id = (int)$fwRequest->getParam('car_id', 0);


	$sql_1 = "Select * from car_due_date_history  where  car_car_id = ".$car_id;
	$hData = $fwDb->query($sql_1);
	
	
$fwViewData['hData'] = $hData;
$fwViewData['car_id'] = $car_id;