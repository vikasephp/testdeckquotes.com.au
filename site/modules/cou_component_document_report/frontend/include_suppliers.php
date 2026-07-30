<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';

$ccdr_bsn_id = $fwRequest->getParam('ccdr_bsn_id', 0);
$ccdr_doc_id = $fwRequest->getParam('ccdr_doc_id', 0);

$ccdr_id = 0;
$ccdrc_co_ids = [];
if ($ccdr_bsn_id > 0 && $ccdr_doc_id > 0) {
	$query = 'SELECT * FROM cou_component_document_report WHERE ccdr_bsn_id = ' . $ccdr_bsn_id . ' AND ccdr_doc_id = ' . $ccdr_doc_id;
	$result = $fwDb->queryOne($query);
	if(empty($result)) {
		$cou_component_document_report = new Fw_Db_Table('cou_component_document_report');
		$ccdrc_id = $cou_component_document_report->insertRow([
			'ccdr_bsn_id' => $ccdr_bsn_id,
			'ccdr_doc_id' => $ccdr_doc_id,
		]);
	}
	else {
		$ccdr_id = $result['ccdr_id'];
	}

	if($ccdr_id > 0) {
		$query = "SELECT ccdrc_co_id FROM cou_component_document_report_companies WHERE ccdrc_ccdr_id = " . $ccdr_id;
		$result = $fwDb->query($query);
		foreach($result as $row) {
			$ccdrc_co_ids[] = $row['ccdrc_co_id'];
		}
	}
}
$fwViewData['ccdrc_co_ids'] = $ccdrc_co_ids;

$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if (!empty($add_suppliers) && $ccdr_bsn_id > 0 && $ccdr_doc_id > 0 && $ccdr_id > 0) {
	$post_ccdrc_co_ids = $fwRequest->getParam('ccdrc_co_id', []);

	// for inserting not added ids
	foreach($post_ccdrc_co_ids as $ccdrc_co_id) {
		// $cou_component_document_report_companies_table->setWhere("ccdrc_co_id = $ccdrc_co_id");
		// db($cou_component_document_report_companies_table->rowExists());
		if(!in_array($ccdrc_co_id, $ccdrc_co_ids)){
			$cou_component_document_report_companies_table = new Fw_Db_Table('cou_component_document_report_companies');
			$cou_component_document_report_companies_table->setWhere(["ccdrc_ccdr_id = $ccdr_id", "ccdrc_co_id = $ccdrc_co_id"]);
			$cou_component_document_report_companies_table->insertRow([
				'ccdrc_ccdr_id' => $ccdr_id,
				'ccdrc_co_id' => $ccdrc_co_id,
			]);
		}		
	}

	// for deleting not selected ids
	foreach($ccdrc_co_ids as $ccdrc_co_id) {
		if(!in_array($ccdrc_co_id, $post_ccdrc_co_ids)){
			$cou_component_document_report_companies_table = new Fw_Db_Table('cou_component_document_report_companies');
			$cou_component_document_report_companies_table->setWhere(["ccdrc_ccdr_id = $ccdr_id", "ccdrc_co_id = $ccdrc_co_id"]);
			$record = $cou_component_document_report_companies_table->getRow();
			$cou_component_document_report_companies_table->deleteRow();

			$quote_management_report_company_contacts_table = new Fw_Db_Table('cou_component_document_report_company_contacts');
			$quote_management_report_company_contacts_table->setWhere("ccdrcc_ccdrc_id = " . $record['ccdrc_id']);
			$quote_management_report_company_contacts_table->deleteRows();
		}
	}

	$ccdrc_co_ids = $post_ccdrc_co_ids;

	$fwViewData['opr'] = "Saved...";
}

$query = "SELECT co_id, co_company_name FROM companies order by co_company_name asc";
$companies = $fwDb->query($query);
foreach($companies as $i => $company) {
	$companies[$i]['checked'] = in_array($company['co_id'], $ccdrc_co_ids) ? 'checked' : '';
}
$fwViewData['companies'] = $companies;
