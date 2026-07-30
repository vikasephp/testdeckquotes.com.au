<?php
$this_id = $fwRequest->getparamget('ssp_id', '');
$doc = $fwRequest->getparamget('doc', '');

if ($this_id > 0) {

	$thisTable = new Fw_Db_Table('short_stays_payables_tracker');
	$thisTable->setWhere("ssp_id = " . $this_id);

	if ($doc == 1) {
		$delData['ssp_purchase_order_doc'] = '';
	} elseif ($doc == 2) {
		$delData['ssp_invoice_doc'] = '';
	}

	$thisTable->updateRow($delData);

	echo "delete.";
}
exit;
