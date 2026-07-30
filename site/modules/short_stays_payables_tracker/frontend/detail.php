<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableDocuments = new Fw_Db_Table($TABLE);
$ssp_id = $fwRequest->getParam($ID, '');
$ran = rand(100000, 999999);
$submit = $fwRequest->getParam('subAddDetail', '');
$fwViewData['ssp_id'] = $ssp_id;

if (!empty($submit)) {
	$detail = $fwRequest->getParam('ssp', array());
	$detail['ssp_supplier'] = stripslashes($detail['ssp_supplier']);

	$invnum = $detail['ssp_invoice_number'];
	$supplier = $detail['ssp_supplier'];

	if (!empty($ssp_id)) {
		$tableDocuments->setWhere("ssp_invoice_number = '" . $invnum . "' And ssp_supplier = '" . $supplier . "' And ssp_id != " . $detail['ssp_id']);
	} else {
		$tableDocuments->setWhere("ssp_invoice_number = '" . $invnum . "' And ssp_supplier = '" . $supplier . "'");
	}

	if (!$tableDocuments->rowExists()) {
		$this_id = $detail[$ID];
		unset($detail[$ID]);

		if ($_FILES['docs_1']['name']) {
			$docfile_1 = $_FILES['docs_1']['name'];
			$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$src = $_FILES['docs_1']['tmp_name'];
			$detail['ssp_purchase_order_doc'] = $docfile_1;
			upload($docfile_1, $src);
		}

		if ($_FILES['docs_2']['name']) {
			$docfile_2 = $_FILES['docs_2']['name'];
			$docfile_2 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$src2 = $_FILES['docs_2']['tmp_name'];
			$fn = explode(".", $docfile_2);
			$fn1 = $fn[0] . '_' . $ran . '.' . $fn[1];
			$docfile_2 = $fn1;
			$detail['ssp_invoice_doc'] = $docfile_2;
			upload($docfile_2, $src2);
		}

		if ($this_id) {
			$tableDocuments->setWhere($ID . " = " . $this_id);
			$this_id = $tableDocuments->updateRow($detail);
		} else {
			$sql = "SELECT ssp_id, ssp_unique_id FROM short_stays_payables_tracker ORDER BY ssp_id DESC LIMIT 1";
			$urnData = $fwDb->queryOne($sql);

			if (empty($urnData)) {
				$detail['ssp_unique_id'] = '0001';
				$detail['ssp_urn'] = 'SS' . $detail['ssp_unique_id'];
			} else {
				$inr = (int)$urnData['ssp_unique_id'];
				$inr++;
				$dc = strlen($inr);
				if ($dc == 1) { $inr = '000' . $inr; }
				if ($dc == 2) { $inr = '00' . $inr; }
				if ($dc == 3) { $inr = '0' . $inr; }
				$detail['ssp_unique_id'] = $inr;
				$detail['ssp_urn'] = 'SS' . $detail['ssp_unique_id'];
			}

			$this_id = $tableDocuments->insertRow($detail);
		}

		if ($this_id) {
			$fwViewData['opr'] = "Success!";
			$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
		}
	} else {
		$fwViewData['ssp_invoice_no'] = $detail['ssp_invoice_number'];
		$fwViewData['ssp_supplier'] = $detail['ssp_supplier'];
		$fwViewData['duplicate'] = "Duplicate Supplier and Invoice number";
	}
}

if (!empty($ssp_id)) {
	$tableDocuments->setWhere($ID . " = " . $ssp_id);
	$fwViewData['detail'] = $tableDocuments->getRow();
}

$fwViewData['title'] = "Short Stays Payables Tracker";

$sql = "SELECT co_company_name FROM companies ORDER BY co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql);

$sqlbus = "SELECT bsn_address FROM business ORDER BY bsn_address";
$fwViewData['busdetail'] = $fwDb->query($sqlbus);

$sqlpo = "SELECT DISTINCT po_po_number FROM purchase_order ORDER BY po_po_number";
$fwViewData['podetail'] = $fwDb->query($sqlpo);
