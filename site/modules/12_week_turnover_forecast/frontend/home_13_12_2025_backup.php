<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$sql = "SELECT DISTINCT bsn_id, bsn_name, bsn_status, bsn_dair_amount, bsn_cip_com_on_date FROM business
        LEFT JOIN business_sellers AS business_sellers ON business_sellers.bs_business_id = business.bsn_id
        WHERE (bsn_status LIKE '%|2|%' OR bsn_status LIKE '%|3|%') AND (business_sellers.bs_xor_hide = 0 OR business_sellers.bs_xor_hide IS NULL)";
$projects = $fwDb->query($sql);
$bsnIdsArray = [];
foreach ($projects as $row) {
    $bsnIdsArray[] = $row['bsn_id'];
}

$sql = 'SELECT PT.bt_bsn_id, PT.bt_completed_date, PT.bt_task_id, DPN.dpn_dr_estimate_cost
        FROM proposal_tasks AS PT
		INNER JOIN document_proposal_name AS DPN ON DPN.dpn_proposal_number = PT.bt_task_list_number AND DPN.dpn_bsn_id = PT.bt_bsn_id
        WHERE PT.bt_bsn_id IN (' . implode(',', $bsnIdsArray) . ')
        AND PT.bt_task_id = 8 AND DPN.dpn_proposal_number = 1';
		
$result = $fwDb->query($sql);
$proposalTasksArray = [];
foreach ($result as $row) {
    $proposalTasksArray[$row['bt_bsn_id']] = [
        'completed_date' => $row['bt_completed_date'],
        'dpn_dr_estimate_cost' => $row['dpn_dr_estimate_cost'],
    ];
}

$weekCdaSum = [];
$startOfWeek = strtotime("monday this week");
for ($i = 0; $i < 12; $i++) {
    $weekStart = strtotime("+$i week", $startOfWeek);
    $weekEnd = strtotime("+6 days", $weekStart);
    $weekCdaSum[$i] = [
        'start_date' => date('d-M-Y', $weekStart),
        'end_date' => date('d-M-Y', $weekEnd),
        'cda_value_sum' => 0,
    ];
}

foreach ($projects as $project) {
    $bsnID = $project['bsn_id'];
    if (!isset($proposalTasksArray[$bsnID])) continue;

    $completedDate = $proposalTasksArray[$bsnID]['completed_date'];
    $cdaDate = strtotime($completedDate . ' +60 days');
    $cdaValue = floatval(str_replace(['$', ','], '', $proposalTasksArray[$bsnID]['dpn_dr_estimate_cost']));

    foreach ($weekCdaSum as $index => $week) {
        $weekStart = strtotime($week['start_date']);
        $weekEnd = strtotime($week['end_date']);
        if ($cdaDate >= $weekStart && $cdaDate <= $weekEnd) {
            $weekCdaSum[$index]['cda_value_sum'] += $cdaValue;
            break;
        }
    }
}

foreach ($weekCdaSum as $i => $week) {
    $weekCdaSum[$i]['cda_value_sum'] = '$' . number_format($week['cda_value_sum'], 2);
}

$fwViewData['weeklyData'] = $weekCdaSum;
//echo "<pre>"; print_r($weekCdaSum); exit();

$fwViewData['title'] = $MODULE_PLURAL;
