<?php
$fwMainView = 'file:' . getcwd() . '/delay_summary.tpl';

$fwViewData['title'] = 'Delay Summary';

// Visible projects only (same as home dashboard summary).
$visibleRows = $fwDb->query("SELECT pdr_project_address FROM project_delay_register WHERE IFNULL(pdr_hide, 0) = 0");
$visibleKeys = array();
if (!empty($visibleRows) && is_array($visibleRows)) {
	foreach ($visibleRows as $vr) {
		$key = strtolower(trim((string)$vr['pdr_project_address']));
		if ($key !== '') {
			$visibleKeys[$key] = 1;
		}
	}
}

$categories = $fwDb->query("SELECT * FROM project_delay_category ORDER BY pdc_id ASC");
if (!is_array($categories)) {
	$categories = array();
}

$summaryRows = array();
foreach ($categories as $cat) {
	$letterCode = isset($cat['pdc_letter_code']) ? trim((string)$cat['pdc_letter_code']) : '';
	$projectSet = array();
	$workingDays = 0;

	if ($letterCode !== '' && !empty($visibleKeys)) {
		$sql = "SELECT tc_project, tc_days_delay
			FROM timeline_center
			WHERE TRIM(tc_letter_code) = '" . addslashes($letterCode) . "'";
		$tcRows = $fwDb->query($sql);
		if (!empty($tcRows) && is_array($tcRows)) {
			foreach ($tcRows as $tcRow) {
				$projKey = strtolower(trim((string)$tcRow['tc_project']));
				if ($projKey === '' || !isset($visibleKeys[$projKey])) {
					continue;
				}
				$projectSet[$projKey] = 1;
				$workingDays += (float)$tcRow['tc_days_delay'];
			}
		}
	}

	if (floor($workingDays) == $workingDays) {
		$workingDays = (int)$workingDays;
	}

	$summaryRows[] = array(
		'pdc_id' => (int)$cat['pdc_id'],
		'pdc_category_name' => $cat['pdc_category_name'],
		'pdc_letter_code' => $letterCode,
		'project_count' => count($projectSet),
		'working_days' => $workingDays
	);
}

$fwViewData['summary_rows'] = $summaryRows;
