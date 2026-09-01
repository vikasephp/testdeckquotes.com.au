<?php
require_once dirname(__FILE__) . '/cse_extra_docs.php';

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$docid = $fwRequest->getparam('doc_id', '');
$insp_type = preg_replace('/[^a-z0-9_]/i', '', $fwRequest->getParam('insp_type', ''));
$list = $fwRequest->getParam('list', '');

if ($list != '') {
	while (ob_get_level()) {
		ob_end_clean();
	}
	header('Content-Type: application/json');
	echo json_encode(cse_insp_flag_map($fwDb, $id, $insp_type));
	exit;
}

if (!empty($id) && $insp_type !== '' && !empty($docid)) {
	cse_set_insp_not_required($fwDb, $id, $docid, $insp_type, $value);
	exit;
}

if (!empty($id)) {
	$sql = "Update document_check_list set doc_not_required  = ".$value. " where doc_bsn_id = " .$id ." and doc_name_id = " .$docid;
	$fwDb -> queryOne($sql);
}

exit;
