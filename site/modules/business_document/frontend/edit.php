<?php
/*
 * URL Table - Edit document (HTML + metadata)
 */

$ajax = $fwRequest->getParam('ajax', '');
if ($ajax === '' && isset($_GET['ajax'])) {
	$ajax = $_GET['ajax'];
}
if ($ajax === 'doc_links') {
	header('Content-Type: application/json; charset=utf-8');
	if (empty($_SESSION['user']['user_id'])) {
		echo json_encode(array('ok' => false, 'items' => array()));
		exit;
	}
	$q = $fwRequest->getParam('q', '');
	if ($q === '' && isset($_GET['q'])) {
		$q = $_GET['q'];
	}
	$exclude = (int)$fwRequest->getParam('utp_id', 0);
	$items = array();
	if (function_exists('url_table_search_link_targets')) {
		$items = url_table_search_link_targets($q, $exclude);
	}
	echo json_encode(array('ok' => true, 'items' => $items));
	exit;
}

if ($ajax === 'history') {
	header('Content-Type: application/json; charset=utf-8');
	if (empty($_SESSION['user']['user_id'])) {
		echo json_encode(array('ok' => false, 'items' => array()));
		exit;
	}
	$histId = (int)$fwRequest->getParam('utp_id', 0);
	$page = (int)$fwRequest->getParam('page', 1);
	$q = trim((string)$fwRequest->getParam('q', ''));
	if ($q === '' && isset($_GET['q'])) {
		$q = trim((string)$_GET['q']);
	}
	if ($page < 1) {
		$page = 1;
	}
	$perPage = 20;
	$items = array();
	$total = 0;
	if ($histId > 0 && function_exists('gcons_bd_history_list')) {
		if (function_exists('gcons_bd_history_count')) {
			$total = gcons_bd_history_count($histId, $q);
		}
		$pages = $perPage > 0 ? (int)ceil($total / $perPage) : 1;
		if ($pages < 1) {
			$pages = 1;
		}
		if ($page > $pages) {
			$page = $pages;
		}
		$items = gcons_bd_history_list($histId, $perPage, ($page - 1) * $perPage, $q);
	} else {
		$pages = 1;
	}
	echo json_encode(array(
		'ok' => true,
		'items' => $items,
		'page' => $page,
		'pages' => $pages,
		'total' => $total,
		'q' => $q,
	));
	exit;
}

if ($ajax === 'autosave') {
	header('Content-Type: application/json; charset=utf-8');
	if (empty($_SESSION['user']['user_id'])) {
		echo json_encode(array('ok' => false));
		exit;
	}
	$saveId = (int)$fwRequest->getParam('utp_id', 0);
	if ($saveId <= 0) {
		echo json_encode(array('ok' => false));
		exit;
	}
	$saveRow = $fwDb->queryOne(
		"SELECT p.utp_id, p.utp_source, p.utp_type_id, p.utp_name, t.utt_slug
		 FROM url_table_pages p
		 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
		 WHERE p.utp_id = " . $saveId
	);
	if (empty($saveRow['utp_id'])) {
		echo json_encode(array('ok' => false));
		exit;
	}
	$saveSource = isset($saveRow['utp_source']) ? trim((string)$saveRow['utp_source']) : '';
	if ($saveSource !== '' && $saveSource !== 'Business Documents') {
		echo json_encode(array('ok' => false));
		exit;
	}
	@ini_set('memory_limit', '512M');
	@set_time_limit(300);
	$seq = (int)$fwRequest->getParam('autosave_seq', 0);
	$seqKey = 'id-' . $saveId;
	if (!isset($_SESSION['gcons_autosave_seq']) || !is_array($_SESSION['gcons_autosave_seq'])) {
		$_SESSION['gcons_autosave_seq'] = array();
	}
	$lastSeq = isset($_SESSION['gcons_autosave_seq'][$seqKey]) ? (int)$_SESSION['gcons_autosave_seq'][$seqKey] : 0;
	if ($seq > 1000000000000 && $lastSeq > 1000000000000 && $seq <= $lastSeq) {
		echo json_encode(array('ok' => true, 'ignored' => 1));
		exit;
	}
	if (function_exists('session_write_close')) {
		session_write_close();
	}
	$name = trim($fwRequest->getParam('url_name', ''));
	if ($name === '') {
		echo json_encode(array('ok' => false));
		exit;
	}
	$name_slug = url_table_slug($name);
	if ($name_slug === '') {
		echo json_encode(array('ok' => false));
		exit;
	}
	$html = $fwRequest->getParam('url_html', '');
	$contentLen = isset($_SERVER['CONTENT_LENGTH']) ? (int)$_SERVER['CONTENT_LENGTH'] : 0;
	if ($html === '' && $contentLen > 100000) {
		echo json_encode(array('ok' => false));
		exit;
	}
	if (function_exists('gcons_prepare_document_html')) {
		$html = gcons_prepare_document_html($html, $saveId);
	} elseif (function_exists('gcons_sanitize_document_html')) {
		$html = gcons_sanitize_document_html($html);
	}
	$access = trim($fwRequest->getParam('url_access', 'internal'));
	$status = trim($fwRequest->getParam('url_status', 'draft'));
	$department = trim($fwRequest->getParam('url_department', ''));
	$ai_ready = (int)$fwRequest->getParam('url_ai_ready', 0) ? 1 : 0;
	if ($access !== 'public') {
		$access = 'internal';
	}
	if ($status !== 'live') {
		$status = 'draft';
	}
	$type_slug = !empty($saveRow['utt_slug']) ? $saveRow['utt_slug'] : 'document';
	$path = url_table_path($type_slug, $name_slug);
	$dup = $fwDb->queryOne(
		"SELECT utp_id FROM url_table_pages
		 WHERE utp_type_id = " . (int)$saveRow['utp_type_id'] . "
		   AND utp_slug = '" . addslashes($name_slug) . "'
		   AND utp_id <> " . (int)$saveId
	);
	if (!empty($dup['utp_id'])) {
		echo json_encode(array('ok' => false));
		exit;
	}
	$lastSeq = isset($_SESSION['gcons_autosave_seq'][$seqKey]) ? (int)$_SESSION['gcons_autosave_seq'][$seqKey] : 0;
	if ($seq > 1000000000000 && $lastSeq > 1000000000000 && $seq <= $lastSeq) {
		echo json_encode(array('ok' => true, 'ignored' => 1));
		exit;
	}
	if (function_exists('gcons_bd_audit_ensure_schema')) {
		gcons_bd_audit_ensure_schema();
	}
	$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
	$pagesTable = new Fw_Db_Table($TABLE);
	$pagesTable->setWhere('utp_id = ' . $saveId);
	$ok = $pagesTable->updateRow(array(
		'utp_name' => $name,
		'utp_slug' => $name_slug,
		'utp_path' => $path,
		'utp_html' => $html,
		'utp_access' => $access,
		'utp_status' => $status,
		'utp_department' => $department,
		'utp_ai_ready' => $ai_ready,
		'utp_updated_at' => date('Y-m-d H:i:s'),
		'utp_updated_by' => $updatedBy,
	));
	if (!empty($ok) && function_exists('gcons_bd_audit_log')) {
		gcons_bd_audit_log(array(
			'utp_id' => $saveId,
			'actor' => 'human',
			'actor_label' => $updatedBy,
			'source' => 'autosave',
			'html_before' => '',
			'html_after' => $html,
			'name_before' => isset($saveRow['utp_name']) ? $saveRow['utp_name'] : '',
			'name_after' => $name,
			'store_html_before' => false,
		));
	}
	if (!empty($ok) && $seq > 0) {
		if (function_exists('session_status') && session_status() !== PHP_SESSION_ACTIVE) {
			@session_start();
		}
		if (!isset($_SESSION['gcons_autosave_seq']) || !is_array($_SESSION['gcons_autosave_seq'])) {
			$_SESSION['gcons_autosave_seq'] = array();
		}
		$_SESSION['gcons_autosave_seq'][$seqKey] = $seq;
	}
	echo json_encode(array('ok' => !empty($ok)));
	exit;
}

$fwViewData['title'] = 'Edit Document';
$fwMainView = 'file:' . getcwd() . '/edit.tpl';

$departments = array(
	'Contracts',
	'Client Services',
	'Construction',
	'Sales',
	'Planning',
	'Administration',
);
$fwViewData['departments'] = $departments;

$utp_id = (int)$fwRequest->getParam('utp_id', 0);
if ($utp_id <= 0) {
	header('Location: ' . BASE_URL . 'business_document.home');
	exit;
}

$row = $fwDb->queryOne(
	"SELECT p.*, t.utt_name, t.utt_slug, u.user_name AS created_by_name
	 FROM url_table_pages p
	 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
	 LEFT JOIN users u ON u.user_id = p.utp_created_by
	 WHERE p.utp_id = " . (int)$utp_id
);

if (empty($row['utp_id'])) {
	header('Location: ' . BASE_URL . 'business_document.home');
	exit;
}

$msg = '';
$error = '';

$submit = $fwRequest->getParam('subSaveHtml', '');
if (!empty($submit)) {
	$html = $fwRequest->getParam('url_html', '');
	if (function_exists('gcons_sanitize_document_html')) {
		$html = gcons_sanitize_document_html($html);
	}
	if (function_exists('gcons_prepare_document_html')) {
		$html = gcons_prepare_document_html($html, $utp_id);
	}
	$name = trim($fwRequest->getParam('url_name', $row['utp_name']));
	$access = trim($fwRequest->getParam('url_access', 'internal'));
	$status = trim($fwRequest->getParam('url_status', 'draft'));
	$department = trim($fwRequest->getParam('url_department', ''));
	$ai_ready = (int)$fwRequest->getParam('url_ai_ready', 0) ? 1 : 0;

	if ($access !== 'public') {
		$access = 'internal';
	}
	if ($status !== 'live') {
		$status = 'draft';
	}

	if ($name === '') {
		$error = 'Name is required.';
	} else {
		$name_slug = url_table_slug($name);
		$type_slug = $row['utt_slug'];
		$path = url_table_path($type_slug, $name_slug);

		$dup = $fwDb->queryOne(
			"SELECT utp_id FROM url_table_pages
			 WHERE utp_type_id = " . (int)$row['utp_type_id'] . "
			   AND utp_slug = '" . addslashes($name_slug) . "'
			   AND utp_id <> " . (int)$utp_id
		);

		if (!empty($dup['utp_id'])) {
			$error = 'Another document already uses this Type and Name.';
		} else {
			if (function_exists('gcons_bd_audit_ensure_schema')) {
				gcons_bd_audit_ensure_schema();
			}
			$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
			$pagesTable = new Fw_Db_Table($TABLE);
			$pagesTable->setWhere('utp_id = ' . (int)$utp_id);
			$opr = $pagesTable->updateRow(array(
				'utp_name' => $name,
				'utp_slug' => $name_slug,
				'utp_path' => $path,
				'utp_html' => $html,
				'utp_access' => $access,
				'utp_status' => $status,
				'utp_department' => $department,
				'utp_ai_ready' => $ai_ready,
				'utp_updated_at' => date('Y-m-d H:i:s'),
				'utp_updated_by' => $updatedBy,
			));

			if ($opr) {
				if (function_exists('gcons_bd_audit_log')) {
					gcons_bd_audit_log(array(
						'utp_id' => $utp_id,
						'actor' => 'human',
						'actor_label' => $updatedBy,
						'source' => 'save',
						'html_before' => isset($row['utp_html']) ? $row['utp_html'] : '',
						'html_after' => $html,
						'name_before' => isset($row['utp_name']) ? $row['utp_name'] : '',
						'name_after' => $name,
						'store_html_before' => true,
					));
				}
				$msg = 'Saved successfully.';
				$row['utp_name'] = $name;
				$row['utp_slug'] = $name_slug;
				$row['utp_path'] = $path;
				$row['utp_html'] = $html;
				$row['utp_access'] = $access;
				$row['utp_status'] = $status;
				$row['utp_department'] = $department;
				$row['utp_ai_ready'] = $ai_ready;
				$row['utp_updated_by'] = $updatedBy;
			} else {
				$error = 'Could not save. Please try again.';
			}
		}
	}
}

if (!isset($row['utp_access']) || $row['utp_access'] === '') {
	$row['utp_access'] = 'internal';
}
if (!isset($row['utp_status']) || $row['utp_status'] === '') {
	$row['utp_status'] = 'draft';
}
if (!isset($row['utp_department'])) {
	$row['utp_department'] = '';
}
if (!isset($row['utp_ai_ready'])) {
	$row['utp_ai_ready'] = 0;
}
if (empty($row['utp_source'])) {
	$row['utp_source'] = 'Business Documents';
}
if (empty($row['created_by_name'])) {
	$row['created_by_name'] = '—';
}
if (!isset($row['utp_updated_by']) || $row['utp_updated_by'] === '') {
	$row['utp_updated_by'] = '—';
}
$updatedAt = !empty($row['utp_updated_at']) ? $row['utp_updated_at'] : (isset($row['utp_created_at']) ? $row['utp_created_at'] : '');
$row['updated_display'] = $updatedAt !== '' ? date('d/m/Y g:i a', strtotime($updatedAt)) : '—';

$sourceName = isset($row['utp_source']) ? trim((string)$row['utp_source']) : '';
$fwViewData['is_registry'] = ($sourceName !== '' && $sourceName !== 'Business Documents');

if (function_exists('gcons_bd_audit_ensure_schema')) {
	gcons_bd_audit_ensure_schema();
}

$keepBlank = !empty($_SESSION['gcons_keep_blank_utp'][$utp_id]);
if (
	!$keepBlank
	&& (empty($row['utp_source']) || $row['utp_source'] === 'Business Documents')
	&& function_exists('gcons_document_html_is_blank')
	&& gcons_document_html_is_blank(isset($row['utp_html']) ? $row['utp_html'] : '')
	&& function_exists('gcons_document_template_html')
) {
	$filled = gcons_document_template_html('task-procedure', isset($row['utp_name']) ? $row['utp_name'] : '');
	if ($filled !== '') {
		$row['utp_html'] = $filled;
		if (empty($submit) && isset($TABLE)) {
			$fillTable = new Fw_Db_Table($TABLE);
			$fillTable->setWhere('utp_id = ' . (int)$utp_id);
			$fillTable->updateRow(array(
				'utp_html' => $filled,
				'utp_updated_at' => date('Y-m-d H:i:s'),
			));
		}
	}
}

$fwViewData['detail'] = $row;
$fwViewData['live_url'] = url_table_live_url($row['utt_slug'], $row['utp_slug']);
$fwViewData['msg'] = $msg;
$fwViewData['error'] = $error;

$mergeValues = array();
if (function_exists('gcons_merge_field_values')) {
	$mergeValues = gcons_merge_field_values(array(
		'documentName' => isset($row['utp_name']) ? $row['utp_name'] : '',
		'staffName' => isset($row['created_by_name']) ? $row['created_by_name'] : '',
		'department' => isset($row['utp_department']) ? $row['utp_department'] : '',
	));
}
$fwViewData['merge_field_values_json'] = json_encode($mergeValues);
$fwViewData['page_templates_json'] = function_exists('gcons_document_template_ckeditor_definitions')
	? json_encode(gcons_document_template_ckeditor_definitions())
	: '[]';
