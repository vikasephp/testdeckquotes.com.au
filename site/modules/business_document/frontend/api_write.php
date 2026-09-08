<?php
/*
 * Authenticated UPDATE-only save for HTML Business Documents.
 * URL: /business_document.api_write
 * Header: X-GCONS-BD-Key: <secret>
 */

header('Content-Type: application/json; charset=utf-8');
header('X-Content-Type-Options: nosniff');
header('Cache-Control: no-store');

@ini_set('memory_limit', '512M');
@set_time_limit(300);

function gcons_bd_api_fail($code, $message)
{
	http_response_code((int)$code);
	echo json_encode(array('ok' => false, 'error' => $message));
	exit;
}

$method = isset($_SERVER['REQUEST_METHOD']) ? strtoupper($_SERVER['REQUEST_METHOD']) : 'GET';
if ($method !== 'POST') {
	gcons_bd_api_fail(405, 'POST required');
}

if (!function_exists('gcons_bd_write_secret') || gcons_bd_write_secret() === '') {
	gcons_bd_api_fail(503, 'Write access is not configured');
}
if (!function_exists('gcons_bd_write_key_ok') || !gcons_bd_write_key_ok()) {
	gcons_bd_api_fail(401, 'Not authorised');
}

$input = array();
$contentType = isset($_SERVER['CONTENT_TYPE']) ? (string)$_SERVER['CONTENT_TYPE'] : '';
if (stripos($contentType, 'application/json') !== false) {
	$raw = file_get_contents('php://input');
	$decoded = json_decode($raw, true);
	if (!is_array($decoded)) {
		gcons_bd_api_fail(400, 'Invalid JSON');
	}
	$input = $decoded;
} else {
	$input = $_POST;
}

$utpId = 0;
if (isset($input['utp_id'])) {
	$utpId = (int)$input['utp_id'];
}
if ($utpId <= 0) {
	gcons_bd_api_fail(400, 'utp_id is required');
}

if (!array_key_exists('html', $input) && !array_key_exists('utp_html', $input) && !array_key_exists('url_html', $input)) {
	gcons_bd_api_fail(400, 'html is required');
}
$html = '';
if (array_key_exists('html', $input)) {
	$html = $input['html'];
} elseif (array_key_exists('utp_html', $input)) {
	$html = $input['utp_html'];
} else {
	$html = $input['url_html'];
}
$html = is_string($html) ? $html : '';
if ($html === '') {
	gcons_bd_api_fail(400, 'html is required');
}

$row = $fwDb->queryOne(
	"SELECT p.*, t.utt_slug
	 FROM url_table_pages p
	 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
	 WHERE p.utp_id = " . $utpId
);
if (empty($row['utp_id'])) {
	gcons_bd_api_fail(404, 'Document not found');
}
if (!function_exists('gcons_bd_is_html_document') || !gcons_bd_is_html_document($row)) {
	gcons_bd_api_fail(403, 'This document cannot be updated here');
}

if (function_exists('gcons_sanitize_document_html')) {
	$html = gcons_sanitize_document_html($html);
}
if (function_exists('gcons_prepare_document_html')) {
	$html = gcons_prepare_document_html($html, $utpId);
}

$name = isset($row['utp_name']) ? (string)$row['utp_name'] : '';
if (isset($input['name']) && trim((string)$input['name']) !== '') {
	$name = trim((string)$input['name']);
} elseif (isset($input['url_name']) && trim((string)$input['url_name']) !== '') {
	$name = trim((string)$input['url_name']);
}
if ($name === '') {
	gcons_bd_api_fail(400, 'Name is required');
}

$access = isset($row['utp_access']) ? (string)$row['utp_access'] : 'internal';
if (isset($input['access'])) {
	$access = trim((string)$input['access']);
} elseif (isset($input['url_access'])) {
	$access = trim((string)$input['url_access']);
}
if ($access !== 'public') {
	$access = 'internal';
}

$status = isset($row['utp_status']) ? (string)$row['utp_status'] : 'draft';
if (isset($input['status'])) {
	$status = trim((string)$input['status']);
} elseif (isset($input['url_status'])) {
	$status = trim((string)$input['url_status']);
}
if ($status !== 'live') {
	$status = 'draft';
}

$department = isset($row['utp_department']) ? (string)$row['utp_department'] : '';
if (array_key_exists('department', $input)) {
	$department = trim((string)$input['department']);
} elseif (array_key_exists('url_department', $input)) {
	$department = trim((string)$input['url_department']);
}

$ai_ready = !empty($row['utp_ai_ready']) ? 1 : 0;
if (array_key_exists('ai_ready', $input)) {
	$ai_ready = (int)$input['ai_ready'] ? 1 : 0;
} elseif (array_key_exists('url_ai_ready', $input)) {
	$ai_ready = (int)$input['url_ai_ready'] ? 1 : 0;
}

$name_slug = url_table_slug($name);
if ($name_slug === '') {
	gcons_bd_api_fail(400, 'Name must contain a letter or number');
}
$type_slug = !empty($row['utt_slug']) ? $row['utt_slug'] : 'document';
$path = url_table_path($type_slug, $name_slug);

$dup = $fwDb->queryOne(
	"SELECT utp_id FROM url_table_pages
	 WHERE utp_type_id = " . (int)$row['utp_type_id'] . "
	   AND utp_slug = '" . addslashes($name_slug) . "'
	   AND utp_id <> " . $utpId
);
if (!empty($dup['utp_id'])) {
	gcons_bd_api_fail(409, 'Another document already uses this Type and Name');
}

if (function_exists('gcons_bd_audit_ensure_schema')) {
	gcons_bd_audit_ensure_schema();
}

$updatedAt = date('Y-m-d H:i:s');
$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('ai') : 'AI (CGFB)';

$pagesTable = new Fw_Db_Table($TABLE);
$pagesTable->setWhere('utp_id = ' . $utpId);
$ok = $pagesTable->updateRow(array(
	'utp_name' => $name,
	'utp_slug' => $name_slug,
	'utp_path' => $path,
	'utp_html' => $html,
	'utp_access' => $access,
	'utp_status' => $status,
	'utp_department' => $department,
	'utp_ai_ready' => $ai_ready,
	'utp_updated_at' => $updatedAt,
	'utp_updated_by' => $updatedBy,
));
if (empty($ok)) {
	gcons_bd_api_fail(500, 'Could not save');
}

if (function_exists('gcons_bd_audit_log')) {
	gcons_bd_audit_log(array(
		'utp_id' => $utpId,
		'actor' => 'ai',
		'actor_label' => $updatedBy,
		'source' => 'api',
		'html_before' => isset($row['utp_html']) ? $row['utp_html'] : '',
		'html_after' => $html,
		'name_before' => isset($row['utp_name']) ? $row['utp_name'] : '',
		'name_after' => $name,
		'store_html_before' => true,
	));
}

echo json_encode(array(
	'ok' => true,
	'utp_id' => $utpId,
	'updated_at' => $updatedAt,
	'updated_by' => $updatedBy,
	'path' => $path,
));
exit;
