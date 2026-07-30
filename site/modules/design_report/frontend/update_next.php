<?php

$id_nd = $fwRequest->getParam('dpn_unique_id_nd', '');
$id_nt = $fwRequest->getParam('dpn_unique_id_nt', '');
$id_nl = $fwRequest->getParam('dpn_unique_id_nl', '');
$value = $fwRequest->getparam('value', '');

if (!empty($id_nd)) {
	$sql = "Update document_proposal_name set  dpn_dr_next_date  = '" . $value . "' where dpn_unique_id = " . $id_nd;
	$fwDb->queryOne($sql);
}

if (!empty($id_nt)) {
	$sql = "Update document_proposal_name set  dpn_dr_next_time  = '" . $value . "' where dpn_unique_id = " . $id_nt;
	$fwDb->queryOne($sql);
}

if (!empty($id_nl)) {
	$sql = "Update document_proposal_name set   dpn_dr_next_location  = '" . $value . "' where dpn_unique_id = " . $id_nl;
	$fwDb->queryOne($sql);
}

exit;
