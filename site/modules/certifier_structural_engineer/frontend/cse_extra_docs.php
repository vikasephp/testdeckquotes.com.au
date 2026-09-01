<?php
function cse_allowed_return($return)
{
	$allowed = array(
		'view_doc',
		'pier_inspection_required',
		'flooting_inspection_required',
		'slab_inspection_required',
		'floor_inspection_required',
		'presheet_inspection_required',
		'final_inspection_required'
	);
	if (!in_array($return, $allowed, true)) {
		return 'view_doc';
	}
	return $return;
}

function cse_ensure_insp_required_table($fwDb)
{
	$fwDb->execute("CREATE TABLE IF NOT EXISTS cse_insp_required (
		cir_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		cir_bsn_id INT NOT NULL,
		cir_doc_id INT NOT NULL,
		cir_insp_type VARCHAR(50) NOT NULL DEFAULT '',
		cir_not_required TINYINT NOT NULL DEFAULT 0,
		UNIQUE KEY cir_unique (cir_bsn_id, cir_doc_id, cir_insp_type)
	)");
}

function cse_get_insp_not_required($fwDb, $bsn_id, $doc_id, $insp_type, $fallback)
{
	cse_ensure_insp_required_table($fwDb);
	$insp_type = preg_replace('/[^a-z0-9_]/i', '', $insp_type);
	$bsn_id = (int)$bsn_id;
	$doc_id = (int)$doc_id;
	if ($insp_type === '' || $bsn_id <= 0 || $doc_id <= 0) {
		if ($fallback === null || $fallback === '') {
			return 0;
		}
		return $fallback;
	}
	$row = $fwDb->queryOne("SELECT cir_not_required FROM cse_insp_required WHERE cir_bsn_id = ".$bsn_id." AND cir_doc_id = ".$doc_id." AND cir_insp_type = '".addslashes($insp_type)."'");
	$val = cse_row_val($row, 'cir_not_required');
	if ($val === null || $val === '') {
		if ($fallback === null || $fallback === '') {
			return 0;
		}
		return $fallback;
	}
	return $val;
}

function cse_set_insp_not_required($fwDb, $bsn_id, $doc_id, $insp_type, $value)
{
	cse_ensure_insp_required_table($fwDb);
	$insp_type = preg_replace('/[^a-z0-9_]/i', '', $insp_type);
	$bsn_id = (int)$bsn_id;
	$doc_id = (int)$doc_id;
	$value = ((int)$value) ? 1 : 0;
	if ($insp_type === '' || $bsn_id <= 0 || $doc_id <= 0) {
		return;
	}
	$existing = $fwDb->queryOne("SELECT cir_id FROM cse_insp_required WHERE cir_bsn_id = ".$bsn_id." AND cir_doc_id = ".$doc_id." AND cir_insp_type = '".addslashes($insp_type)."'");
	$cirId = (int)cse_row_val($existing, 'cir_id');
	if ($cirId > 0) {
		$fwDb->execute("UPDATE cse_insp_required SET cir_not_required = ".$value." WHERE cir_id = ".$cirId);
	} else {
		$fwDb->execute("INSERT INTO cse_insp_required (cir_bsn_id, cir_doc_id, cir_insp_type, cir_not_required) VALUES (".$bsn_id.", ".$doc_id.", '".addslashes($insp_type)."', ".$value.")");
	}
}

function cse_insp_flag_map($fwDb, $bsn_id, $insp_type)
{
	cse_ensure_insp_required_table($fwDb);
	$insp_type = preg_replace('/[^a-z0-9_]/i', '', $insp_type);
	$bsn_id = (int)$bsn_id;
	$out = array();
	if ($insp_type === '' || $bsn_id <= 0) {
		return $out;
	}
	$rows = $fwDb->query("SELECT cir_doc_id, cir_not_required FROM cse_insp_required WHERE cir_bsn_id = ".$bsn_id." AND cir_insp_type = '".addslashes($insp_type)."'");
	if (!is_array($rows)) {
		return $out;
	}
	if (!empty($rows) && (array_key_exists('cir_doc_id', $rows) || array_key_exists('CIR_DOC_ID', $rows))) {
		$rows = array($rows);
	}
	foreach ($rows as $row) {
		if (!is_array($row)) {
			continue;
		}
		$docId = (int)cse_row_val($row, 'cir_doc_id');
		if ($docId > 0) {
			$out[(string)$docId] = (int)cse_row_val($row, 'cir_not_required');
		}
	}
	return $out;
}

function cse_ensure_insp_type_column($fwDb)
{
	$cols = $fwDb->query("SHOW COLUMNS FROM ss_required_doc LIKE 'ss_insp_type'");
	if (empty($cols)) {
		$fwDb->execute("ALTER TABLE ss_required_doc ADD COLUMN ss_insp_type VARCHAR(50) NOT NULL DEFAULT ''");
	}
}

function cse_hardcoded_doc_ids($insp_type)
{
	$map = array(
		'pier' => array(116, 235),
		'footing' => array(235, 653, 478, 116),
		'slab' => array(235, 653, 116, 148),
		'floor' => array(148, 235),
		'presheet' => array(261, 289, 155, 295, 739, 626),
		'final' => array(663),
		'se_presheet' => array()
	);
	if (isset($map[$insp_type])) {
		return $map[$insp_type];
	}
	return array();
}

function cse_overlay_hardcoded_docs($fwDb, $bsn_id, $insp_type, &$view)
{
	if (!is_array($view)) {
		return;
	}
	foreach (cse_hardcoded_doc_ids($insp_type) as $id) {
		$key = 'data'.$id;
		if (!isset($view[$key]) || !is_array($view[$key])) {
			$view[$key] = array();
		}
		$fallback = 0;
		if (array_key_exists('doc_not_required', $view[$key])) {
			$fallback = $view[$key]['doc_not_required'];
		}
		$view[$key]['doc_not_required'] = cse_get_insp_not_required($fwDb, $bsn_id, $id, $insp_type, $fallback);
	}
}

function cse_row_val($row, $key)
{
	if (!is_array($row)) {
		return null;
	}
	if (array_key_exists($key, $row)) {
		return $row[$key];
	}
	$upper = strtoupper($key);
	if (array_key_exists($upper, $row)) {
		return $row[$upper];
	}
	$lower = strtolower($key);
	if (array_key_exists($lower, $row)) {
		return $row[$lower];
	}
	return null;
}

function cse_is_pending_doc($notRequired, $fileName)
{
	if ($notRequired === null || $notRequired === '') {
		$notRequired = 0;
	}
	$fileName = trim((string)$fileName);
	return ($notRequired == 0 && $fileName === '');
}

function cse_extra_matches_type($rowType, $insp_type)
{
	$rowType = trim((string)$rowType);
	$insp_type = trim((string)$insp_type);
	if ($insp_type === 'se_presheet') {
		$otherTypes = array('pier', 'footing', 'slab', 'floor', 'presheet', 'final');
		return ($rowType === '' || $rowType === 'se_presheet' || !in_array($rowType, $otherTypes, true));
	}
	return ($rowType === $insp_type);
}

function cse_resolve_extra_doc_id($fwDb, $row)
{
	$docId = (int)cse_row_val($row, 'ss_doc_id');
	if ($docId > 0) {
		return $docId;
	}
	$docName = trim((string)cse_row_val($row, 'ss_document'));
	if ($docName === '') {
		return 0;
	}
	$lookup = $fwDb->queryOne("SELECT admin_doc_id FROM admin_document_check_list WHERE admin_doc_name = '" . addslashes($docName) . "'");
	return (int)cse_row_val($lookup, 'admin_doc_id');
}

function cse_all_extra_doc_rows($fwDb)
{
	static $rows = null;
	if ($rows !== null) {
		return $rows;
	}
	cse_ensure_insp_type_column($fwDb);
	$rows = $fwDb->query("SELECT * FROM ss_required_doc");
	if (!is_array($rows)) {
		$rows = array();
	}
	if (!empty($rows) && (array_key_exists('ss_doc_id', $rows) || array_key_exists('SS_DOC_ID', $rows) || array_key_exists('ss_id', $rows))) {
		$rows = array($rows);
	}
	return $rows;
}

function cse_load_extra_docs($fwDb, $bsn_id, $insp_type)
{
	$insp_type = preg_replace('/[^a-z0-9_]/i', '', $insp_type);
	$bsn_id = (int)$bsn_id;
	$allRows = cse_all_extra_doc_rows($fwDb);
	$docdata = array();
	foreach ($allRows as $v) {
		if (!is_array($v)) {
			continue;
		}
		if (!cse_extra_matches_type(cse_row_val($v, 'ss_insp_type'), $insp_type)) {
			continue;
		}
		$docId = cse_resolve_extra_doc_id($fwDb, $v);
		$sql_A = "select doc_not_required, doc_file_name, doc_name_id from document_check_list where doc_bsn_id = ".$bsn_id." and doc_name_id = ".$docId;
		$aaa = $fwDb->queryOne($sql_A);
		$v['ss_doc_id'] = $docId;
		$v['doc_not_required'] = cse_row_val($aaa, 'doc_not_required');
		if ($v['doc_not_required'] === null || $v['doc_not_required'] === '') {
			$v['doc_not_required'] = 0;
		}
		$v['doc_not_required'] = cse_get_insp_not_required($fwDb, $bsn_id, $docId, $insp_type, $v['doc_not_required']);
		$fileName = cse_row_val($aaa, 'doc_file_name');
		$v['doc_file_name'] = ($fileName === null) ? '' : $fileName;
		$docNameId = cse_row_val($aaa, 'doc_name_id');
		$v['doc_name_id'] = (!empty($docNameId)) ? $docNameId : $docId;
		$sqlS = "SELECT sa_include_supplier FROM supplier_certifier where sa_bsn_id = ".$bsn_id." and sa_car_id = ".$docId;
		$sup = $fwDb->query($sqlS);
		$v['suppliers'] = is_array($sup) ? $sup : array();
		$docdata[] = $v;
	}

	global $fwViewData;
	if (isset($fwViewData) && is_array($fwViewData) && isset($fwViewData['return_fuse']) && isset($fwViewData['insp_type']) && $fwViewData['insp_type'] === $insp_type) {
		cse_overlay_hardcoded_docs($fwDb, $bsn_id, $insp_type, $fwViewData);
	}

	return $docdata;
}

function cse_count_pending_docs($fwDb, $bsn_id, $docIds, $inspTypes)
{
	$bsn_id = (int)$bsn_id;
	if ($bsn_id <= 0) {
		return 0;
	}

	$counted = array();
	$pending = 0;
	$colType = '';
	foreach ((array)$inspTypes as $type) {
		$type = preg_replace('/[^a-z0-9_]/i', '', $type);
		if ($type !== '') {
			$colType = $type;
			break;
		}
	}

	foreach ((array)$docIds as $id) {
		$id = (int)$id;
		if ($id <= 0 || isset($counted[$id])) {
			continue;
		}
		$counted[$id] = 1;
		$sqlDoc = "select doc_not_required, doc_file_name from document_check_list where doc_bsn_id = ".$bsn_id." and doc_name_id = ".$id;
		$row = $fwDb->queryOne($sqlDoc);
		$notRequired = cse_get_insp_not_required($fwDb, $bsn_id, $id, $colType, cse_row_val($row, 'doc_not_required'));
		if (cse_is_pending_doc($notRequired, cse_row_val($row, 'doc_file_name'))) {
			$pending++;
		}
	}

	foreach ((array)$inspTypes as $type) {
		$type = preg_replace('/[^a-z0-9_]/i', '', $type);
		if ($type === '') {
			continue;
		}
		$extras = cse_load_extra_docs($fwDb, $bsn_id, $type);
		foreach ($extras as $extra) {
			$id = (int)cse_row_val($extra, 'doc_name_id');
			if ($id <= 0) {
				$id = (int)cse_row_val($extra, 'ss_doc_id');
			}
			if ($id <= 0 || isset($counted[$id])) {
				continue;
			}
			$counted[$id] = 1;
			if (cse_is_pending_doc(cse_row_val($extra, 'doc_not_required'), cse_row_val($extra, 'doc_file_name'))) {
				$pending++;
			}
		}
	}

	return $pending;
}

function cse_count_stage_pending($fwDb, $bsn_id, $stage)
{
	$bsn_id = (int)$bsn_id;
	$stage = (int)$stage;
	if ($stage == 2) {
		return cse_count_pending_docs($fwDb, $bsn_id, array(261, 289, 155, 295, 739, 626), array('presheet'))
			+ cse_count_pending_docs($fwDb, $bsn_id, array(), array('se_presheet'));
	}
	if ($stage == 3) {
		return cse_count_pending_docs($fwDb, $bsn_id, array(663), array('final'));
	}
	return cse_count_pending_docs($fwDb, $bsn_id, array(116, 235), array('pier'))
		+ cse_count_pending_docs($fwDb, $bsn_id, array(235, 653, 478, 116), array('footing'))
		+ cse_count_pending_docs($fwDb, $bsn_id, array(235, 653, 116, 148), array('slab'))
		+ cse_count_pending_docs($fwDb, $bsn_id, array(148, 235), array('floor'));
}

function cse_ajax_pending_payload($fwDb, $bsn_id, $stage)
{
	$bsn_id = (int)$bsn_id;
	$stage = (int)$stage;
	$pending = 0;
	$alerts = 0;

	if ($stage == 2) {
		$pending = cse_count_stage_pending($fwDb, $bsn_id, 2);
		$row = $fwDb->queryOne("select count(*) as openps from construction_alert_report where car_type = 'Certifier - Pre-sheet' AND car_bsn_id = ".$bsn_id." And car_status = 'Open'");
		$alerts = (int)cse_row_val($row, 'openps');
	} elseif ($stage == 3) {
		$pending = cse_count_stage_pending($fwDb, $bsn_id, 3);
		$row = $fwDb->queryOne("select count(*) as openfinal from construction_alert_report where car_type = 'Certifier – Final' AND car_bsn_id = ".$bsn_id." And car_status = 'Open'");
		$alerts = (int)cse_row_val($row, 'openfinal');
	} else {
		$pending = cse_count_stage_pending($fwDb, $bsn_id, 1);
		$rowA = $fwDb->queryOne("select count(*) as openfooting from construction_alert_report where car_type = 'Certifier – Footings' AND car_bsn_id = ".$bsn_id." And car_status = 'Open'");
		$rowB = $fwDb->queryOne("select count(*) as openslab from construction_alert_report where car_type = 'Certifier – Slab' AND car_bsn_id = ".$bsn_id." And car_status = 'Open'");
		$rowC = $fwDb->queryOne("select count(*) as openfloor from construction_alert_report where car_type = 'Certifier – Floor System' AND car_bsn_id = ".$bsn_id." And car_status = 'Open'");
		$alerts = (int)cse_row_val($rowA, 'openfooting') + (int)cse_row_val($rowB, 'openslab') + (int)cse_row_val($rowC, 'openfloor');
	}

	return array(
		'pending' => (int)$pending,
		'alerts' => (int)$alerts,
		'next' => (int)$pending + (int)$alerts
	);
}
