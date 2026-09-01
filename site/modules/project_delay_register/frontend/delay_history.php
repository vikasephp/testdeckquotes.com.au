<?php
$fwMainView = 'file:' . getcwd() . '/delay_history.tpl';

$pdr_id = (int)$fwRequest->getParam($ID, 0);

$pdrTable = new Fw_Db_Table($TABLE);
$pdrTable->setWhere("$ID = $pdr_id");
$pdrRow = $pdrTable->getRow();

$projectAddress = !empty($pdrRow['pdr_project_address']) ? $pdrRow['pdr_project_address'] : '';
$fwViewData['pdr_id'] = $pdr_id;
$fwViewData['pdr_project_address'] = $projectAddress;
$fwViewData['title'] = 'Delay History';
$fwViewData['opr'] = '';
$fwViewData['save_msg'] = '';

// Save only category + letter code (days/dates always come live from timeline).
$save = $fwRequest->getParam('subSaveHistory', '');
if (!empty($save) && $pdr_id > 0) {
	$rows = $fwRequest->getParam('rows', array());
	if (!is_array($rows)) {
		$rows = array();
	}

	$fwDb->queryOne("DELETE FROM project_delay_history WHERE pdh_pdr_id = " . $pdr_id);

	$histTable = new Fw_Db_Table('project_delay_history');
	$seen = array();
	foreach ($rows as $row) {
		$pdcId = isset($row['pdc_id']) ? (int)$row['pdc_id'] : 0;
		$letterCode = isset($row['letter_code']) ? trim($row['letter_code']) : '';
		if ($pdcId <= 0 || $letterCode === '') {
			continue;
		}

		$dupKey = $pdcId . '|' . $letterCode;
		if (isset($seen[$dupKey])) {
			continue;
		}
		$seen[$dupKey] = 1;

		$histTable->insertRow(array(
			'pdh_pdr_id' => $pdr_id,
			'pdh_pdc_id' => $pdcId,
			'pdh_letter_code' => $letterCode
		));
	}

	$fwViewData['opr'] = 1;
	$fwViewData['save_msg'] = 'Delay history saved.';
}

// Master delay categories (shared across projects) — first = lowest pdc_id.
$categories = $fwDb->query("SELECT * FROM project_delay_category ORDER BY pdc_id ASC");
if (!is_array($categories)) {
	$categories = array();
}
$fwViewData['categories'] = $categories;

// Map for JS auto-fill: category id => letter code
$catMap = array();
foreach ($categories as $cat) {
	$catMap[(int)$cat['pdc_id']] = isset($cat['pdc_letter_code']) ? trim((string)$cat['pdc_letter_code']) : '';
}
$fwViewData['category_map_json'] = json_encode($catMap);
$fwViewData['pdr_id_js'] = (int)$pdr_id;

// Default: one row with first category (smallest pdc_id) selected.
$grouped = array();
if (!empty($categories)) {
	$cat = reset($categories);
	$pdcId = (int)$cat['pdc_id'];
	$letterCode = isset($cat['pdc_letter_code']) ? trim((string)$cat['pdc_letter_code']) : '';
	$items = array();
	if ($projectAddress !== '' && $letterCode !== '') {
		$sql = "SELECT tc_days_delay, tc_letter_email, tc_email_user
			FROM timeline_center
			WHERE LOWER(TRIM(tc_project)) = '" . addslashes(strtolower($projectAddress)) . "'
			AND TRIM(tc_letter_code) = '" . addslashes($letterCode) . "'
			ORDER BY STR_TO_DATE(NULLIF(TRIM(tc_letter_email), ''), '%d-%m-%Y') DESC, tc_id DESC";
		$tcRows = $fwDb->query($sql);
		if (!empty($tcRows) && is_array($tcRows)) {
			foreach ($tcRows as $tcRow) {
				$items[] = array(
					'days' => isset($tcRow['tc_days_delay']) ? (string)$tcRow['tc_days_delay'] : '',
					'date' => isset($tcRow['tc_letter_email']) ? (string)$tcRow['tc_letter_email'] : '',
					'by' => isset($tcRow['tc_email_user']) ? (string)$tcRow['tc_email_user'] : ''
				);
			}
		}
	}
	$grouped[] = array(
		'pdh_pdc_id' => $pdcId,
		'pdh_letter_code' => $letterCode,
		'items' => $items
	);
}
$fwViewData['history_groups'] = $grouped;

// Total = sum of Days Delayed for the currently selected category only.
$totalDelaysAdded = 0;
if (!empty($grouped[0]['items']) && is_array($grouped[0]['items'])) {
	foreach ($grouped[0]['items'] as $it) {
		$totalDelaysAdded += (float)(isset($it['days']) ? $it['days'] : 0);
	}
}
if (floor($totalDelaysAdded) == $totalDelaysAdded) {
	$totalDelaysAdded = (int)$totalDelaysAdded;
}
$fwViewData['total_delays_added'] = $totalDelaysAdded;
