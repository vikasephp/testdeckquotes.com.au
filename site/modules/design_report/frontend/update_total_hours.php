<?php


$id = $fwRequest->getParam('dpn_bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20', ' ', $value);

if (!empty($id)) {
	$sql = "UPDATE document_proposal_name SET dpn_dr_total_hours  = '" . $value . "' WHERE dpn_bsn_id = " . $id;
	$fwDb->queryOne($sql);
}

exit;
