<?php
$fwMainView = 'file:' . getcwd() . '/show-contacts.tpl';

$ccdrcc_ccdrc_id = $fwRequest->getParam('ccdrcc_ccdrc_id', 0);
$fwViewData['ccdrcc_ccdrc_id'] = $ccdrcc_ccdrc_id;

$query = 'SELECT * FROM cou_component_document_report_companies WHERE ccdrc_id = ' . $ccdrcc_ccdrc_id;
$result = $fwDb->queryOne($query);
if ($result) {
	$fwViewData['ccdrc_ccdr_id'] = $ccdrc_ccdr_id = $result['ccdrc_ccdr_id'];
	$fwViewData['ccdrc_co_id'] = $ccdrc_co_id = $result['ccdrc_co_id'];
}

$ccdrcc_cs_ids = [];
if ($ccdrcc_ccdrc_id) {
	$query = "SELECT ccdrcc_cs_id FROM cou_component_document_report_company_contacts WHERE ccdrcc_ccdrc_id = " . $ccdrcc_ccdrc_id;
	$result = $fwDb->query($query);
	foreach($result as $row) {
		$ccdrcc_cs_ids[] = $row['ccdrcc_cs_id'];
	}
}
$fwViewData['ccdrcc_cs_ids'] = $ccdrcc_cs_ids;

$add_contacts = $fwRequest->getParam('add_contacts', '');
if (!empty($add_contacts) && $ccdrcc_ccdrc_id > 0) {
	$post_ccdrcc_cs_ids = $fwRequest->getParam('ccdrcc_cs_id', []);

	// for inserting not added ids
	foreach($post_ccdrcc_cs_ids as $ccdrcc_cs_id) {
		// $cou_component_document_report_companies_table->setWhere("ccdrc_co_id = $ccdrc_co_id");
		// db($cou_component_document_report_companies_table->rowExists());
		if(!in_array($ccdrcc_cs_id, $ccdrcc_cs_ids)){
			$cou_component_document_report_company_contact_table = new Fw_Db_Table('cou_component_document_report_company_contacts');
			$cou_component_document_report_company_contact_table->setWhere(["ccdrcc_ccdrc_id = $ccdrcc_ccdrc_id", "ccdrcc_cs_id = $ccdrcc_cs_id"]);
			$cou_component_document_report_company_contact_table->insertRow([
				'ccdrcc_ccdrc_id' => $ccdrcc_ccdrc_id,
				'ccdrcc_cs_id' => $ccdrcc_cs_id,
			]);
		}		
	}

	// for deleting not selected ids
	foreach($ccdrcc_cs_ids as $ccdrcc_cs_id) {
		if(!in_array($ccdrcc_cs_id, $post_ccdrcc_cs_ids)){
			$cou_component_document_report_company_contact_table = new Fw_Db_Table('cou_component_document_report_company_contacts');
			$cou_component_document_report_company_contact_table->setWhere(["ccdrcc_ccdrc_id = $ccdrcc_ccdrc_id", "ccdrcc_cs_id = $ccdrcc_cs_id"]);
			$cou_component_document_report_company_contact_table->deleteRow();
		}
	}

	$ccdrcc_cs_ids = $post_ccdrcc_cs_ids;

	$fwViewData['opr'] = "Saved...";
}

// $query = "SELECT contacts.*, companies.co_company_name, type_options.to_option FROM contacts INNER JOIN companies ON contacts.cs_company = companies.co_id LEFT JOIN type_options ON contacts.cs_position = type_options.to_id WHERE companies.co_id = " . $ccdrc_co_id . " AND LENGTH(cs_primary_email) > 0 GROUP BY cs_primary_email ORDER BY contacts.cs_is_primary DESC ";
$query = "SELECT * FROM contacts WHERE cs_company = " . $ccdrc_co_id . " AND LENGTH(cs_primary_email) > 0 ORDER BY cs_is_primary DESC ";
$contacts = $fwDb->query($query);
foreach($contacts as $i => $contact) {
	$contacts[$i]['checked'] = in_array($contact['cs_id'], $ccdrcc_cs_ids) ? 'checked' : '';
}
$fwViewData['contacts'] = $contacts;
