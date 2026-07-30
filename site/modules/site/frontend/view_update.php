<?php
$fwMainView = 'file:' . getcwd() . '/view_update.tpl';


$wa_id = $fwRequest->getParam('wa_id', '');

	
	//$sql_1 = "Select car_comment, car_which_suplier,car_attachment from construction_alert_report where  car_id = ".$car_id;
	//$carData = $fwDb->queryOne($sql_1);
	
	$sql_2 = "Select ws_supplier_name, ws_update_text,ws_attachment, ws_date from warranty_supplier_update where  ws_wa_id = ".$wa_id;
	$suData = $fwDb->query($sql_2);
	

//$fwViewData['updatedata'] = $carData;
$fwViewData['sudata'] = $suData;
