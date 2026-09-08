<?php
/*
 * Business Documents — Import existing GCONS URLs into Central URL Table
 */

$fwMainView = 'file:' . getcwd() . '/import.tpl';
$fwViewData['title'] = 'Import Existing URLs';

$msg = '';
$error = '';
$imported = 0;
$skipped = 0;

$do_import = $fwRequest->getParam('subImportUrls', '');
$selected = $fwRequest->getParam('import_sel', array());

$candidates = url_table_harvest_candidates();
if (!is_array($candidates)) {
	$candidates = array();
}

if (!empty($do_import)) {
	if (!is_array($selected) || count($selected) === 0) {
		$error = 'Select at least one URL to import.';
	} else {
		foreach ($selected as $idx) {
			$idx = (int)$idx;
			if (!isset($candidates[$idx])) {
				continue;
			}
			$c = $candidates[$idx];
			if (!empty($c['already'])) {
				$skipped++;
				continue;
			}
			$id = url_table_register(array(
				'name' => $c['name'],
				'path' => $c['path'],
				'source' => $c['source'],
				'type_name' => $c['type_name'],
				'type_slug' => $c['type_slug'],
				'status' => !empty($c['status']) ? $c['status'] : 'live',
				'access' => !empty($c['access']) ? $c['access'] : 'internal',
				'html' => '',
				'slug' => url_table_slug($c['name'] . '-' . $idx),
			));
			if ($id > 0) {
				$imported++;
			} else {
				$skipped++;
			}
		}
		if ($imported > 0) {
			$msg = $imported . ' URL(s) imported into the Central URL Table.';
			if ($skipped > 0) {
				$msg .= ' ' . $skipped . ' skipped (already present or failed).';
			}
			$candidates = url_table_harvest_candidates();
		} elseif ($error === '') {
			$error = 'No new URLs were imported (selected items may already exist).';
		}
	}
}

$new_count = 0;
$exist_count = 0;
foreach ($candidates as $c) {
	if (!empty($c['already'])) {
		$exist_count++;
	} else {
		$new_count++;
	}
}

$fwViewData['candidates'] = $candidates;
$fwViewData['new_count'] = $new_count;
$fwViewData['exist_count'] = $exist_count;
$fwViewData['msg'] = $msg;
$fwViewData['error'] = $error;