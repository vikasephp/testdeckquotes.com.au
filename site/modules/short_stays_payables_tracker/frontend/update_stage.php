<?php

$id = $fwRequest->getParam('ssp_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if (!empty($id)) {
	$sql = "UPDATE short_stays_payables_tracker SET ssp_invoice_stage = " . (int)$value . " WHERE ssp_id = " . (int)$id;
	$fwDb->queryOne($sql);

	$sqlA = "UPDATE short_stays_payables_tracker SET ssp_inv_stage_user = '" . $usr . "' WHERE ssp_id = " . (int)$id;
	$fwDb->queryOne($sqlA);

	$sqlB = "UPDATE short_stays_payables_tracker SET ssp_inv_stage_date = '" . $dt . "' WHERE ssp_id = " . (int)$id;
	$fwDb->queryOne($sqlB);

	$sql2 = "SELECT is_color FROM short_stays_payables_tracker_invoice_stage WHERE is_id = " . (int)$value;
	$colr = $fwDb->queryOne($sql2);

	echo $colr['is_color'];
}

exit;
