<?php
/*
 * Move embedded pictures out of existing Business Documents.
 * Backs up original HTML once per document; never overwrites that backup.
 */

@ini_set('memory_limit', '1024M');
@set_time_limit(300);

$fwViewData['title'] = 'Clean up document pictures';
$fwMainView = 'file:' . getcwd() . '/extract_images.tpl';

$helper = LIB_DIR . 'gcons_document_images.php';
if (is_file($helper)) {
	require_once($helper);
}

$msg = '';
$error = '';
$lastResult = null;

$extractId = (int)$fwRequest->getParam('extract_id', 0);
$extractNext = (int)$fwRequest->getParam('extract_next', 0);

if (!function_exists('gcons_extract_url_table_page')) {
	$error = 'Image cleanup library is missing. Upload site/lib/gcons_document_images.php.';
} elseif ($extractId > 0 && $_SERVER['REQUEST_METHOD'] === 'POST') {
	$lastResult = gcons_extract_url_table_page($extractId);
	if (!empty($lastResult['ok'])) {
		$msg = $lastResult['message'];
	} else {
		$error = isset($lastResult['message']) ? $lastResult['message'] : 'Cleanup failed.';
	}
} elseif ($extractNext && $_SERVER['REQUEST_METHOD'] === 'POST' && empty($error)) {
	$next = $fwDb->queryOne(
		"SELECT utp_id FROM url_table_pages
		 WHERE utp_html LIKE '%data:image%'
		 ORDER BY LENGTH(utp_html) ASC, utp_id ASC
		 LIMIT 1"
	);
	if (!empty($next['utp_id'])) {
		$lastResult = gcons_extract_url_table_page((int)$next['utp_id']);
		if (!empty($lastResult['ok'])) {
			$msg = $lastResult['message'];
		} else {
			$error = isset($lastResult['message']) ? $lastResult['message'] : 'Cleanup failed.';
		}
	} else {
		$msg = 'No remaining documents have pictures stuck inside them.';
	}
}

$rows = $fwDb->query(
	"SELECT p.utp_id, p.utp_name, p.utp_status, p.utp_updated_at, t.utt_name,
		LENGTH(p.utp_html) AS html_bytes,
		IF(p.utp_html LIKE '%data:image%', 1, 0) AS has_embed
	 FROM url_table_pages p
	 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
	 WHERE p.utp_html IS NOT NULL AND p.utp_html <> ''
	 ORDER BY has_embed DESC, html_bytes DESC, p.utp_name ASC"
);
if (!is_array($rows)) {
	$rows = array();
}

$pending = 0;
foreach ($rows as $i => $row) {
	$utpId = (int)$row['utp_id'];
	$backupPath = function_exists('gcons_ckeditor_html_backup_path')
		? gcons_ckeditor_html_backup_path($utpId)
		: '';
	$rows[$i]['backup_exists'] = ($backupPath !== '' && is_file($backupPath));
	$rows[$i]['html_kb'] = number_format(((int)$row['html_bytes']) / 1024, 1);
	if (!empty($row['has_embed'])) {
		$pending++;
	}
}

$fwViewData['rows'] = $rows;
$fwViewData['pending'] = $pending;
$fwViewData['msg'] = $msg;
$fwViewData['error'] = $error;
$fwViewData['continue_cleanup'] = ($extractNext && $pending > 0 && $error === '');
