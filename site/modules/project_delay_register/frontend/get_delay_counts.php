<?php
// AJAX: return PDR delay letter counts for one project (no layout).
$pdr_id = (int)$fwRequest->getParam($ID, 0);
if ($pdr_id <= 0) {
	$pdr_id = (int)$fwRequest->getParam('pdr_id', 0);
}

header('Content-Type: application/json; charset=utf-8');

$out = array(
	'pdr_id' => $pdr_id,
	'approved' => 0,
	'pending' => 0,
	'last_letter_sent' => ''
);

if ($pdr_id > 0) {
	$row = $fwDb->queryOne("SELECT pdr_project_address, pdr_approved_letters_to_be_sent, pdr_pending_confirmation
		FROM project_delay_register WHERE pdr_id = " . $pdr_id);
	if (!empty($row)) {
		$out['approved'] = (int)$row['pdr_approved_letters_to_be_sent'];
		$out['pending'] = (int)$row['pdr_pending_confirmation'];

		// Same source as home list: latest "When letter emailed" from timeline_center.
		$project = trim((string)$row['pdr_project_address']);
		if ($project !== '') {
			$lastSql = "SELECT MAX(STR_TO_DATE(NULLIF(TRIM(tc_letter_email), ''), '%d-%m-%Y')) AS last_letter_sent_date
				FROM timeline_center
				WHERE LOWER(TRIM(tc_project)) = '" . addslashes(strtolower($project)) . "'";
			$lastRow = $fwDb->queryOne($lastSql);
			$lastDate = !empty($lastRow['last_letter_sent_date']) ? $lastRow['last_letter_sent_date'] : '';
			if ($lastDate && $lastDate !== '0000-00-00') {
				$out['last_letter_sent'] = date('d-m-Y', strtotime($lastDate));
			}
		}
	}
}

echo json_encode($out);
exit;
