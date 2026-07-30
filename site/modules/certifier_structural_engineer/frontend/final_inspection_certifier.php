<?php
$fwMainView = 'file:' . getcwd() . '/final_inspection_certifier.tpl';
$table = new Fw_Db_Table("certifier_structural_engineer");
$cse_id = $fwRequest->getParam('cse_id', '');

$sql_1 = "select cse_project from  certifier_structural_engineer where cse_id = ".$cse_id;
$proj = $fwDb->queryOne($sql_1);
$fwViewData['proj_name'] = $proj['cse_project'];


$sql_2 = "select car_id, car_alert, car_status, car_image1, car_image2, car_image3, car_image4, car_image5 ,
 		  car_image1_newdesign, car_image2_newdesign, car_image3_newdesign, car_image4_newdesign, car_image5_newdesign
		  from  construction_alert_report where car_type = 'Certifier – Final'
		  AND car_project like '%" . $proj['cse_project']."%'";
		  
$carData = $fwDb->query($sql_2);

foreach($carData as $k=>$v)
{
	$sql = 'select * from supplier_email where se_car_id = '. $v['car_id'];
	$supplier = $fwDb->query($sql_2);
	$carData[$k]['supplier'] = $supplier;		
}


$fwViewData['carData'] = $carData;