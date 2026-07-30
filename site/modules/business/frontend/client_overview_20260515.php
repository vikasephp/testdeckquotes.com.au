<?php
$fwMainView = 'file:' . getcwd() . '/client_overview.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);
// $bus_id = $fwRequest->getparamget('bus_id', 0);

$query = "SELECT * FROM `users`";
$result  = $fwDb->query($query);
$clientArr = [];
foreach ($result as $row) {
	$clientArr[$row['user_id']] = $row['user_name'];
}
// db($clientArr);
$query = "SELECT business.bsn_id, business.bsn_address, business.bsn_cd_block, business.bsn_cd_section, business.bsn_suburb, business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM  business INNER JOIN business_sellers ON business.bsn_id = business_sellers.bs_business_id INNER JOIN bus_customers ON bus_customers.bcust_id = business_sellers.bs_customers_id WHERE business.bsn_id = " . $bsn_id;
$seller_data = $fwDb->queryOne($query);
// db($seller_data);
$client_overview_data = [
	'co_client' => $seller_data['bcust_fname'] . ' ' . $seller_data['bcust_lname'],
	'co_project_address' => $seller_data['bsn_address'],
	'co_block_number' => $seller_data['bsn_cd_block'],
	'co_section_number' => $seller_data['bsn_cd_section'],
	'co_suburb' => $seller_data['bsn_suburb'],
	'co_housing_code' => 'TBC',
	'co_actmapi_link' => 'https://www.actmapi.act.gov.au/ ',
	'co_when_block_approved' => 'TBC',
	'co_site_coverage_maximum' => '40%',
	'co_is_protected' => 1,
];

$client_overview_submit = $fwRequest->getParam('client_overview_submit', '');
if (!empty($client_overview_submit) && $bsn_id > 0) {
	// $_SESSION['user']['user_id']
	$submit_data = $fwRequest->getParam('client_overview', array());

	$submit_data['co_bsn_id'] = $bsn_id;
	$submit_data['co_created_by'] = $_SESSION['user']['user_id'];
	if($submit_data['co_settlement_date'] && strtotime($submit_data['co_settlement_date']) > 0){
		$submit_data['co_settlement_date'] = date('Y-m-d', strtotime($submit_data['co_settlement_date']));
	}
    $table_client_overview = new Fw_Db_Table('client_overview');
    $table_client_overview->setWhere('co_bsn_id = ' . $bsn_id);
	if($table_client_overview->rowExists()) {
		$res = $table_client_overview->updateRow($submit_data);
	}
	else {
		$res = $table_client_overview->insertRow($submit_data);
	}

    $fwViewData['res'] = $res ? '<span style="color: green;">Record updated successfully</span>' : '<span style="color: red;">Problem in updating record</span>';
}


$table_client_overview = new Fw_Db_Table('client_overview');
$table_client_overview->setWhere('co_bsn_id = ' . $bsn_id);
if($table_client_overview->rowExists()) {
	$client_overview_data = $table_client_overview->getRows()[0];
	if(!empty($seller_data) && isset($seller_data['bcust_fname']) && isset($seller_data['bcust_lname'])){
		$client_overview_data['co_client'] = $seller_data['bcust_fname'] . ' ' . $seller_data['bcust_lname'];
	}
	if($client_overview_data['co_settlement_date'] && strtotime($submit_data['co_settlement_date']) > 0){
		$client_overview_data['co_settlement_date'] = date('d-M-Y', strtotime($client_overview_data['co_settlement_date']));
	}
	if($client_overview_data['co_created_by']) {
		$client_overview_data['co_created_by'] = $clientArr[$client_overview_data['co_created_by']] . ' ' . date('d-M-Y', strtotime($client_overview_data['updated_at']));
	}
}
$fwViewData['client_overview_data'] = $client_overview_data;
