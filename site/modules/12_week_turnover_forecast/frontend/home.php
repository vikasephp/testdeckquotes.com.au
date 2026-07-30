<?php

$title = $MODULE_PLURAL;
$fwViewData['title'] = $title;

$sql_table = new Fw_Db_Table("12_week_turnover_forecasts");
$fwViewData['weekly_data'] = $sql_table->getAllRows();

function getRawNumber($value)
{
    $value = str_replace(['$', ','], '', $value);
    return is_numeric($value) ? (float)$value : 0;
}

function isDateInRange($date, $start, $end)
{
    if (!$date) return false;
    $ts = is_numeric($date) ? $date : strtotime($date);
    if (!$ts) return false;
    return ($ts >= $start && $ts <= $end);
}

function hasFirstOfMonth($start, $end)
{
    $startTs = strtotime($start);
    $endTs = strtotime($end);
    $current = strtotime(date('Y-m-01', $startTs));
    while ($current <= $endTs) {
        if ($current >= $startTs && $current <= $endTs) return true;
        $current = strtotime('+1 month', $current);
    }
    return false;
}

function getRentalWeetangeraDate($weekStartTs, $weekEndTs) {
    $firstOfMonth = strtotime(date('Y-m-01', $weekStartTs));
    $dayOfWeek = date('N', $firstOfMonth);

    if ($dayOfWeek >= 6) {
        $firstOfMonth = strtotime('next monday', $firstOfMonth);
    }

    return $firstOfMonth;
}

$weekPeriod = [];
$startOfWeek = strtotime('monday this week');
//$startOfWeek = strtotime('monday this week', strtotime(date('d-m-Y')));

for ($i = 0; $i < 12; $i++) {
    $weekStart = strtotime("+$i week", $startOfWeek);
    $weekEnd   = strtotime("+6 days", $weekStart);

    $weekPeriod[$i] = [
        'start_ts' => $weekStart,
        'end_ts'   => $weekEnd,
        'label'    => date('d-M', $weekStart) . ' - ' . date('d-M-Y', $weekEnd),
        'customer_design_total' => 0,
		'deposit_total' => 0,
        'planning_total' => 0,
        'progress_payment_total' => 0,
        //'rental_weetangera' => hasFirstOfMonth(date('Y-m-d', $weekStart), date('Y-m-d', $weekEnd)) ? 5041.67 : 0,
		'rental_weetangera' => 0,
    ];
}

$rentalAmount = 5041.67;

// Get first and last week timestamps
$firstWeekStart = $weekPeriod[0]['start_ts'];
$lastWeekEnd = $weekPeriod[count($weekPeriod)-1]['end_ts'];

$currentMonth = strtotime(date('Y-m-01', $firstWeekStart));
while ($currentMonth <= $lastWeekEnd) {
    $dayOfWeek = date('N', $currentMonth);
    if ($dayOfWeek >= 6) {
        $currentMonth = strtotime('next monday', $currentMonth);
    }

    foreach ($weekPeriod as &$week) {
        if ($currentMonth >= $week['start_ts'] && $currentMonth <= $week['end_ts']) {
            $week['rental_weetangera'] = $rentalAmount;
            break;
        }
    }
    unset($week);

    $currentMonth = strtotime(date('Y-m-01', strtotime('+1 month', $currentMonth)));
}

function setCurrencyValue($value)
{
    if ($value == '') {
        return '';
    }
    if ($value < 0) {
        return '-$' . number_format(abs($value), 2);
    }
    return '$' . number_format($value, 2);
}

$sql = "SELECT b.bsn_id, b.bsn_name, b.bsn_status, b.bsn_dair_amount, b.bsn_dair_invoice_date, b.bsn_cip_com_on_date, ( SELECT dpn.dpn_dcr_value FROM document_proposal_name dpn WHERE dpn.dpn_bsn_id = b.bsn_id AND dpn.dpn_dr_hide = 0 AND dpn.dpn_dcr_go_ahead = 1 AND dpn.dpn_dr_type_new IN (1, 2) AND dpn.dpn_dcr_value IS NOT NULL AND dpn.dpn_dcr_value != '' LIMIT 1 ) AS dpn_dcr_value FROM business_sellers bs INNER JOIN business b ON bs.bs_business_id = b.bsn_id LEFT JOIN (SELECT ppd_bsn_id, SUM(REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') + 0) AS total_hia_value, SUM(REPLACE(REPLACE(ppd_value, '$', ''), ',', '') + 0) AS total_paid_value FROM progress_payment_detail GROUP BY ppd_bsn_id) pp ON pp.ppd_bsn_id = b.bsn_id WHERE b.bsn_sub_status != 'Lost' AND ( ( EXISTS ( SELECT 1 FROM document_proposal_name dpn WHERE dpn.dpn_bsn_id = b.bsn_id AND dpn.dpn_dr_hide = 0 AND dpn.dpn_dcr_go_ahead = 1 AND dpn.dpn_dr_type_new IN (1, 2) ) ) OR b.bsn_status LIKE '%|2|%' OR b.bsn_status LIKE '%|3|%' OR b.bsn_status LIKE '%|4|%' OR b.bsn_status LIKE '%|5|%' OR b.bsn_status LIKE '%|6|%' ) AND NOT (pp.total_hia_value = pp.total_paid_value AND pp.total_hia_value > 0 ) GROUP BY b.bsn_id ORDER BY CASE WHEN b.bsn_status LIKE '%|12|%' AND b.bsn_status NOT LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 1 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 2 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 3 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 4 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 5 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 6 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 7 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 8 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 9 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 10 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 11 WHEN b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 12 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 13 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 14 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|4|%' THEN 15 WHEN b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 16 WHEN b.bsn_status LIKE '%|4|%' THEN 17 ELSE 99 END, b.bsn_id";
$records = $fwDb->query($sql);

$bsnIdsArray = [];
foreach ($records as $row) {
    $bsnIdsArray[] = $row['bsn_id'];
}

$sql = 'SELECT PT.bt_bsn_id, PT.bt_completed_date, PT.bt_task_id, PT.bt_task_list_number, DPN.dpn_id, DPN.dpn_bsn_id, DPN.dpn_proposal_number, DPN.dpn_unique_id, DPN.dpn_dr_estimate_cost FROM proposal_tasks AS PT INNER JOIN document_proposal_name AS DPN ON DPN.dpn_proposal_number = PT.bt_task_list_number AND DPN.dpn_bsn_id = PT.bt_bsn_id WHERE PT.bt_bsn_id IN (' . implode(',', $bsnIdsArray) . ') AND PT.bt_task_id IN (8) AND DPN.dpn_proposal_number = 1';
// db($sql);
$result = $fwDb->query($sql);
$proposalTasksArray = [];
foreach ($result as $row) {
    if (!isset($proposalTasksArray[$row['bt_bsn_id']])) {
        $proposalTasksArray[$row['bt_bsn_id']] = [];
    }
    $proposalTasksArray[$row['bt_bsn_id']][$row['bt_task_id']] = [
        'completed_date' => $row['bt_completed_date'],
        'dpn_dr_estimate_cost' => $row['dpn_dr_estimate_cost'],
    ];
}

$sql = 'SELECT doc_bsn_id, doc_name_id, doc_date_uploaded FROM document_check_list WHERE doc_bsn_id IN (' . implode(',', $bsnIdsArray) . ') AND doc_name_id IN (64)';
$result = $fwDb->query($sql);
$documentChecklistArray = [];
foreach ($result as $row) {
    if (!isset($documentChecklistArray[$row['doc_bsn_id']])) {
        $documentChecklistArray[$row['doc_bsn_id']] = [];
    }
    $documentChecklistArray[$row['doc_bsn_id']][$row['doc_name_id']] = [
        'completed_date' => $row['doc_date_uploaded']
    ];
}

$sql = 'SELECT ppd_bsn_id, ppd_stage, ppd_hia_value, ppd_value, ppd_invoice_sent, ppd_inv_due_date, ppd_invoice_sent_date FROM progress_payment_detail WHERE ppd_bsn_id IN (' . implode(',', $bsnIdsArray) . ')';
$result = $fwDb->query($sql);
$paymentDetailArray = [];
foreach ($result as $row) {
    if (!isset($paymentDetailArray[$row['ppd_bsn_id']])) {
        $paymentDetailArray[$row['ppd_bsn_id']] = [];
    }
    $paymentDetailArray[$row['ppd_bsn_id']][$row['ppd_stage']] = [
        'amount' => getRawNumber($row['ppd_hia_value']),
		'paid_value' => getRawNumber($row['ppd_value']),
        'invoice_date' => getRawNumber($row['ppd_hia_value']),
		'invoice_sent' => $row['ppd_invoice_sent'],
		'invoice_due_date' => $row['ppd_inv_due_date'],
		'ppd_invoice_sent_date' => $row['ppd_invoice_sent_date']
    ];
}

$sql = 'SELECT va_bsn_id, va_values FROM bus_variations WHERE va_bsn_id IN (' . implode(',', $bsnIdsArray) . ')';
$result = $fwDb->query($sql);
$busVariationArray = [];
foreach ($result as $row) {
    if (!isset($busVariationArray[$row['va_bsn_id']])) {
        $busVariationArray[$row['va_bsn_id']] = [];
    }
    $busVariationArray[$row['va_bsn_id']][] = [
        'amount' => getRawNumber($row['va_values']),
    ];
}

$finalList = [];
$sn = 1;
$totalProjectValueForDesign = 0;
$totalProjectValueForPlanning = 0;
$totalUninvoicedConstructionValue = 0;
foreach ($records as $row) {
    $bsnID = $row['bsn_id'];
	$cdaValue = (strpos($row['bsn_status'], '12') !== false && empty($row['bsn_dair_amount'])) ? 3500 : getRawNumber($row['bsn_dair_amount']);

    $proposalDeliveryDate = '';
    $cdaDate = '';
    if (isset($proposalTasksArray[$bsnID]) && isset($proposalTasksArray[$bsnID][8]) && strtotime($proposalTasksArray[$bsnID][8]['completed_date']) > 0 && $time = strtotime($proposalTasksArray[$bsnID][8]['completed_date'])) {
        $proposalDeliveryDate = date('d-m-Y', $time);
        //$cdaDate = date('d-m-Y', strtotime($proposalDeliveryDate . ' +60 days'));
    }
	
	//$cdaDate = !empty($row['bsn_dair_invoice_date']) ? date('d-m-Y', strtotime($row['bsn_dair_invoice_date'])) : '';
	if ($row['bsn_status'] === '|12|') {
		if (!empty($row['bsn_dair_invoice_date']) && strtotime($row['bsn_dair_invoice_date'])) {
			$cdaDate = date('d-m-Y', strtotime($row['bsn_dair_invoice_date']));
		} elseif (!empty($proposalDeliveryDate) && strtotime($proposalDeliveryDate)) {
			$cdaDate = date('d-m-Y', strtotime($proposalDeliveryDate . ' +60 days'));
		}
	} else {
		if (!empty($row['bsn_dair_invoice_date']) && strtotime($row['bsn_dair_invoice_date'])) {
			$cdaDate = date('d-m-Y', strtotime($row['bsn_dair_invoice_date']));
		}
	}

    $hiaSignupDate = '';
    $depositDate = '';
    $planningSubmittedDate = '';
	
	if ($row['bsn_status'] === '|12|') {
		if (isset($proposalTasksArray[$bsnID]) && isset($proposalTasksArray[$bsnID][8]) && strtotime($proposalTasksArray[$bsnID][8]['completed_date']) > 0 && $time = strtotime($proposalTasksArray[$bsnID][8]['completed_date'])) {
			$hiaSignupDate = date('d-m-Y', strtotime($proposalDeliveryDate . ' +60 days'));
		}
	} else {
		if (isset($documentChecklistArray[$bsnID]) && isset($documentChecklistArray[$bsnID][64]) && strtotime($documentChecklistArray[$bsnID][64]['completed_date']) > 0 && $time = strtotime($documentChecklistArray[$bsnID][64]['completed_date'])) {
			$hiaSignupDate = date('d-m-Y', $time);
		}
	}

    if (isset($documentChecklistArray[$bsnID]) && isset($documentChecklistArray[$bsnID][64]) && strtotime($documentChecklistArray[$bsnID][64]['completed_date']) > 0 && $time = strtotime($documentChecklistArray[$bsnID][64]['completed_date'])) {
        //$hiaSignupDate = date('d-M-Y', $time);
        $depositDate = date('d-m-Y', strtotime($hiaSignupDate . ' +14 days'));
        $planningSubmittedDate = date('d-m-Y', strtotime($hiaSignupDate . ' +56 days'));
    }
	if (isset($paymentDetailArray[$bsnID]['Deposit']) 
			&& $paymentDetailArray[$bsnID]['Deposit']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Deposit']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Deposit']['invoice_due_date'])) {

			//$depositDate = date('d-M-Y', strtotime($paymentDetailArray[$bsnID]['Deposit']['invoice_due_date']));
			$depositDate = $paymentDetailArray[$bsnID]['Deposit']['invoice_due_date'];
		}
    $onsiteDate = '';
    $floorSystemCompleteDate = '';
    $wallRoofFramesCompleteDate = '';
    $closeUpCompleteDate = '';
    $fixingsCompleteDate = '';
    $paintingCompleteDate = '';
    $projectCompleteDate = '';
    if (strtotime($row['bsn_cip_com_on_date']) > 0 && $time = strtotime($row['bsn_cip_com_on_date'])) {
        $onsiteDate = date('d-m-Y', $time);
        //$floorSystemCompleteDate = date('d-M-Y', strtotime($onsiteDate . ' +25 days'));
		if (
			isset($paymentDetailArray[$bsnID]['Floor Systems Complete']) &&
			$paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== '' &&
			$paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== null &&
			!empty($paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_due_date'])
		) {
			$floorSystemCompleteDate = $paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_due_date'];
		} else {
			$floorSystemCompleteDate = date('d-m-Y', strtotime($onsiteDate . ' +25 days'));
		}
        $wallRoofFramesCompleteDate = date('d-m-Y', strtotime($floorSystemCompleteDate . ' +10 days'));
        $closeUpCompleteDate = date('d-m-Y', strtotime($wallRoofFramesCompleteDate . ' +30 days'));
        $fixingsCompleteDate = date('d-m-Y', strtotime($closeUpCompleteDate . ' +30 days'));
        $paintingCompleteDate = date('d-m-Y', strtotime($fixingsCompleteDate . ' +10 days'));
        $projectCompleteDate = date('d-m-Y', strtotime($paintingCompleteDate . ' +30 days'));
    }
	
	if (isset($paymentDetailArray[$bsnID]['Planning Approvals Submitted']) 
			&& $paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_due_date'])) {

			$planningSubmittedDate = $paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_due_date'];
		}
		
		
	if (isset($paymentDetailArray[$bsnID]['Floor Systems Complete']) 
			&& $paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_due_date'])) {

			$floorSystemCompleteDate = $paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_due_date'];
		}
		
	if (isset($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']) 
			&& $paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_due_date'])) {

			$wallRoofFramesCompleteDate = $paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_due_date'];
		}
		
	if (isset($paymentDetailArray[$bsnID]['Close Up Complete']) 
			&& $paymentDetailArray[$bsnID]['Close Up Complete']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Close Up Complete']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Close Up Complete']['invoice_due_date'])) {

			$closeUpCompleteDate = $paymentDetailArray[$bsnID]['Close Up Complete']['invoice_due_date'];
		}
		
	if (isset($paymentDetailArray[$bsnID]['Fixing Complete ']) 
			&& $paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_due_date'])) {

			$fixingsCompleteDate = $paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_due_date'];
		}
		
	if (isset($paymentDetailArray[$bsnID]['Painting Complete']) 
			&& $paymentDetailArray[$bsnID]['Painting Complete']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Painting Complete']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Painting Complete']['invoice_due_date'])) {

			$paintingCompleteDate = $paymentDetailArray[$bsnID]['Painting Complete']['invoice_due_date'];
		}
	
	if (isset($paymentDetailArray[$bsnID]['Project Completion']) 
			&& $paymentDetailArray[$bsnID]['Project Completion']['invoice_sent'] !== '' 
			&& $paymentDetailArray[$bsnID]['Project Completion']['invoice_sent'] !== null
			&& !empty($paymentDetailArray[$bsnID]['Project Completion']['invoice_due_date'])) {

			$projectCompleteDate = $paymentDetailArray[$bsnID]['Project Completion']['invoice_due_date'];
		}

	$inclusionValue = 0;
	if (isset($paymentDetailArray[$bsnID])) {
		foreach ($paymentDetailArray[$bsnID] as $stageName => $stageData) {
			$stageName = trim($stageName);
			if ( stripos($stageName, 'Variation') !== false || stripos($stageName, 'Inclusion') !== false ) {
				//echo "BSN ID: {$bsnID} | Included Stage: '{$stageName}' | Amount: " .$stageData['amount']."<br/>";
				$inclusionValue += $stageData['amount'];
			}
		}
	}
	
	$status_string = $row['bsn_status'];
	$status = '';

	if (strpos($status_string, '|1|') !== false) {
		$status .= "Convert<br>";
	}
	if (strpos($status_string, '|2|') !== false) {
		$status .= "Planning Approvals<br>";
	}
	if (strpos($status_string, '|5|') !== false) {
		$status .= "Inclusions<br>";
	}
	if (strpos($status_string, '|6|') !== false) {
		$status .= "Pre Construction<br>";
	}
	if (strpos($status_string, '|3|') !== false) {
		$status .= "Construction<br>";
	}
	if (strpos($status_string, '|4|') !== false) {
		$status .= "Complete<br>";
	}
	if (strpos($status_string, '|12|') !== false) {
		$status .= "Design Phase<br>";
	}
	if (strpos($status_string, '|18|') !== false) {
		$status .= "Planning Approvals Only<br>";
	}

    $hiaValue = 0;
    $totalProjectValue = 0;
    $depositValue = 0;
    $planningSubmittedValue = 0;
    $floorSystemCompleteValue = 0;
    $wallRoofFramesCompleteValue = 0;
    $closeUpCompleteValue = 0;
    $fixingsCompleteValue = 0;
    $paintingCompleteValue = 0;
    $projectCompleteValue = 0;
	
	$receiptOfFinalisedStampedPlansValue = 0;
	
	$receiptOfFinalisedStampedPlansDueDate = '';
	
	$receiptOfFinalisedStampedPlansValue = isset($paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']) ? $paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']['amount'] : 0;
	
	$receiptOfFinalisedStampedPlansDueDate = isset($paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']) ? $paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']['invoice_due_date'] : '';
	
	if ($row['bsn_status'] === '|12|') {

		$hiaValue = !empty($row['dpn_dcr_value']) ? getRawNumber($row['dpn_dcr_value']) : 0;
        $depositValue = 10000;
        $planningSubmittedValue = ($hiaValue * 0.10) - $depositValue;
        $floorSystemCompleteValue = ($hiaValue * 0.20);
        $wallRoofFramesCompleteValue = ($hiaValue * 0.15);
        $closeUpCompleteValue = ($hiaValue * 0.15);
        $fixingsCompleteValue = ($hiaValue * 0.15);
        $paintingCompleteValue = ($hiaValue * 0.15);
        $projectCompleteValue = ($hiaValue * 0.10);
    } else {
        if (isset($paymentDetailArray[$bsnID])) {
            $a = isset($paymentDetailArray[$bsnID]['Deposit']) ? $paymentDetailArray[$bsnID]['Deposit']['amount'] : 0;
            $planningSubmittedValue = isset($paymentDetailArray[$bsnID]['Planning Approvals Submitted']) ? $paymentDetailArray[$bsnID]['Planning Approvals Submitted']['amount'] : 0;
			
			$depositValue = $a;

            $floorSystemCompleteValue = isset($paymentDetailArray[$bsnID]['Floor Systems Complete']) ? $paymentDetailArray[$bsnID]['Floor Systems Complete']['amount'] : 0;
            $wallRoofFramesCompleteValue = isset($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']) ? $paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['amount'] : 0;
            $closeUpCompleteValue = isset($paymentDetailArray[$bsnID]['Close Up Complete']) ? $paymentDetailArray[$bsnID]['Close Up Complete']['amount'] : 0;
            $fixingsCompleteValue = isset($paymentDetailArray[$bsnID]['Fixing Complete ']) ? $paymentDetailArray[$bsnID]['Fixing Complete ']['amount'] : 0;
            $paintingCompleteValue = isset($paymentDetailArray[$bsnID]['Painting Complete']) ? $paymentDetailArray[$bsnID]['Painting Complete']['amount'] : 0;
            $projectCompleteValue = isset($paymentDetailArray[$bsnID]['Project Completion']) ? $paymentDetailArray[$bsnID]['Project Completion']['amount'] : 0;
        }
        $hiaValue = $depositValue + $planningSubmittedValue + $floorSystemCompleteValue + $wallRoofFramesCompleteValue + $closeUpCompleteValue + $fixingsCompleteValue + $paintingCompleteValue + $projectCompleteValue;
        //$totalProjectValue = $hiaValue + $inclusionValue;
    }
	
	$totalProjectValue = $hiaValue + $inclusionValue;
	
	if (strpos($row['bsn_status'], '|12|') !== false) {
        $totalProjectValueForDesign += $totalProjectValue;
    }

	$inclPlanningStatus = strpos($row['bsn_status'], '|2|') !== false || strpos($row['bsn_status'], '|5|') !== false;
	$exclPlanningStatus = strpos($row['bsn_status'], '|3|') !== false || strpos($row['bsn_status'], '|4|') !== false;
	if ($inclPlanningStatus && !$exclPlanningStatus) {
		$totalProjectValueForPlanning += $totalProjectValue;
	}
	
	$sumUninvoicedHiaValues = 0;
	//if (strpos($row['bsn_status'], '|3|') !== false) {}
	$inclConstructionStatus = strpos($row['bsn_status'], '|3|')  !== false || strpos($row['bsn_status'], '|6|')  !== false;
	$exclConstructionStatus = strpos($row['bsn_status'], '|4|') !== false;
	if ($inclConstructionStatus && !$exclConstructionStatus) {
		$constructionStages = [
			'Deposit',
			'Planning Approvals Submitted',
			'Floor Systems Complete',
			'Wall and Roof Frames Complete',
			'Close Up Complete',
			'Fixing Complete ',
			'Painting Complete',
			'Project Completion'
		];

		if (isset($paymentDetailArray[$bsnID])) {
			foreach ($constructionStages as $stage) {
				if (isset($paymentDetailArray[$bsnID][$stage])) {
					$invoiceSent = $paymentDetailArray[$bsnID][$stage]['invoice_sent'];
					$stageValue  = $paymentDetailArray[$bsnID][$stage]['amount'];
					if ($invoiceSent === null || $invoiceSent === '') {
						$sumUninvoicedHiaValues += $stageValue;
					}
				}
			}
		}

		$totalUninvoicedConstructionValue += $sumUninvoicedHiaValues;
	}
		
	$sql_inv_date = "SELECT ppd_invoice_sent_date FROM progress_payment_detail WHERE ppd_bsn_id = $bsnID AND (ppd_stage LIKE '%Variation%' OR ppd_stage LIKE '%Inclusion%') AND ppd_hia_value IS NOT NULL AND (ppd_value IS NULL OR ppd_value = '') ORDER BY ppd_id DESC LIMIT 1";
	$data_inv_date = $fwDb->queryOne($sql_inv_date);
	$lastVariationInvoiceDate = (!empty($data_inv_date['ppd_invoice_sent_date'])) ? date('d-m-Y', strtotime($data_inv_date['ppd_invoice_sent_date'])) : '';
	
    $data = [
        'sn' => $sn++,
        'bsn_id' => $bsnID,
        'bsn_name' => $row['bsn_name'],
		'project_status' => $status,
        'proposal_delivery_date' => $proposalDeliveryDate,
        'cda_date' => $cdaDate,
        'cda_value' => setCurrencyValue($cdaValue),
        'hia_signup_date' => $hiaSignupDate,
        'hia_value' => setCurrencyValue($hiaValue),
		'inclusions_date' => $lastVariationInvoiceDate,
        'inclusions_value' => setCurrencyValue($inclusionValue),
        'total_project_value' => setCurrencyValue($totalProjectValue),
		'receipt_of_finalised_stamped_plans_due_date' => $receiptOfFinalisedStampedPlansDueDate,
		'receipt_of_finalised_stamped_plans_value' => setCurrencyValue($receiptOfFinalisedStampedPlansValue),
        'deposit_date' => $depositDate,
        'deposit_value' => setCurrencyValue($depositValue),
        'planning_submitted_date' => $planningSubmittedDate,
		'planning_submitted_value' => ($planningSubmittedValue < 0) ? '' : setCurrencyValue($planningSubmittedValue),
        'onsite_date' => $onsiteDate,
        'floor_system_complete_date' => $floorSystemCompleteDate,
        'floor_system_complete_value' => setCurrencyValue($floorSystemCompleteValue),
        'wall_roof_frames_complete_date' => $wallRoofFramesCompleteDate,
        'wall_roof_frames_complete_value' => setCurrencyValue($wallRoofFramesCompleteValue),
        'close_up_complete_date' => $closeUpCompleteDate,
        'close_up_complete_value' => setCurrencyValue($closeUpCompleteValue),
        'fixings_complete_date' => $fixingsCompleteDate,
        'fixings_complete_value' => setCurrencyValue($fixingsCompleteValue),
        'painting_complete_date' => $paintingCompleteDate,
        'painting_complete_value' => setCurrencyValue($paintingCompleteValue),
        'project_complete_date' => $projectCompleteDate,
        'project_complete_value' => setCurrencyValue($projectCompleteValue),
    ];

    $finalList[] = $data;
	
	//Design Phase
	if ($row['bsn_status'] === '|12|' && !empty($cdaDate)) {
		$cdaTs = strtotime($cdaDate);
        foreach ($weekPeriod as &$week) {
            if ($cdaTs >= $week['start_ts'] && $cdaTs <= $week['end_ts']) {
                $week['customer_design_total'] += $cdaValue;
                break;
            }
        }
        unset($week);
    }
	
	/*Deposit*/
	$depositStagesMap = [
		'Receipt of Finalised Stamped Plans' => [$receiptOfFinalisedStampedPlansDueDate, $receiptOfFinalisedStampedPlansValue],
		'Deposit' => [$depositDate, $depositValue]
	];

	foreach ($depositStagesMap as $stageName => [$dueDate, $amount]) {

		$dueDateTs = strtotime($dueDate);
		if (!$dueDateTs || $amount <= 0) continue;

		$invoiceDueDate = $paymentDetailArray[$bsnID][$stageName]['invoice_due_date'] ?? '';

		if (!empty($invoiceDueDate)) continue;

		foreach ($weekPeriod as &$week) {
			if (isDateInRange($dueDateTs, $week['start_ts'], $week['end_ts'])) {
				$week['deposit_total'] += $amount;
				break;
			}
		}
		unset($week);
	}
	
	/*Planning*/
	$planningStagesMap = [
		'Planning Approvals Submitted' => [$planningSubmittedDate, $planningSubmittedValue]
	];

	foreach ($planningStagesMap as $stageName => [$dueDate, $amount]) {

		$dueDateTs = strtotime($dueDate);

		if (!$dueDateTs || $amount <= 0) continue;

		$invoiceDueDate = $paymentDetailArray[$bsnID][$stageName]['invoice_due_date'] ?? '';

		if (!empty($invoiceDueDate)) continue;

		foreach ($weekPeriod as &$week) {
			if (isDateInRange($dueDateTs, $week['start_ts'], $week['end_ts'])) {
				$week['planning_total'] += $amount;
				/* if ($week['label'] === '30-Mar - 05-Apr-2026') {
					echo "Planning BSN ID: {$bsnID} | Stage: {$stageName} | Amount: {$amount}<br>";
				} */
				break;
			}
		}
		unset($week);
	}
	
	/*Progress Payment Dates */
	$progressStagesMap = [
		'Floor Systems Complete' => [$floorSystemCompleteDate, $floorSystemCompleteValue],
		'Wall and Roof Frames Complete' => [$wallRoofFramesCompleteDate, $wallRoofFramesCompleteValue],
		'Close Up Complete' => [$closeUpCompleteDate, $closeUpCompleteValue],
		'Fixing Complete ' => [$fixingsCompleteDate, $fixingsCompleteValue],
		'Painting Complete' => [$paintingCompleteDate, $paintingCompleteValue],
		'Project Completion' => [$projectCompleteDate, $projectCompleteValue],
	];

	foreach ($progressStagesMap as $stageName => [$dueDate, $amount]) {

		$dueDateTs = strtotime($dueDate);
		if (!$dueDateTs || $amount <= 0) {
			continue;
		}

		$invoiceDueDate = $paymentDetailArray[$bsnID][$stageName]['invoice_due_date'] ?? '';

		if (!empty($invoiceDueDate)) {
			continue;
		}

		foreach ($weekPeriod as &$week) {
			if (isDateInRange($dueDateTs, $week['start_ts'], $week['end_ts'])) {

				$week['progress_payment_total'] += $amount;
				/* if ($week['label'] === '16-Mar - 22-Mar-2026') {
					echo "Progress Payment BSN ID: {$bsnID} | Stage: {$stageName} | Amount: {$amount} | Date: " . date('d-M-Y', $dueDateTs) . "<br>";
				} */

				break;
			}
		}
		unset($week);
	}
	
	foreach ($weekPeriod as &$week) {
		$week['total_turnover'] =
			$week['customer_design_total'] +
			$week['deposit_total'] +
			$week['planning_total'] +
			$week['progress_payment_total'] +
			$week['rental_weetangera'];
	}
	unset($week);
}

$fwViewData['weekPeriod'] = $weekPeriod;
$fwViewData['totalProjectValueForDesign'] = setCurrencyValue($totalProjectValueForDesign);
$fwViewData['totalProjectValueForPlanning'] = setCurrencyValue($totalProjectValueForPlanning);
$fwViewData['totalUninvoicedConstructionValue'] = setCurrencyValue($totalUninvoicedConstructionValue);

$calculate = $fwRequest->getParam('calculate', '');
if(!empty($calculate)) {
	$dt = $fwRequest->getParam('dt', '');
	$_SESSION['dt'] = $dt;
} else {
	$dt = date('d-m-Y');
}

$ndt = DateTime::createFromFormat('d-m-Y', $dt);
$start = strtotime($ndt->format('Y-m-d'));

$start30 = $start;
$end30 = strtotime("+30 days", $start30);

$start60 = strtotime("+31 days", $start);
$end60 = strtotime("+60 days", $start);

$start90 = strtotime("+61 days", $start);
$end90 = strtotime("+90 days", $start);

$fwViewData['currdate'] = $dt;
$fwViewData['30days'] = date('d-M-Y', $start30).' to '.date('d-M-Y', $end30);
$fwViewData['60days'] = date('d-M-Y', $start60).' to '.date('d-M-Y', $end60);
$fwViewData['90days'] = date('d-M-Y', $start90).' to '.date('d-M-Y', $end90);

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)){
	unset($_SESSION['dt']);
}

$totals30 = $totals60 = $totals90 = [
    'customer_design_total' => 0,
    'deposit_total' => 0,
    'planning_total' => 0,
    'progress_payment_total' => 0,
    'rental_weetangera' => 0,
    'total_turnover' => 0
];
foreach ($finalList as $project) {
    // Stage maps
	
    /* $customerDesignStages = [
        'Customer Design' => [$project['cda_date'], getRawNumber($project['cda_value'])]
    ]; */
	$customerDesignStages = [];
	if (strpos($project['project_status'], 'Design Phase') !== false) {
		$customerDesignStages['Customer Design'] = [$project['cda_date'], getRawNumber($project['cda_value'])];
	}

    $depositStagesMap = [
        'Receipt of Finalised Stamped Plans' => [$project['receipt_of_finalised_stamped_plans_due_date'], getRawNumber($project['receipt_of_finalised_stamped_plans_value'])],
        'Deposit' => [$project['deposit_date'], getRawNumber($project['deposit_value'])]
    ];

    $planningStagesMap = [
        'Planning Approvals Submitted' => [$project['planning_submitted_date'], getRawNumber($project['planning_submitted_value'])]
    ];

    $progressPaymentStagesMap = [
        'Floor Systems Complete' => [$project['floor_system_complete_date'], getRawNumber($project['floor_system_complete_value'])],
        'Wall and Roof Frames Complete' => [$project['wall_roof_frames_complete_date'], getRawNumber($project['wall_roof_frames_complete_value'])],
        'Close Up Complete' => [$project['close_up_complete_date'], getRawNumber($project['close_up_complete_value'])],
        'Fixing Complete' => [$project['fixings_complete_date'], getRawNumber($project['fixings_complete_value'])],
        'Painting Complete' => [$project['painting_complete_date'], getRawNumber($project['painting_complete_value'])],
        'Project Completion' => [$project['project_complete_date'], getRawNumber($project['project_complete_value'])]
    ];

    // Function to add stage totals per period
	$addStageTotals = function ($stages, &$totals) use ($project, $start30, $end30, $start60, $end60, $start90, $end90, $paymentDetailArray, $planningStagesMap, $progressPaymentStagesMap, $customerDesignStages) {
        foreach ($stages as $stageName => [$dueDate, $amount]) {
            if (!$dueDate || $amount <= 0) continue;

            // Check if invoice_due_date exists for this stage
            $dueTs = strtotime($dueDate);
			if (!$dueTs || $amount <= 0) continue;

			$normalizedStageName = trim($stageName);
			$bsnID = $project['bsnID'] ?? $project['bsn_id'] ?? null;

			$invoiceDueDate = '';
			if ($bsnID && isset($paymentDetailArray[$bsnID])) {
				// Loop through all keys and match trimmed stage names
				foreach ($paymentDetailArray[$bsnID] as $paymentStageName => $paymentStageDetails) {
					if (trim($paymentStageName) === $normalizedStageName) {
						$invoiceDueDate = $paymentStageDetails['invoice_due_date'] ?? '';
						break;
					}
				}
			}

			if (!empty($invoiceDueDate) && $invoiceDueDate !== '0000-00-00') continue;

            if ($dueTs >= $start30 && $dueTs <= $end30) { 
				$totals['30days'][$stageName] += $amount; 
				
				// --- DEBUG for Progress Payment stages only ---
				/* if (in_array(trim($stageName), array_map('trim', array_keys($progressPaymentStagesMap)))) {
					echo "30-Day Slab | BSN ID: {$bsnID} | Stage: {$stageName} | Amount: {$amount} | Date: " . date('d-M-Y', $dueTs) . "<br>";
				} */
			}
            if ($dueTs >= $start60 && $dueTs <= $end60) { 
				$totals['60days'][$stageName] += $amount; 
				// --- DEBUG for Planning stages only ---
				/* if (in_array(trim($stageName), array_map('trim', array_keys($planningStagesMap)))) {
					echo "60-Day Slab | BSN ID: {$bsnID} | Stage: {$stageName} | Amount: {$amount} | Date: " . date('d-M-Y', $dueTs) . "<br>";
				} */
			}
            if ($dueTs >= $start90 && $dueTs <= $end90) $totals['90days'][$stageName] += $amount;
        }
    };

    // Initialize temp totals for this project
    $totals = [
        '30days' => [
            'Customer Design' => 0, 'Receipt of Finalised Stamped Plans' => 0, 'Deposit' => 0,
            'Planning Approvals Submitted' => 0, 'Floor Systems Complete' => 0,
            'Wall and Roof Frames Complete' => 0, 'Close Up Complete' => 0, 'Fixing Complete' => 0,
            'Painting Complete' => 0, 'Project Completion' => 0
        ],
        '60days' => [
            'Customer Design' => 0, 'Receipt of Finalised Stamped Plans' => 0, 'Deposit' => 0,
            'Planning Approvals Submitted' => 0, 'Floor Systems Complete' => 0,
            'Wall and Roof Frames Complete' => 0, 'Close Up Complete' => 0, 'Fixing Complete' => 0,
            'Painting Complete' => 0, 'Project Completion' => 0
        ],
        '90days' => [
            'Customer Design' => 0, 'Receipt of Finalised Stamped Plans' => 0, 'Deposit' => 0,
            'Planning Approvals Submitted' => 0, 'Floor Systems Complete' => 0,
            'Wall and Roof Frames Complete' => 0, 'Close Up Complete' => 0, 'Fixing Complete' => 0,
            'Painting Complete' => 0, 'Project Completion' => 0
        ]
    ];

    // Apply stage totals
    $addStageTotals($customerDesignStages, $totals);
    $addStageTotals($depositStagesMap, $totals);
    $addStageTotals($planningStagesMap, $totals);
    $addStageTotals($progressPaymentStagesMap, $totals);

    // Sum totals into main 30/60/90 arrays
    $totals30['customer_design_total'] += $totals['30days']['Customer Design'];
    $totals30['deposit_total'] += $totals['30days']['Receipt of Finalised Stamped Plans'] + $totals['30days']['Deposit'];
    $totals30['planning_total'] += $totals['30days']['Planning Approvals Submitted'];
    $totals30['progress_payment_total'] +=
        $totals['30days']['Floor Systems Complete'] +
        $totals['30days']['Wall and Roof Frames Complete'] +
        $totals['30days']['Close Up Complete'] +
        $totals['30days']['Fixing Complete'] +
        $totals['30days']['Painting Complete'] +
        $totals['30days']['Project Completion'];

    $totals60['customer_design_total'] += $totals['60days']['Customer Design'];
    $totals60['deposit_total'] += $totals['60days']['Receipt of Finalised Stamped Plans'] + $totals['60days']['Deposit'];
    $totals60['planning_total'] += $totals['60days']['Planning Approvals Submitted'];
    $totals60['progress_payment_total'] +=
        $totals['60days']['Floor Systems Complete'] +
        $totals['60days']['Wall and Roof Frames Complete'] +
        $totals['60days']['Close Up Complete'] +
        $totals['60days']['Fixing Complete'] +
        $totals['60days']['Painting Complete'] +
        $totals['60days']['Project Completion'];

    $totals90['customer_design_total'] += $totals['90days']['Customer Design'];
    $totals90['deposit_total'] += $totals['90days']['Receipt of Finalised Stamped Plans'] + $totals['90days']['Deposit'];
    $totals90['planning_total'] += $totals['90days']['Planning Approvals Submitted'];
    $totals90['progress_payment_total'] +=
        $totals['90days']['Floor Systems Complete'] +
        $totals['90days']['Wall and Roof Frames Complete'] +
        $totals['90days']['Close Up Complete'] +
        $totals['90days']['Fixing Complete'] +
        $totals['90days']['Painting Complete'] +
        $totals['90days']['Project Completion'];
}

// Adjust 1st of month if falls on Saturday or Sunday
function getAdjustedRentalDate($year, $month) {
    $date = strtotime("$year-$month-01");
    $weekday = date('N', $date); // 1=Mon, 7=Sun
    if ($weekday == 6) { $date = strtotime("+2 days", $date); } // Saturday → Monday
    elseif ($weekday == 7) { $date = strtotime("+1 day", $date); } // Sunday → Monday
    return $date;
}

// Add rental to 30/60/90 slabs
$nextRentalDate = strtotime(date('Y-m-01', $start30));
while ($nextRentalDate <= $end90) {
    $adjustedRental = getAdjustedRentalDate(date('Y', $nextRentalDate), date('m', $nextRentalDate));

    if ($adjustedRental >= $start30 && $adjustedRental < $end30) {
        $totals30['rental_weetangera'] += $rentalAmount;
    } elseif ($adjustedRental >= $start60 && $adjustedRental < $end60) {
        $totals60['rental_weetangera'] += $rentalAmount;
    } elseif ($adjustedRental >= $start90 && $adjustedRental < $end90) {
        $totals90['rental_weetangera'] += $rentalAmount;
    }

    $nextRentalDate = strtotime("+1 month", $nextRentalDate);
}

// Step 4: Calculate total_turnover
$totals30['total_turnover'] = $totals30['customer_design_total'] + $totals30['deposit_total'] + $totals30['planning_total'] + $totals30['progress_payment_total'] + $totals30['rental_weetangera'];
$totals60['total_turnover'] = $totals60['customer_design_total'] + $totals60['deposit_total'] + $totals60['planning_total'] + $totals60['progress_payment_total'] + $totals60['rental_weetangera'];
$totals90['total_turnover'] = $totals90['customer_design_total'] + $totals90['deposit_total'] + $totals90['planning_total'] + $totals90['progress_payment_total'] + $totals90['rental_weetangera'];

$fwViewData['totals30'] = array_map('setCurrencyValue', $totals30);
$fwViewData['totals60'] = array_map('setCurrencyValue', $totals60);
$fwViewData['totals90'] = array_map('setCurrencyValue', $totals90);
