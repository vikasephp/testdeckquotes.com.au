<?php
/*
 * URL Table / Business Documents - main screen
 * Create New Document + Central URL Table list (screenshot layout, no sidebar yet).
 */

$fwMainView = 'file:' . getcwd() . '/home.tpl';
$fwViewData['title'] = 'Business Documents';

/*
 * ===== EZ1-T282 / GCONS menu auto-sync (START) =====
 * When this screen opens, add any new default.tpl menu URLs to the Central URL Table.
 * Only scans if the menu file changed. Safe to remove between START and END.
 */
if (function_exists('url_table_sync_gcons_menu')) {
	url_table_sync_gcons_menu();
}
/* ===== EZ1-T282 / GCONS menu auto-sync (END) ===== */

if (function_exists('gcons_document_fill_blank_business_pages')) {
	gcons_document_fill_blank_business_pages();
}

$departments = array(
	'Contracts',
	'Client Services',
	'Construction',
	'Sales',
	'Planning',
	'Administration',
);
$fwViewData['departments'] = $departments;

/* Load active URL types for the dropdown */
$typesTable = new Fw_Db_Table($TYPE_TABLE);
$typesTable->setWhere('utt_status = 1');
$typesTable->setOrderBy('utt_name ASC');
$types = $typesTable->getAllRows();
if (!is_array($types)) {
	$types = array();
}
$fwViewData['types'] = $types;

$typeMap = array();
foreach ($types as $t) {
	$typeMap[(int)$t['utt_id']] = $t;
}
$fwViewData['typeMap'] = $typeMap;

$ajax = $fwRequest->getParam('ajax', '');
if ($ajax === '' && isset($_GET['ajax'])) {
	$ajax = $_GET['ajax'];
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
		$row = $fwDb->queryOne("SELECT utp_id, utp_source FROM url_table_pages WHERE utp_id = " . $histId);
		$source = isset($row['utp_source']) ? trim((string)$row['utp_source']) : '';
		if (empty($row['utp_id']) || ($source !== '' && $source !== 'Business Documents')) {
			echo json_encode(array('ok' => false, 'items' => array(), 'page' => 1, 'pages' => 1, 'total' => 0));
			exit;
		}
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
if ($ajax === 'restore_history') {
	header('Content-Type: application/json; charset=utf-8');
	if (empty($_SESSION['user']['user_id'])) {
		echo json_encode(array('ok' => false, 'message' => 'Please sign in'));
		exit;
	}
	$utaId = (int)$fwRequest->getParam('uta_id', 0);
	$utpId = (int)$fwRequest->getParam('utp_id', 0);
	if ($utaId <= 0 || $utpId <= 0 || !function_exists('gcons_bd_history_get')) {
		echo json_encode(array('ok' => false, 'message' => 'Invalid restore request'));
		exit;
	}
	$hist = gcons_bd_history_get($utaId);
	if (!$hist || (int)$hist['utp_id'] !== $utpId) {
		echo json_encode(array('ok' => false, 'message' => 'History row not found'));
		exit;
	}
	if (!empty($hist['uta_truncated']) || $hist['uta_html_before'] === null || $hist['uta_html_before'] === '') {
		echo json_encode(array('ok' => false, 'message' => 'This history row has no saved content to restore'));
		exit;
	}
	$pageRow = $fwDb->queryOne(
		"SELECT utp_id, utp_source, utp_name, utp_html, utp_deleted_at FROM url_table_pages WHERE utp_id = " . $utpId
	);
	$source = isset($pageRow['utp_source']) ? trim((string)$pageRow['utp_source']) : '';
	if (empty($pageRow['utp_id']) || ($source !== '' && $source !== 'Business Documents')) {
		echo json_encode(array('ok' => false, 'message' => 'Document not found'));
		exit;
	}
	if (!empty($pageRow['utp_deleted_at'])) {
		echo json_encode(array('ok' => false, 'message' => 'Restore the document from Recycle bin first'));
		exit;
	}
	$restoreHtml = (string)$hist['uta_html_before'];
	$restoreName = isset($hist['uta_name_before']) ? trim((string)$hist['uta_name_before']) : '';
	$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
	$update = array(
		'utp_html' => $restoreHtml,
		'utp_updated_at' => date('Y-m-d H:i:s'),
		'utp_updated_by' => $updatedBy,
	);
	if ($restoreName !== '') {
		$update['utp_name'] = $restoreName;
	}
	$pagesTable = new Fw_Db_Table(isset($TABLE) ? $TABLE : 'url_table_pages');
	$pagesTable->setWhere('utp_id = ' . $utpId);
	$ok = $pagesTable->updateRow($update);
	if (!empty($ok) && function_exists('gcons_bd_audit_log')) {
		gcons_bd_audit_log(array(
			'utp_id' => $utpId,
			'actor' => 'human',
			'actor_label' => $updatedBy,
			'source' => 'restore',
			'html_before' => isset($pageRow['utp_html']) ? $pageRow['utp_html'] : '',
			'html_after' => $restoreHtml,
			'name_before' => isset($pageRow['utp_name']) ? $pageRow['utp_name'] : '',
			'name_after' => $restoreName !== '' ? $restoreName : (isset($pageRow['utp_name']) ? $pageRow['utp_name'] : ''),
			'store_html_before' => true,
		));
	}
	echo json_encode(array(
		'ok' => !empty($ok),
		'message' => !empty($ok) ? 'Document content restored from history.' : 'Restore failed.',
		'edit_url' => BASE_URL . 'business_document.edit/utp_id/' . $utpId,
	));
	exit;
}
if ($ajax === 'autosave') {
	header('Content-Type: application/json; charset=utf-8');
	if (empty($_SESSION['user']['user_id'])) {
		echo json_encode(array('ok' => false));
		exit;
	}
	$type_id = (int)$fwRequest->getParam('url_type_id', 0);
	$name = trim($fwRequest->getParam('url_name', ''));
	$html = $fwRequest->getParam('url_html', '');
	$access = trim($fwRequest->getParam('url_access', 'internal'));
	$status = trim($fwRequest->getParam('url_status', 'draft'));
	$department = trim($fwRequest->getParam('url_department', ''));
	$ai_ready = (int)$fwRequest->getParam('url_ai_ready', 0) ? 1 : 0;
	$template_key = trim($fwRequest->getParam('url_template', ''));
	$saveId = (int)$fwRequest->getParam('autosave_utp_id', 0);
	$seq = (int)$fwRequest->getParam('autosave_seq', 0);
	if (!isset($_SESSION['gcons_autosave_seq']) || !is_array($_SESSION['gcons_autosave_seq'])) {
		$_SESSION['gcons_autosave_seq'] = array();
	}
	$seqKey = $saveId > 0 ? ('id-' . $saveId) : 'new';
	$lastSeq = isset($_SESSION['gcons_autosave_seq'][$seqKey]) ? (int)$_SESSION['gcons_autosave_seq'][$seqKey] : 0;
	if ($seq > 1000000000000 && $lastSeq > 1000000000000 && $seq <= $lastSeq) {
		echo json_encode(array('ok' => true, 'ignored' => 1, 'utp_id' => $saveId));
		exit;
	}
	if (function_exists('session_write_close')) {
		session_write_close();
	}
	@ini_set('memory_limit', '512M');
	@set_time_limit(300);
	$contentLen = isset($_SERVER['CONTENT_LENGTH']) ? (int)$_SERVER['CONTENT_LENGTH'] : 0;
	if ($html === '' && $contentLen > 100000) {
		echo json_encode(array('ok' => false));
		exit;
	}
	if ($access !== 'public') {
		$access = 'internal';
	}
	if ($status !== 'live') {
		$status = 'draft';
	}
	if ($type_id <= 0 || !isset($typeMap[$type_id]) || $name === '') {
		echo json_encode(array('ok' => false, 'skip' => true));
		exit;
	}
	$name_slug = url_table_slug($name);
	if ($name_slug === '') {
		echo json_encode(array('ok' => false, 'skip' => true));
		exit;
	}
	$type_slug = $typeMap[$type_id]['utt_slug'];
	$path = url_table_path($type_slug, $name_slug);
	$pagesTableName = isset($TABLE) ? $TABLE : 'url_table_pages';

	if ($saveId <= 0) {
		$check = $fwDb->queryOne(
			"SELECT utp_id, utp_source FROM url_table_pages WHERE utp_type_id = " . (int)$type_id . " AND utp_slug = '" . addslashes($name_slug) . "'"
		);
		if (!empty($check['utp_id'])) {
			$checkSource = isset($check['utp_source']) ? trim((string)$check['utp_source']) : '';
			if ($checkSource === '' || $checkSource === 'Business Documents') {
				$saveId = (int)$check['utp_id'];
				$seqKey = 'id-' . $saveId;
			} else {
				echo json_encode(array('ok' => false));
				exit;
			}
		}
	}

	// New via autosave: skip empty stubs (LastPass fills name/type, then Back leaves orphans).
	// Create only once there is body content or an explicit template choice.
	if ($saveId <= 0) {
		$htmlIsBlank = function_exists('gcons_document_html_is_blank')
			? gcons_document_html_is_blank($html)
			: (trim(preg_replace('/\s+/', ' ', strip_tags((string)$html))) === '');
		if ($htmlIsBlank && $template_key === '') {
			echo json_encode(array('ok' => true, 'deferred' => 1));
			exit;
		}
	}

	if ($saveId > 0) {
		$saveRow = $fwDb->queryOne(
			"SELECT utp_id, utp_source, utp_name, utp_html, utp_deleted_at FROM url_table_pages WHERE utp_id = " . $saveId
		);
		if (empty($saveRow['utp_id'])) {
			echo json_encode(array('ok' => false));
			exit;
		}
		if (!empty($saveRow['utp_deleted_at'])) {
			echo json_encode(array('ok' => false, 'message' => 'Document is in the recycle bin'));
			exit;
		}
		$saveSource = isset($saveRow['utp_source']) ? trim((string)$saveRow['utp_source']) : '';
		if ($saveSource !== '' && $saveSource !== 'Business Documents') {
			echo json_encode(array('ok' => false));
			exit;
		}
		$dup = $fwDb->queryOne(
			"SELECT utp_id FROM url_table_pages
			 WHERE utp_type_id = " . (int)$type_id . "
			   AND utp_slug = '" . addslashes($name_slug) . "'
			   AND utp_id <> " . $saveId . "
			   AND (utp_deleted_at IS NULL OR utp_deleted_at = '0000-00-00 00:00:00')"
		);
		if (!empty($dup['utp_id'])) {
			echo json_encode(array('ok' => false));
			exit;
		}
		$lastSeq = isset($_SESSION['gcons_autosave_seq'][$seqKey]) ? (int)$_SESSION['gcons_autosave_seq'][$seqKey] : 0;
		if ($seq > 1000000000000 && $lastSeq > 1000000000000 && $seq <= $lastSeq) {
			echo json_encode(array('ok' => true, 'ignored' => 1, 'utp_id' => $saveId));
			exit;
		}
		if (function_exists('gcons_prepare_document_html')) {
			$html = gcons_prepare_document_html($html, $saveId);
		} elseif (function_exists('gcons_sanitize_document_html')) {
			$html = gcons_sanitize_document_html($html);
		}
		if (function_exists('gcons_bd_audit_ensure_schema')) {
			gcons_bd_audit_ensure_schema();
		}
		$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
		$htmlBefore = isset($saveRow['utp_html']) ? (string)$saveRow['utp_html'] : '';
		$pagesTable = new Fw_Db_Table($pagesTableName);
		$pagesTable->setWhere('utp_id = ' . $saveId);
		$ok = $pagesTable->updateRow(array(
			'utp_type_id' => $type_id,
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
				'html_before' => $htmlBefore,
				'html_after' => $html,
				'name_before' => isset($saveRow['utp_name']) ? $saveRow['utp_name'] : '',
				'name_after' => $name,
				'store_html_before' => true,
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
		echo json_encode(array('ok' => !empty($ok), 'utp_id' => $saveId));
		exit;
	}

	if (function_exists('gcons_prepare_document_html')) {
		$html = gcons_prepare_document_html($html, 0);
	}
	if (function_exists('gcons_document_html_is_blank') && gcons_document_html_is_blank($html) && $template_key !== 'blank') {
		$apply_key = $template_key;
		if ($apply_key === '' && function_exists('gcons_document_template_key_for_type')) {
			$apply_key = gcons_document_template_key_for_type(
				isset($typeMap[$type_id]['utt_name']) ? $typeMap[$type_id]['utt_name'] : '',
				$type_slug
			);
		}
		if ($apply_key !== '' && function_exists('gcons_document_template_html')) {
			$html = gcons_document_template_html($apply_key, $name);
		}
	}
	$newId = url_table_register(array(
		'name' => $name,
		'type_name' => isset($typeMap[$type_id]['utt_name']) ? $typeMap[$type_id]['utt_name'] : 'Document',
		'type_slug' => $type_slug,
		'slug' => $name_slug,
		'path' => $path,
		'html' => $html,
		'access' => $access,
		'status' => $status,
		'department' => $department,
		'ai_ready' => $ai_ready,
		'source' => 'Business Documents',
		'created_by' => isset($_SESSION['user']['user_id']) ? (int)$_SESSION['user']['user_id'] : 0,
	));
	if ($newId > 0 && function_exists('gcons_bd_audit_log')) {
		gcons_bd_audit_log(array(
			'utp_id' => $newId,
			'actor' => 'human',
			'source' => 'create',
			'html_before' => '',
			'html_after' => $html,
			'name_before' => '',
			'name_after' => $name,
			'store_html_before' => false,
		));
	}
	if ($newId > 0 && $template_key === 'blank') {
		if (function_exists('session_status') && session_status() !== PHP_SESSION_ACTIVE) {
			@session_start();
		}
		if (!isset($_SESSION['gcons_keep_blank_utp']) || !is_array($_SESSION['gcons_keep_blank_utp'])) {
			$_SESSION['gcons_keep_blank_utp'] = array();
		}
		$_SESSION['gcons_keep_blank_utp'][$newId] = 1;
	}
	if ($newId > 0 && $seq > 0) {
		if (function_exists('session_status') && session_status() !== PHP_SESSION_ACTIVE) {
			@session_start();
		}
		if (!isset($_SESSION['gcons_autosave_seq']) || !is_array($_SESSION['gcons_autosave_seq'])) {
			$_SESSION['gcons_autosave_seq'] = array();
		}
		$_SESSION['gcons_autosave_seq'][$seqKey] = $seq;
		$_SESSION['gcons_autosave_seq']['id-' . $newId] = $seq;
	}
		echo json_encode(array('ok' => ($newId > 0), 'utp_id' => (int)$newId));
		exit;
}

$msg = '';
$error = '';

$form_type_id = '';
$form_name = '';
$form_html = '';
$form_access = 'internal';
$form_status = 'draft';
$form_department = '';
$form_ai_ready = 0;
$form_template = '';
$show_create = (int)$fwRequest->getParam('show_create', 0);

/* ---------- Handle "Create New URL / Document" submit ---------- */
$submit = $fwRequest->getParam('subCreateUrl', '');
if (!empty($submit)) {
	$show_create = 1;
	$type_id = (int)$fwRequest->getParam('url_type_id', 0);
	$name = trim($fwRequest->getParam('url_name', ''));
	$html = $fwRequest->getParam('url_html', '');
	$access = trim($fwRequest->getParam('url_access', 'internal'));
	$status = trim($fwRequest->getParam('url_status', 'draft'));
	$department = trim($fwRequest->getParam('url_department', ''));
	$ai_ready = (int)$fwRequest->getParam('url_ai_ready', 0) ? 1 : 0;
	$template_key = trim($fwRequest->getParam('url_template', ''));
	$autosaveId = (int)$fwRequest->getParam('autosave_utp_id', 0);

	if ($access !== 'public') {
		$access = 'internal';
	}
	if ($status !== 'live') {
		$status = 'draft';
	}

	$form_type_id = $type_id;
	$form_name = $name;
	$form_html = $html;
	$form_access = $access;
	$form_status = $status;
	$form_department = $department;
	$form_ai_ready = $ai_ready;
	$form_template = $template_key;

	if ($type_id <= 0 || !isset($typeMap[$type_id])) {
		$error = 'Please select a Document Type.';
	} elseif ($name === '') {
		$error = 'Please enter a Document Name.';
	} else {
		$type_slug = $typeMap[$type_id]['utt_slug'];
		$name_slug = url_table_slug($name);

		if ($name_slug === '') {
			$error = 'Name must contain at least one letter or number.';
		} else {
			$path = url_table_path($type_slug, $name_slug);

			$dupSql = "SELECT utp_id FROM url_table_pages WHERE utp_type_id = " . (int)$type_id . " AND utp_slug = '" . addslashes($name_slug) . "'";
			if ($autosaveId > 0) {
				$dupSql .= " AND utp_id <> " . $autosaveId;
			}
			$check = $fwDb->queryOne($dupSql);

			if (!empty($check['utp_id'])) {
				$error = 'A document already exists for this Type and Name: ' . $path;
			} elseif ($autosaveId > 0) {
				$own = $fwDb->queryOne(
					"SELECT utp_id, utp_source, utp_name, utp_html FROM url_table_pages WHERE utp_id = " . $autosaveId
				);
				$ownSource = isset($own['utp_source']) ? trim((string)$own['utp_source']) : '';
				if (empty($own['utp_id']) || ($ownSource !== '' && $ownSource !== 'Business Documents')) {
					$error = 'Could not save the document. Please try again. If this fails after adding fields, run the SQL alter script first.';
				} else {
					if (function_exists('gcons_sanitize_document_html')) {
						$html = gcons_sanitize_document_html($html);
					}
					if (function_exists('gcons_prepare_document_html')) {
						$html = gcons_prepare_document_html($html, $autosaveId);
					}
					if (function_exists('gcons_bd_audit_ensure_schema')) {
						gcons_bd_audit_ensure_schema();
					}
					$updatedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
					$pagesTableName = isset($TABLE) ? $TABLE : 'url_table_pages';
					$pagesTable = new Fw_Db_Table($pagesTableName);
					$pagesTable->setWhere('utp_id = ' . $autosaveId);
					$ok = $pagesTable->updateRow(array(
						'utp_type_id' => $type_id,
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
					if ($ok) {
						if (function_exists('gcons_bd_audit_log')) {
							gcons_bd_audit_log(array(
								'utp_id' => $autosaveId,
								'actor' => 'human',
								'actor_label' => $updatedBy,
								'source' => 'save',
								'html_before' => isset($own['utp_html']) ? $own['utp_html'] : '',
								'html_after' => $html,
								'name_before' => isset($own['utp_name']) ? $own['utp_name'] : '',
								'name_after' => $name,
								'store_html_before' => true,
							));
						}
						$_SESSION['business_document_flash'] = array(
							'msg' => 'Document created successfully: ' . $path,
							'live_url' => rtrim(BASE_URL, '/') . '/business_document/' . rawurlencode($type_slug) . '/' . rawurlencode($name_slug),
							'path' => $path,
						);
						$redirect = BASE_URL . 'business_document.home';
						if (!headers_sent()) {
							header('Location: ' . $redirect);
						} else {
							echo '<script type="text/javascript">window.location.href="' . $redirect . '";</script>';
						}
						exit;
					}
					$error = 'Could not save the document. Please try again. If this fails after adding fields, run the SQL alter script first.';
				}
			} else {
				if (function_exists('gcons_prepare_document_html')) {
					$html = gcons_prepare_document_html($html, 0);
				}
				if (function_exists('gcons_document_html_is_blank') && gcons_document_html_is_blank($html) && $template_key !== 'blank') {
					$apply_key = $template_key;
					if ($apply_key === '' && function_exists('gcons_document_template_key_for_type')) {
						$apply_key = gcons_document_template_key_for_type(
							isset($typeMap[$type_id]['utt_name']) ? $typeMap[$type_id]['utt_name'] : '',
							$type_slug
						);
					}
					if ($apply_key !== '' && function_exists('gcons_document_template_html')) {
						$html = gcons_document_template_html($apply_key, $name);
					}
				}

				$newId = url_table_register(array(
					'name' => $name,
					'type_name' => isset($typeMap[$type_id]['utt_name']) ? $typeMap[$type_id]['utt_name'] : 'Document',
					'type_slug' => $type_slug,
					'slug' => $name_slug,
					'path' => $path,
					'html' => $html,
					'access' => $access,
					'status' => $status,
					'department' => $department,
					'ai_ready' => $ai_ready,
					'source' => 'Business Documents',
					'created_by' => isset($_SESSION['user']['user_id']) ? (int)$_SESSION['user']['user_id'] : 0,
				));

				if ($newId > 0) {
					if (function_exists('gcons_bd_audit_log')) {
						gcons_bd_audit_log(array(
							'utp_id' => $newId,
							'actor' => 'human',
							'source' => 'create',
							'html_before' => '',
							'html_after' => $html,
							'name_before' => '',
							'name_after' => $name,
							'store_html_before' => false,
						));
					}
					if ($template_key === 'blank') {
						if (!isset($_SESSION['gcons_keep_blank_utp']) || !is_array($_SESSION['gcons_keep_blank_utp'])) {
							$_SESSION['gcons_keep_blank_utp'] = array();
						}
						$_SESSION['gcons_keep_blank_utp'][$newId] = 1;
					}
					$_SESSION['business_document_flash'] = array(
						'msg' => 'Document created successfully: ' . $path,
						'live_url' => rtrim(BASE_URL, '/') . '/business_document/' . rawurlencode($type_slug) . '/' . rawurlencode($name_slug),
						'path' => $path,
					);
					$redirect = BASE_URL . 'business_document.home';
					if (!headers_sent()) {
						header('Location: ' . $redirect);
					} else {
						echo '<script type="text/javascript">window.location.href="' . $redirect . '";</script>';
					}
					exit;
				}

				$error = 'Could not save the document. Please try again. If this fails after adding fields, run the SQL alter script first.';
			}
		}
	}
}

if (!empty($_SESSION['business_document_flash'])) {
	$flash = $_SESSION['business_document_flash'];
	unset($_SESSION['business_document_flash']);
	$msg = $flash['msg'];
	$fwViewData['created_live_url'] = $flash['live_url'];
	$fwViewData['created_path'] = $flash['path'];
}

$fwViewData['form_type_id'] = $form_type_id;
$fwViewData['form_name'] = $form_name;
$fwViewData['form_html'] = $form_html;
$fwViewData['form_access'] = $form_access;
$fwViewData['form_status'] = $form_status;
$fwViewData['form_department'] = $form_department;
$fwViewData['form_ai_ready'] = $form_ai_ready;
$fwViewData['form_template'] = $form_template;
$fwViewData['show_create'] = $show_create;
$fwViewData['page_templates'] = function_exists('gcons_document_template_list') ? gcons_document_template_list() : array();
$fwViewData['page_templates_json'] = function_exists('gcons_document_template_ckeditor_definitions')
	? json_encode(gcons_document_template_ckeditor_definitions())
	: '[]';

/* ---------- Filters + search ---------- */
$search = trim($fwRequest->getParam('search_urls', ''));
$filter_type = (int)$fwRequest->getParam('filter_type', 0);
$filter_department = trim($fwRequest->getParam('filter_department', ''));
$filter_status = trim($fwRequest->getParam('filter_status', ''));
$filter_access = trim($fwRequest->getParam('filter_access', ''));
$filter_source = trim($fwRequest->getParam('filter_source', ''));
$filter_trash = (int)$fwRequest->getParam('filter_trash', 0) ? 1 : 0;
if (!in_array($filter_source, array('html', 'ai', 'email', 'menu'), true)) {
	$filter_source = '';
}

if (function_exists('gcons_bd_audit_ensure_schema')) {
	gcons_bd_audit_ensure_schema();
}

$fwViewData['search_urls'] = $search;
$fwViewData['filter_type'] = $filter_type;
$fwViewData['filter_department'] = $filter_department;
$fwViewData['filter_status'] = $filter_status;
$fwViewData['filter_access'] = $filter_access;
$fwViewData['filter_source'] = $filter_source;
$fwViewData['filter_trash'] = $filter_trash;

$where = '1=1';
if ($filter_trash) {
	$where .= " AND p.utp_deleted_at IS NOT NULL AND p.utp_deleted_at <> '0000-00-00 00:00:00'";
} else {
	$where .= " AND (p.utp_deleted_at IS NULL OR p.utp_deleted_at = '0000-00-00 00:00:00')";
}
if ($search !== '') {
	$safe = addslashes($search);
	$where .= " AND (p.utp_name LIKE '%{$safe}%' OR p.utp_path LIKE '%{$safe}%' OR p.utp_slug LIKE '%{$safe}%' OR p.utp_department LIKE '%{$safe}%'";
	if (strlen($search) >= 2) {
		$where .= " OR p.utp_html LIKE '%{$safe}%'";
	}
	$where .= ')';
}
if ($filter_type > 0) {
	$where .= ' AND p.utp_type_id = ' . (int)$filter_type;
}
if ($filter_department !== '') {
	$where .= " AND p.utp_department = '" . addslashes($filter_department) . "'";
}
if ($filter_status === 'live' || $filter_status === 'draft') {
	$where .= " AND p.utp_status = '" . addslashes($filter_status) . "'";
}
if ($filter_access === 'internal' || $filter_access === 'public') {
	$where .= " AND p.utp_access = '" . addslashes($filter_access) . "'";
}
if ($filter_source === 'html') {
	$where .= " AND (p.utp_source = 'Business Documents' OR p.utp_source = '' OR p.utp_source IS NULL)";
} elseif ($filter_source === 'ai') {
	$where .= " AND p.utp_source = 'AI Repository'";
} elseif ($filter_source === 'email') {
	$where .= " AND p.utp_source = 'Email Library'";
} elseif ($filter_source === 'menu') {
	$where .= " AND p.utp_source = 'GCONS Menu'";
}

/* Sort (Last Updated column) */
$sort_by = trim($fwRequest->getParam('sort_by', 'updated'));
$sort_dir = strtolower(trim($fwRequest->getParam('sort_dir', 'desc')));
if ($sort_dir !== 'asc') {
	$sort_dir = 'desc';
}
if ($sort_by !== 'updated') {
	$sort_by = 'updated';
}
$fwViewData['sort_by'] = $sort_by;
$fwViewData['sort_dir'] = $sort_dir;
$fwViewData['sort_dir_next'] = ($sort_dir === 'desc') ? 'asc' : 'desc';

$order_sql = ($sort_dir === 'asc')
	? 'ORDER BY p.utp_updated_at ASC, p.utp_id ASC'
	: 'ORDER BY p.utp_updated_at DESC, p.utp_id DESC';

/* Pagination */
$per_page = 25;
$page_num = (int)$fwRequest->getParam('pagenum', 1);
if ($page_num < 1) {
	$page_num = 1;
}

$countRow = $fwDb->queryOne(
	"SELECT COUNT(*) AS cnt
	 FROM url_table_pages p
	 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
	 WHERE {$where}"
);
$total_count = !empty($countRow['cnt']) ? (int)$countRow['cnt'] : 0;
$total_pages = max(1, (int)ceil($total_count / $per_page));
if ($page_num > $total_pages) {
	$page_num = $total_pages;
}
$offset = ($page_num - 1) * $per_page;

$sql = "SELECT p.*, t.utt_name, t.utt_slug, u.user_name AS created_by_name
	FROM url_table_pages p
	LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
	LEFT JOIN users u ON u.user_id = p.utp_created_by
	WHERE {$where}
	{$order_sql}
	LIMIT " . (int)$offset . ", " . (int)$per_page;

$pages = $fwDb->query($sql);
if (!is_array($pages)) {
	$pages = array();
}

foreach ($pages as $k => $row) {
	$type_slug = !empty($row['utt_slug']) ? $row['utt_slug'] : 'document';
	/* Live URL: Business Documents hosted path, or original GCONS URL for imports */
	$pages[$k]['live_url'] = url_table_row_live_url($row);
	$pages[$k]['access_label'] = (!empty($row['utp_access']) && $row['utp_access'] === 'public') ? 'Public' : 'Internal';
	$pages[$k]['status_label'] = (!empty($row['utp_status']) && $row['utp_status'] === 'live') ? 'Live' : 'Draft';
	$pages[$k]['ai_ready'] = !empty($row['utp_ai_ready']) ? 1 : 0;
	$pages[$k]['source_label'] = !empty($row['utp_source']) ? $row['utp_source'] : 'Business Documents';
	$pages[$k]['created_by_label'] = !empty($row['created_by_name']) ? $row['created_by_name'] : '—';
	$pages[$k]['updated_by_label'] = (!empty($row['utp_updated_by'])) ? $row['utp_updated_by'] : '';
	/* Registry rows = auto-imported / other modules — content is not edited here */
	$pages[$k]['is_registry'] = ($pages[$k]['source_label'] !== 'Business Documents') ? 1 : 0;
	$updated = !empty($row['utp_updated_at']) ? $row['utp_updated_at'] : (isset($row['utp_created_at']) ? $row['utp_created_at'] : '');
	$pages[$k]['updated_display'] = $updated !== '' ? date('d/m/Y g:i a', strtotime($updated)) : '';

	/* Soft colour accents for type chips (matches mockup variety) */
	$slugKey = strtolower($type_slug . ' ' . (isset($row['utt_name']) ? $row['utt_name'] : ''));
	if (strpos($slugKey, 'procedure') !== false) {
		$pages[$k]['type_tone'] = 'blue';
		$pages[$k]['type_icon'] = 'procedure';
	} elseif (strpos($slugKey, 'action') !== false || strpos($slugKey, 'plan') !== false) {
		$pages[$k]['type_tone'] = 'orange';
		$pages[$k]['type_icon'] = 'action';
	} elseif (strpos($slugKey, 'template') !== false) {
		$pages[$k]['type_tone'] = 'violet';
		$pages[$k]['type_icon'] = 'template';
	} elseif (strpos($slugKey, 'document') !== false) {
		$pages[$k]['type_tone'] = 'blue';
		$pages[$k]['type_icon'] = 'procedure';
	} else {
		$pages[$k]['type_tone'] = 'slate';
		$pages[$k]['type_icon'] = 'document';
	}
}

/* Summary cards (overall, not only filtered page) */
$summary = array(
	'total' => 0,
	'live' => 0,
	'draft' => 0,
	'types' => count($types),
	'last30' => 0,
);
$sumRows = $fwDb->query(
	"SELECT
		COUNT(*) AS total,
		SUM(CASE WHEN utp_status = 'live' THEN 1 ELSE 0 END) AS live_cnt,
		SUM(CASE WHEN utp_status = 'draft' OR utp_status IS NULL OR utp_status = '' THEN 1 ELSE 0 END) AS draft_cnt,
		SUM(CASE WHEN utp_created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY) THEN 1 ELSE 0 END) AS last30,
		SUM(CASE WHEN utp_deleted_at IS NOT NULL AND utp_deleted_at <> '0000-00-00 00:00:00' THEN 1 ELSE 0 END) AS trash_cnt
	 FROM url_table_pages
	 WHERE (utp_deleted_at IS NULL OR utp_deleted_at = '0000-00-00 00:00:00')"
);
$trashRow = $fwDb->queryOne(
	"SELECT COUNT(*) AS trash_cnt FROM url_table_pages
	 WHERE utp_deleted_at IS NOT NULL AND utp_deleted_at <> '0000-00-00 00:00:00'"
);
if (!empty($sumRows[0])) {
	$summary['total'] = (int)$sumRows[0]['total'];
	$summary['live'] = (int)$sumRows[0]['live_cnt'];
	$summary['draft'] = (int)$sumRows[0]['draft_cnt'];
	$summary['last30'] = (int)$sumRows[0]['last30'];
}
$summary['trash'] = !empty($trashRow['trash_cnt']) ? (int)$trashRow['trash_cnt'] : 0;
$summary['total_fmt'] = number_format($summary['total']);
$summary['live_fmt'] = number_format($summary['live']);
$summary['draft_fmt'] = number_format($summary['draft']);
$summary['types_fmt'] = number_format($summary['types']);
$summary['last30_fmt'] = number_format($summary['last30']);
$summary['trash_fmt'] = number_format($summary['trash']);

$fwViewData['coverage'] = function_exists('gcons_document_coverage_report')
	? gcons_document_coverage_report()
	: array();

$fwViewData['pages'] = $pages;
$fwViewData['summary'] = $summary;
$fwViewData['page_num'] = $page_num;
$fwViewData['total_pages'] = $total_pages;
$fwViewData['total_count'] = $total_count;
$fwViewData['total_count_fmt'] = number_format($total_count);
$fwViewData['per_page'] = $per_page;
$fwViewData['showing_from'] = ($total_count === 0) ? 0 : ($offset + 1);
$fwViewData['showing_to'] = min($offset + $per_page, $total_count);
$fwViewData['msg'] = $msg;
$fwViewData['error'] = $error;

/* Pagination query string + page number window */
$pager_qs = 'search_urls=' . rawurlencode($search)
	. '&filter_type=' . (int)$filter_type
	. '&filter_department=' . rawurlencode($filter_department)
	. '&filter_status=' . rawurlencode($filter_status)
	. '&filter_access=' . rawurlencode($filter_access)
	. '&filter_source=' . rawurlencode($filter_source)
	. '&filter_trash=' . (int)$filter_trash
	. '&sort_by=' . rawurlencode($sort_by)
	. '&sort_dir=' . rawurlencode($sort_dir);
$fwViewData['pager_qs'] = $pager_qs;

$sort_qs = 'search_urls=' . rawurlencode($search)
	. '&filter_type=' . (int)$filter_type
	. '&filter_department=' . rawurlencode($filter_department)
	. '&filter_status=' . rawurlencode($filter_status)
	. '&filter_access=' . rawurlencode($filter_access)
	. '&filter_source=' . rawurlencode($filter_source)
	. '&filter_trash=' . (int)$filter_trash
	. '&sort_by=updated'
	. '&sort_dir=' . rawurlencode($fwViewData['sort_dir_next']);
$fwViewData['sort_updated_url'] = BASE_URL . 'business_document.home?' . $sort_qs;

$pager_nums = array();
if ($total_pages <= 7) {
	for ($i = 1; $i <= $total_pages; $i++) {
		$pager_nums[] = $i;
	}
} else {
	$pager_nums[] = 1;
	$start = max(2, $page_num - 1);
	$end = min($total_pages - 1, $page_num + 1);
	if ($start > 2) {
		$pager_nums[] = '...';
	}
	for ($i = $start; $i <= $end; $i++) {
		$pager_nums[] = $i;
	}
	if ($end < $total_pages - 1) {
		$pager_nums[] = '...';
	}
	$pager_nums[] = $total_pages;
}
$fwViewData['pager_nums'] = $pager_nums;
