<?php
$fwMainView = 'file:' . getcwd() . '/view_staff_included.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;

$table = new Fw_Db_Table('include_resp_staff');

$update_contact = $fwRequest->getParam('update_contact', '');
if (!empty($update_contact)) {
	$sql_c = " select ir_email from include_resp_staff ";
	$datac = $fwDb->query($sql_c);
	foreach ($datac as $kc => $vc) {
		$sqlnew = "Select cs_position, cs_first_name, cs_surname from contacts where cs_primary_email = '" . $vc['ir_email'] . "'";
		$newdata = $fwDb->queryOne($sqlnew);
		if (count($newdata) > 0) {
			$updateDetail['ir_position'] = $newdata['cs_position'];
			$updateDetail['ir_first_name'] = $newdata['cs_first_name'];
			$updateDetail['ir_surname'] = $newdata['cs_surname'];

			$table->setWhere("ir_email = '" . $vc['ir_email'] . "'");
			$table->updateRow($updateDetail);
		} else {
			$table->setWhere("ir_email = '" . $vc['ir_email'] . "'");
			$table->deleteRow();
		}
	}
}

$email_report = $fwRequest->getParam('email_report', '');
if ($email_report) {
	$keys = array_keys($email_report);
	$ky = $keys[0];
	$val = $email_report[$ky];
	if ($val == 'on') {
		$edetail['ir_auto_email'] = 1;
	} else {
		$edetail['ir_auto_email'] = 0;
	}
	$table->setWhere("ir_id = " . $ky);
	if ($table->rowExists()) {
		$table->updateRow($edetail);
	}
}

$sqlB = "SELECT include_resp_staff.ir_id, include_resp_staff.ir_status, include_resp_staff.ir_car_id, construction_alert_report.car_status FROM include_resp_staff LEFT JOIN construction_alert_report ON construction_alert_report.car_id = include_resp_staff.ir_car_id WHERE include_resp_staff.ir_status != construction_alert_report.car_status GROUP BY include_resp_staff.ir_car_id;";
$dataB = $fwDb->query($sqlB);
$updateSQL = 'INSERT INTO include_resp_staff (ir_id, ir_status) VALUES ';
$updateCount = 0;
foreach($dataB as $v){
	$updateSQL .= '(' . (int)$v['ir_id'] . ', "' . $v['car_status'] . '"),';
	$updateCount++;
}

if($updateCount > 0){
	$updateSQL = substr($updateSQL, 0, strlen($updateSQL) - 1) . ' ON DUPLICATE KEY UPDATE ir_status = VALUES(ir_status);';
}

$sqls = "SELECT CASE WHEN (SELECT COUNT(*) FROM contacts WHERE cs_primary_email = include_resp_staff.ir_email) >= 2 THEN (SELECT GROUP_CONCAT(CONCAT(cs_first_name, ' ', cs_surname) SEPARATOR ', ') FROM contacts WHERE cs_primary_email = include_resp_staff.ir_email) ELSE CONCAT(include_resp_staff.ir_first_name, ' ', include_resp_staff.ir_surname) END AS ir_first_name, ir_id, ir_position, ir_email, ir_auto_email, SUM(ir_no_of_alerts) as tot, ir_surname FROM include_resp_staff WHERE ir_status = 'Open' GROUP BY ir_email;";
$staffData = $fwDb->query($sqls);

foreach ($staffData as $sk => $sv) {
	$staffData[$sk]['ir_surname'] = '';
}

$fwViewData['staffData'] = $staffData;
