<?php

$id = $fwRequest->getParam('dpn_bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];
$value = str_replace('%20', ' ', $value);
if (!empty($id)) {
	$sql = "UPDATE document_proposal_name SET dpn_dr_cust_des_hour  = '" . $value . "' WHERE dpn_bsn_id = " . $id;
	$fwDb->queryOne($sql);

	$sql = "UPDATE document_proposal_name SET dpn_dr_cdh_date  = '" . $dt . "' WHERE dpn_bsn_id = " . $id;
	$fwDb->queryOne($sql);

	$sql = "UPDATE document_proposal_name SET dpn_dr_cdh_user  = '" . $user . "' WHERE dpn_bsn_id = " . $id;
	$fwDb->queryOne($sql);

	$sqlT = "SELECT dpn_dr_cdh_date, dpn_dr_cdh_user FROM document_proposal_name WHERE dpn_bsn_id = " . $id;
	$dataT = $fwDb->queryOne($sqlT);

	$output = $dataT['dpn_dr_cdh_date'] . "<br>" . $dataT['dpn_dr_cdh_user'];

	//echo "Tana";
	echo $output;
}

exit;
