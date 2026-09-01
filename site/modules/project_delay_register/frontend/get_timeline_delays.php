<?php
// AJAX: timeline_center days + letter emailed for project + letter code.
header('Content-Type: application/json; charset=utf-8');

$pdr_id = (int)$fwRequest->getParam($ID, 0);
if ($pdr_id <= 0) {
	$pdr_id = (int)$fwRequest->getParam('pdr_id', 0);
}
$letterCode = trim((string)$fwRequest->getParam('letter_code', ''));

$out = array('ok' => 1, 'items' => array());

if ($pdr_id > 0 && $letterCode !== '') {
	$pdrRow = $fwDb->queryOne("SELECT pdr_project_address FROM project_delay_register WHERE pdr_id = " . $pdr_id);
	$project = !empty($pdrRow['pdr_project_address']) ? trim((string)$pdrRow['pdr_project_address']) : '';
	if ($project !== '') {
		$sql = "SELECT tc_days_delay, tc_letter_email, tc_email_user
			FROM timeline_center
			WHERE LOWER(TRIM(tc_project)) = '" . addslashes(strtolower($project)) . "'
			AND TRIM(tc_letter_code) = '" . addslashes($letterCode) . "'
			ORDER BY STR_TO_DATE(NULLIF(TRIM(tc_letter_email), ''), '%d-%m-%Y') DESC, tc_id DESC";
		$rows = $fwDb->query($sql);
		if (!empty($rows) && is_array($rows)) {
			foreach ($rows as $row) {
				$out['items'][] = array(
					'days' => isset($row['tc_days_delay']) ? (string)$row['tc_days_delay'] : '',
					'date' => isset($row['tc_letter_email']) ? (string)$row['tc_letter_email'] : '',
					'by' => isset($row['tc_email_user']) ? (string)$row['tc_email_user'] : ''
				);
			}
		}
	}
}

echo json_encode($out);
exit;
