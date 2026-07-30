<?php
$fwMainView = 'file:' . getcwd() . '/include_suppliers.tpl';

$this_id = $fwRequest->getParam($ID, '');

$qmrc_co_ids = [];
if ($this_id) {
	$query = "SELECT qmrc_co_id FROM quote_management_report_companies WHERE qmrc_qm_id = " . $this_id;
	$result = $fwDb->query($query);
	foreach($result as $row) {
		$qmrc_co_ids[] = $row['qmrc_co_id'];
	}
}
$fwViewData['qmrc_co_ids'] = $qmrc_co_ids;



$add_suppliers = $fwRequest->getParam('add_suppliers', '');
if (!empty($add_suppliers) && $this_id) {
	$post_qmrc_co_ids = $fwRequest->getParam('qmrc_co_id', []);

	// for inserting not added ids
	foreach($post_qmrc_co_ids as $qmrc_co_id) {
		// $quote_management_report_companies_table->setWhere("qmrc_co_id = $qmrc_co_id");
		// db($quote_management_report_companies_table->rowExists());
		if(!in_array($qmrc_co_id, $qmrc_co_ids)){
			$quote_management_report_companies_table = new Fw_Db_Table('quote_management_report_companies');
			$quote_management_report_companies_table->setWhere(["qmrc_qm_id = $this_id", "qmrc_co_id = $qmrc_co_id"]);
			$quote_management_report_companies_table->insertRow([
				'qmrc_qm_id' => $this_id,
				'qmrc_co_id' => $qmrc_co_id,
			]);
		}		
	}

	// for deleting not selected ids
	foreach($qmrc_co_ids as $qmrc_co_id) {
		if(!in_array($qmrc_co_id, $post_qmrc_co_ids)){
			$quote_management_report_companies_table = new Fw_Db_Table('quote_management_report_companies');
			$quote_management_report_companies_table->setWhere(["qmrc_qm_id = $this_id", "qmrc_co_id = $qmrc_co_id"]);
			$record = $quote_management_report_companies_table->getRow();
			$quote_management_report_companies_table->deleteRow();

			$quote_management_report_company_contacts_table = new Fw_Db_Table('quote_management_report_company_contacts');
			$quote_management_report_company_contacts_table->setWhere("qmrcc_qmrc_id = " . $record['qmrc_id']);
			$quote_management_report_company_contacts_table->deleteRows();
		}
	}

	$qmrc_co_ids = $post_qmrc_co_ids;

	$fwViewData['opr'] = "Saved...";
}

$query = "SELECT co_id, co_company_name FROM companies order by co_company_name asc";
$companies = $fwDb->query($query);
foreach($companies as $i => $company) {
	$companies[$i]['checked'] = in_array($company['co_id'], $qmrc_co_ids) ? 'checked' : '';
}
$fwViewData['companies'] = $companies;
