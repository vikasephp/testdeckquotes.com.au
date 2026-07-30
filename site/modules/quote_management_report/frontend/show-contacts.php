<?php
$fwMainView = 'file:' . getcwd() . '/show-contacts.tpl';

$qmrcc_qmrc_id = $fwRequest->getParam('qmrcc_qmrc_id', 0);
$fwViewData['qmrcc_qmrc_id'] = $qmrcc_qmrc_id;

$query = 'SELECT * FROM quote_management_report_companies WHERE qmrc_id = ' . $qmrcc_qmrc_id;
$result = $fwDb->queryOne($query);
if ($result) {
	$fwViewData['qmrc_qm_id'] = $qmrc_qm_id = $result['qmrc_qm_id'];
	$fwViewData['qmrc_co_id'] = $qmrc_co_id = $result['qmrc_co_id'];
}

$qmrcc_cs_ids = [];
if ($qmrcc_qmrc_id) {
	$query = "SELECT qmrcc_cs_id FROM quote_management_report_company_contacts WHERE qmrcc_qmrc_id = " . $qmrcc_qmrc_id;
	$result = $fwDb->query($query);
	foreach($result as $row) {
		$qmrcc_cs_ids[] = $row['qmrcc_cs_id'];
	}
}
$fwViewData['qmrcc_cs_ids'] = $qmrcc_cs_ids;

$add_contacts = $fwRequest->getParam('add_contacts', '');
if (!empty($add_contacts) && $qmrcc_qmrc_id) {
	$post_qmrcc_cs_ids = $fwRequest->getParam('qmrcc_cs_id', []);

	// for inserting not added ids
	foreach($post_qmrcc_cs_ids as $qmrcc_cs_id) {
		// $quote_management_report_companies_table->setWhere("qmrc_co_id = $qmrc_co_id");
		// db($quote_management_report_companies_table->rowExists());
		if(!in_array($qmrcc_cs_id, $qmrcc_cs_ids)){
			$quote_management_report_companies_table = new Fw_Db_Table('quote_management_report_company_contacts');
			$quote_management_report_companies_table->setWhere(["qmrcc_qmrc_id = $qmrcc_qmrc_id", "qmrcc_cs_id = $qmrcc_cs_id"]);
			$quote_management_report_companies_table->insertRow([
				'qmrcc_qmrc_id' => $qmrcc_qmrc_id,
				'qmrcc_cs_id' => $qmrcc_cs_id,
			]);
		}		
	}

	// for deleting not selected ids
	foreach($qmrcc_cs_ids as $qmrcc_cs_id) {
		if(!in_array($qmrcc_cs_id, $post_qmrcc_cs_ids)){
			$quote_management_report_companies_table = new Fw_Db_Table('quote_management_report_company_contacts');
			$quote_management_report_companies_table->setWhere(["qmrcc_qmrc_id = $qmrcc_qmrc_id", "qmrcc_cs_id = $qmrcc_cs_id"]);
			$quote_management_report_companies_table->deleteRow();
		}
	}

	$qmrcc_cs_ids = $post_qmrcc_cs_ids;

	$fwViewData['opr'] = "Saved...";
}

$query = "SELECT contacts.*, companies.co_company_name, type_options.to_option FROM contacts INNER JOIN companies ON contacts.cs_company = companies.co_id LEFT JOIN type_options ON contacts.cs_position = type_options.to_id WHERE companies.co_id = " . $qmrc_co_id . " AND LENGTH(cs_primary_email) > 0 GROUP BY cs_primary_email ORDER BY contacts.cs_is_primary DESC ";
$contacts = $fwDb->query($query);
foreach($contacts as $i => $contact) {
	$contacts[$i]['checked'] = in_array($contact['cs_id'], $qmrcc_cs_ids) ? 'checked' : '';
}
$fwViewData['contacts'] = $contacts;

$sql_positon = "SELECT * FROM contacts_position";
$position = $fwDb->query($sql_positon);
$fwViewData['position'] = $position;