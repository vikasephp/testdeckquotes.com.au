<?php
$fwMainView = 'file:' . getcwd() . '/view_cust_included.tpl';

$submit = $fwRequest->getParam('subAddDetail', '');
$car_id = $fwRequest->getParam('car_id', 0);
$fwViewData['car_id'] =  $car_id;
$tablecar = new Fw_Db_Table('construction_alert_report');
$table = new Fw_Db_Table('include_customers');

$email_report = $fwRequest->getParam('email_report', '');
if ($email_report && empty($er)) {
	$keys = array_keys($email_report);
	$ky = $keys[0];
	$val = $email_report[$ky];
	if ($val == 'on') {
		$edetail['ic_auto_email'] = 1;
	} else {
		$edetail['ic_auto_email'] = 0;
	}

	$table->setWhere("ic_id = " . $ky);
	if ($table->rowExists()) {
		$table->updateRow($edetail);
	}

	if ($val <> 'on') {

		$sqloff = "Select distinct ic_email from include_customers where ic_id = " . $ky;
		$dataoff = $fwDb->queryOne($sqloff);
		$offdetail['car_include_cust'] = 'No';

		$sq1cust = "SELECT  
		  business.bsn_name from business_sellers 		
		  Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
		  Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
		  where bus_customers.bcust_misc_email1 = '" . $dataoff['ic_email'] . "'";
		//db($sq1cust);
		$projdata = $fwDb->query($sq1cust);


		foreach ($projdata as $pk => $pv) {
			$tablecar->setWhere("car_project = '" . $pv['bsn_name'] . "'");
			if ($tablecar->rowExists()) {
				$tes = $tablecar->updateRow($offdetail);
			}
		}

		$table->setWhere("ic_email = '" . $dataoff['ic_email'] . "'");
		if ($table->rowExists()) {
			$table->deleteRow();
		}
	}
}

$sqlc = "SELECT *, (SELECT COUNT(*) FROM construction_alert_report WHERE car_project = include_customers.ic_project AND car_status = 'Open' AND car_include_cust = 'Yes') AS tot_alert FROM include_customers HAVING tot_alert > 0;";
$custData = $fwDb->query($sqlc);

$fwViewData['custData'] = $custData;
