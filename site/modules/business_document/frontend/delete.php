<?php
/*
 * URL Table - soft-delete a URL record (recycle bin), with full audit trail.
 * JS redirect (not header Location) so Fancybox loader does not stay stuck in the popup.
 */

$utp_id = (int)$fwRequest->getParam('utp_id', 0);
$purge = (int)$fwRequest->getParam('purge', 0);
$restore = (int)$fwRequest->getParam('restore', 0);

if ($utp_id > 0) {
	if (function_exists('gcons_bd_audit_ensure_schema')) {
		gcons_bd_audit_ensure_schema();
	}

	$row = $fwDb->queryOne(
		"SELECT * FROM url_table_pages WHERE utp_id = " . $utp_id
	);
	$source = (!empty($row['utp_source'])) ? trim((string)$row['utp_source']) : '';
	$path = (!empty($row['utp_path'])) ? (string)$row['utp_path'] : '';
	$isProcedure = ($source === 'AI Repository' || stripos($path, '/ai_procedure/') !== false);

	if (empty($row['utp_id'])) {
		$_SESSION['business_document_flash'] = array(
			'msg' => 'Document not found (it may already have been removed).',
			'live_url' => '',
			'path' => '',
		);
	} elseif ($isProcedure) {
		$_SESSION['business_document_flash'] = array(
			'msg' => 'AI procedures are not permanently deleted from this list. Turn the live page off in AI Repository instead (that keeps the procedure).',
			'live_url' => '',
			'path' => '',
		);
	} elseif ($restore) {
		$fwDb->execute(
			"UPDATE url_table_pages
			 SET utp_deleted_at = NULL,
			     utp_deleted_by = NULL,
			     utp_updated_at = '" . date('Y-m-d H:i:s') . "',
			     utp_updated_by = '" . addslashes(function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '') . "'
			 WHERE utp_id = " . $utp_id
		);
		if (function_exists('gcons_bd_audit_log')) {
			gcons_bd_audit_log(array(
				'utp_id' => $utp_id,
				'actor' => 'human',
				'source' => 'restore',
				'html_before' => isset($row['utp_html']) ? $row['utp_html'] : '',
				'html_after' => isset($row['utp_html']) ? $row['utp_html'] : '',
				'name_before' => isset($row['utp_name']) ? $row['utp_name'] : '',
				'name_after' => isset($row['utp_name']) ? $row['utp_name'] : '',
				'store_html_before' => false,
			));
		}
		$_SESSION['business_document_flash'] = array(
			'msg' => 'Document restored from the recycle bin.',
			'live_url' => '',
			'path' => '',
		);
	} elseif ($purge) {
		/* Permanent delete only from recycle bin, after soft-delete. */
		if (empty($row['utp_deleted_at'])) {
			$_SESSION['business_document_flash'] = array(
				'msg' => 'Move the document to the recycle bin before permanently deleting it.',
				'live_url' => '',
				'path' => '',
			);
		} else {
			if (function_exists('gcons_bd_audit_log')) {
				gcons_bd_audit_log(array(
					'utp_id' => $utp_id,
					'actor' => 'human',
					'source' => 'purge',
					'html_before' => isset($row['utp_html']) ? $row['utp_html'] : '',
					'html_after' => '',
					'name_before' => isset($row['utp_name']) ? $row['utp_name'] : '',
					'name_after' => '',
					'store_html_before' => true,
				));
			}
			$pagesTable = new Fw_Db_Table($TABLE);
			$pagesTable->setWhere('utp_id = ' . $utp_id);
			$pagesTable->deleteRow();
			$_SESSION['business_document_flash'] = array(
				'msg' => 'Document permanently deleted. A content snapshot was kept in history.',
				'live_url' => '',
				'path' => '',
			);
		}
	} else {
		/* Soft delete → recycle bin */
		$deletedBy = function_exists('gcons_bd_updated_by_label') ? gcons_bd_updated_by_label('human') : '';
		if (function_exists('gcons_bd_audit_log')) {
			gcons_bd_audit_log(array(
				'utp_id' => $utp_id,
				'actor' => 'human',
				'actor_label' => $deletedBy,
				'source' => 'delete',
				'html_before' => isset($row['utp_html']) ? $row['utp_html'] : '',
				'html_after' => '',
				'name_before' => isset($row['utp_name']) ? $row['utp_name'] : '',
				'name_after' => isset($row['utp_name']) ? $row['utp_name'] : '',
				'store_html_before' => true,
			));
		}
		$pagesTable = new Fw_Db_Table($TABLE);
		$pagesTable->setWhere('utp_id = ' . $utp_id);
		$pagesTable->updateRow(array(
			'utp_deleted_at' => date('Y-m-d H:i:s'),
			'utp_deleted_by' => $deletedBy,
			'utp_updated_at' => date('Y-m-d H:i:s'),
			'utp_updated_by' => $deletedBy,
		));
		$_SESSION['business_document_flash'] = array(
			'msg' => 'Document moved to the recycle bin. You can restore it from Recycle bin.',
			'live_url' => '',
			'path' => '',
		);
	}
}

$redirect = BASE_URL . 'business_document.home';
if ($restore || $purge) {
	$redirect .= '?filter_trash=1';
}
echo '<!DOCTYPE html><html><head><meta charset="utf-8" />';
echo '<script type="text/javascript">window.location.replace(' . json_encode($redirect) . ');</script>';
echo '</head><body></body></html>';
exit;
