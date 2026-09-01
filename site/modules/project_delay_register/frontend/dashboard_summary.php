<?php
$fwMainView = 'file:' . getcwd() . '/dashboard_summary.tpl';

$fwViewData['title'] = 'Dashboard Summary';

// Visible projects only (hidden never counted).
$visibleRows = $fwDb->query("SELECT pdr_id, pdr_project_address, pdr_pending_confirmation
	FROM project_delay_register
	WHERE IFNULL(pdr_hide, 0) = 0");
if (!is_array($visibleRows)) {
	$visibleRows = array();
}

$totalActiveProjects = count($visibleRows);
$projectsWithDelays = 0;
$pendingConfirmationProjects = 0;
$totalLettersSent = 0;

$visibleKeys = array();
foreach ($visibleRows as $vr) {
	$key = strtolower(trim((string)$vr['pdr_project_address']));
	if ($key !== '') {
		$visibleKeys[$key] = 1;
	}
	if ((int)$vr['pdr_pending_confirmation'] > 0) {
		$pendingConfirmationProjects++;
	}
}

// Timeline letter counts per project (same source as home summary).
$timelineLetterCounts = array();
$timelineAggSql = "SELECT tc_project, COUNT(*) AS letter_count
	FROM timeline_center
	GROUP BY tc_project";
$timelineAggRows = $fwDb->query($timelineAggSql);
if (!empty($timelineAggRows) && is_array($timelineAggRows)) {
	foreach ($timelineAggRows as $tcRow) {
		$projectKey = strtolower(trim((string)$tcRow['tc_project']));
		if ($projectKey === '') {
			continue;
		}
		$timelineLetterCounts[$projectKey] = (int)$tcRow['letter_count'];
	}
}

foreach ($visibleKeys as $pKey => $one) {
	$letterCount = isset($timelineLetterCounts[$pKey]) ? (int)$timelineLetterCounts[$pKey] : 0;
	if ($letterCount > 0) {
		$projectsWithDelays++;
		$totalLettersSent += $letterCount;
	}
}

$fwViewData['total_active_projects'] = $totalActiveProjects;
$fwViewData['projects_with_time_delays'] = $projectsWithDelays;
$fwViewData['pending_confirmation'] = $pendingConfirmationProjects;
$fwViewData['total_letters_sent'] = $totalLettersSent;
