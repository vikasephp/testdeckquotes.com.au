<?php
$fwMainView = 'file:' . getcwd() . '/view_scar.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;

$table = new Fw_Db_Table('supplier_email'); // se_id

$email_report = $fwRequest->getParam('email_report', '');
if ($email_report) {

	$keys = array_keys($email_report);
	$ky = $keys[0];
	$val = $email_report[$ky];
	if ($val == 'on') {
		$edetail['se_auto_email'] = 1;
	} else {
		$edetail['se_auto_email'] = 0;
	}


	$table->setWhere("se_id = " . $ky);
	if ($table->rowExists()) {
		$table->updateRow($edetail);
	}
}


$sqlB = "SELECT supplier_email.se_id, supplier_email.se_status, supplier_email.se_car_id, construction_alert_report.car_status FROM supplier_email LEFT JOIN construction_alert_report ON construction_alert_report.car_id = supplier_email.se_car_id WHERE supplier_email.se_status != construction_alert_report.car_status GROUP BY supplier_email.se_car_id;";
$dataB = $fwDb->query($sqlB);
$updateSQL = 'INSERT INTO supplier_email (se_id, se_status) VALUES ';
$updateCount = 0;
foreach($dataB as $v){
	$updateSQL .= '(' . (int)$v['se_id'] . ', "' . $v['car_status'] . '"),';
	$updateCount++;
}

if($updateCount > 0){
	$updateSQL = substr($updateSQL, 0, strlen($updateSQL) - 1) . ' ON DUPLICATE KEY UPDATE se_status = VALUES(se_status);';
	mysqli_multi_query($MySqliCon, $updateSQL);
}


$sqls = "SELECT CASE WHEN (SELECT COUNT(*) FROM contacts WHERE cs_primary_email = supplier_email.se_email) >= 2 THEN (SELECT GROUP_CONCAT(CONCAT(cs_first_name, ' ', cs_surname) SEPARATOR ', ') FROM contacts WHERE cs_primary_email = supplier_email.se_email) ELSE CONCAT(supplier_email.se_first_name, ' ', supplier_email.se_surname) END AS se_first_name, se_id, se_supplier, se_email, se_auto_email, SUM(se_no_of_alerts) as tot, se_surname FROM supplier_email WHERE se_status = 'Open' GROUP BY se_email;";
$supemailData = $fwDb->query($sqls);
foreach ($supemailData as $sk => $sv) {
	$supemailData[$sk]['se_surname'] = '';
}

$fwViewData['supemailData'] = $supemailData;
