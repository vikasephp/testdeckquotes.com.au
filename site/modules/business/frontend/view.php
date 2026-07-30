<?php
$fwMainView = 'file:' . getcwd() . '/view.tpl';
$bsn_id = $fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;
if ($bsn_id > 0) {
	$sql3 = "SELECT * FROM business WHERE bsn_id=" . $bsn_id;
	$userData1 = $fwDb->queryOne($sql3);
	$fwViewData['detail'] = $userData1;
	
	$sql4 = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_email1, bus_customers.bcust_misc_moble FROM business_sellers LEFT JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id WHERE business_sellers.bs_business_id=" . $bsn_id;
	$userData2 = $fwDb->query($sql4);
	$fwViewData['detail1'] = $userData2;

	$query = 'SELECT * FROM busness_status';
	$result = $fwDb->query($query);
	$statusData = [];
	foreach($result as $row) {
		$statusData[$row['st_id']] = $row['st_name'];
	}

	$statusArr = explode('|', trim($userData1['bsn_status'], '|'));
	$bsnStatus = '';
	foreach($statusArr as $statusID) {
		$bsnStatus .= ($statusData[$statusID] . ', ');
	}
	$fwViewData['bsnStatus'] = trim($bsnStatus, ', ');
} else {
	Location(BASE_URL . $XFA['list']);
}
