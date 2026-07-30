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

$weekPeriod = [];
$startOfWeek = strtotime('monday this week');

for ($i = 0; $i < 12; $i++) {
    $weekStart = strtotime("+$i week", $startOfWeek);
    $weekEnd   = strtotime("+6 days", $weekStart);

    $weekPeriod[$i] = [
        'start_ts' => $weekStart,
        'end_ts'   => $weekEnd,
        'label'    => date('d-M', $weekStart) . ' - ' . date('d-M-Y', $weekEnd),
        'customer_design_total' => 0,
        'planning_deposit_total' => 0,
        'progress_payment_total' => 0,
        'inclusions_variations_total' => 0,
        'completed_projects_total' => 0,
        'rental_weetangera' => hasFirstOfMonth(date('Y-m-d', $weekStart), date('Y-m-d', $weekEnd)) ? 5041.67 : 0,
    ];
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

$sql = "SELECT b.bsn_id, b.bsn_name, b.bsn_status, b.bsn_dair_amount, b.bsn_cip_com_on_date FROM business_sellers bs INNER JOIN business b ON bs.bs_business_id = b.bsn_id WHERE bs.bs_xor_hide = 0 AND ( ( b.bsn_status LIKE '%|12|%' AND b.bsn_id IN (SELECT dpn_bsn_id FROM document_proposal_name WHERE dpn_dr_hide = 0 AND dpn_dr_type_new = 2) ) OR b.bsn_status LIKE '%|2|%' OR b.bsn_status LIKE '%|3|%' OR b.bsn_status LIKE '%|4|%' OR b.bsn_status LIKE '%|5|%' OR b.bsn_status LIKE '%|6|%' ) GROUP BY b.bsn_id";
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

$sql = 'SELECT ppd_bsn_id, ppd_stage, ppd_hia_value, ppd_invoice_sent, ppd_inv_due_date, ppd_invoice_sent_date FROM progress_payment_detail WHERE ppd_bsn_id IN (' . implode(',', $bsnIdsArray) . ')';
$result = $fwDb->query($sql);
$paymentDetailArray = [];
foreach ($result as $row) {
    if (!isset($paymentDetailArray[$row['ppd_bsn_id']])) {
        $paymentDetailArray[$row['ppd_bsn_id']] = [];
    }
    $paymentDetailArray[$row['ppd_bsn_id']][$row['ppd_stage']] = [
        'amount' => getRawNumber($row['ppd_hia_value']),
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
        $proposalDeliveryDate = date('d-M-Y', $time);
        $cdaDate = date('d-M-Y', strtotime($proposalDeliveryDate . ' +60 days'));
    }

    $hiaSignupDate = '';
    $depositDate = '';
    $planningSubmittedDate = '';
	
	if ($row['bsn_status'] === '|12|') {
		if (isset($proposalTasksArray[$bsnID]) && isset($proposalTasksArray[$bsnID][8]) && strtotime($proposalTasksArray[$bsnID][8]['completed_date']) > 0 && $time = strtotime($proposalTasksArray[$bsnID][8]['completed_date'])) {
			$hiaSignupDate = date('d-M-Y', strtotime($proposalDeliveryDate . ' +60 days'));
		}
	} else {
		if (isset($documentChecklistArray[$bsnID]) && isset($documentChecklistArray[$bsnID][64]) && strtotime($documentChecklistArray[$bsnID][64]['completed_date']) > 0 && $time = strtotime($documentChecklistArray[$bsnID][64]['completed_date'])) {
			$hiaSignupDate = date('d-M-Y', $time);
		}
	}

    if (isset($documentChecklistArray[$bsnID]) && isset($documentChecklistArray[$bsnID][64]) && strtotime($documentChecklistArray[$bsnID][64]['completed_date']) > 0 && $time = strtotime($documentChecklistArray[$bsnID][64]['completed_date'])) {
        $depositDate = date('d-M-Y', strtotime($hiaSignupDate . ' +14 days'));
        $planningSubmittedDate = date('d-M-Y', strtotime($hiaSignupDate . ' +56 days'));
    }
    $onsiteDate = '';
    $floorSystemCompleteDate = '';
    $wallRoofFramesCompleteDate = '';
    $closeUpCompleteDate = '';
    $fixingsCompleteDate = '';
    $paintingCompleteDate = '';
    $projectCompleteDate = '';
    if (strtotime($row['bsn_cip_com_on_date']) > 0 && $time = strtotime($row['bsn_cip_com_on_date'])) {
        $onsiteDate = date('d-M-Y', $time);
        $floorSystemCompleteDate = date('d-M-Y', strtotime($onsiteDate . ' +25 days'));
        $wallRoofFramesCompleteDate = date('d-M-Y', strtotime($floorSystemCompleteDate . ' +10 days'));
        $closeUpCompleteDate = date('d-M-Y', strtotime($wallRoofFramesCompleteDate . ' +30 days'));
        $fixingsCompleteDate = date('d-M-Y', strtotime($closeUpCompleteDate . ' +30 days'));
        $paintingCompleteDate = date('d-M-Y', strtotime($fixingsCompleteDate . ' +10 days'));
        $projectCompleteDate = date('d-M-Y', strtotime($paintingCompleteDate . ' +30 days'));
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
	
	$initialDepositValue = 0;
	$submissionOfPlansToRelevantEntitiesValue = 0;
	$receiptOfFinalisedStampedPlansValue = 0;
	
	$initialDepositDueDate = '';
	$submissionOfPlansToRelevantEntitiesDueDate = '';
	$receiptOfFinalisedStampedPlansDueDate = '';
	
	$initialDepositValue = isset($paymentDetailArray[$bsnID]['Initial Deposit']) ? $paymentDetailArray[$bsnID]['Initial Deposit']['amount'] : 0;
	$submissionOfPlansToRelevantEntitiesValue = isset($paymentDetailArray[$bsnID]['Submission of Plans to Relevant Entities']) ? $paymentDetailArray[$bsnID]['Submission of Plans to Relevant Entities']['amount'] : 0;
	$receiptOfFinalisedStampedPlansValue = isset($paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']) ? $paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']['amount'] : 0;
	
	$initialDepositDueDate = isset($paymentDetailArray[$bsnID]['Initial Deposit']) ? $paymentDetailArray[$bsnID]['Initial Deposit']['invoice_due_date'] : '';
	$submissionOfPlansToRelevantEntitiesDueDate = isset($paymentDetailArray[$bsnID]['Submission of Plans to Relevant Entities']) ? $paymentDetailArray[$bsnID]['Submission of Plans to Relevant Entities']['invoice_due_date'] : '';
	$receiptOfFinalisedStampedPlansDueDate = isset($paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']) ? $paymentDetailArray[$bsnID]['Receipt of Finalised Stamped Plans']['invoice_due_date'] : '';
	
	if ($row['bsn_status'] === '|12|') {
        if (isset($proposalTasksArray[$bsnID]) && isset($proposalTasksArray[$bsnID][8])) {
            $dpn_dr_estimate_cost = $proposalTasksArray[$bsnID][8]['dpn_dr_estimate_cost'];
            $tempArray = explode(' ', $dpn_dr_estimate_cost);
            if (isset($tempArray[0])) {
                $hiaValue = getRawNumber($tempArray[0]);
                // db($hiaValue);
            }
        }
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
            //$depositValue = $a + $planningSubmittedValue;
			
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
    /* if (strpos($row['bsn_status'], '|2|') !== false) {
        $totalProjectValueForPlanning += $totalProjectValue;
    } */
	
	//$inclPlanningStatus = strpos($row['bsn_status'], '|2|')  !== false || strpos($row['bsn_status'], '|5|')  !== false || strpos($row['bsn_status'], '|18|') !== false;
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
	$lastVariationInvoiceDate = isset($data_inv_date['ppd_invoice_sent_date']) ? date('d-M-Y', strtotime($data_inv_date['ppd_invoice_sent_date'])) : '';

    $data = [
        'sn' => $sn++,
        'bsn_id' => $bsnID,
        'bsn_name' => $row['bsn_name'],
		'project_status' => $status,
        // 'proposal_delivery_date' => implode('<br>', $proposalDeliveryDate)
        'proposal_delivery_date' => $proposalDeliveryDate,
        'cda_date' => $cdaDate,
        'cda_value' => setCurrencyValue($cdaValue),
        'hia_signup_date' => $hiaSignupDate,
        'hia_value' => setCurrencyValue($hiaValue),
		'inclusions_date' => $lastVariationInvoiceDate,
        'inclusions_value' => setCurrencyValue($inclusionValue),
        'total_project_value' => setCurrencyValue($totalProjectValue),
		'initial_deposit_due_date' => $initialDepositDueDate,
		'initial_deposit_value' => setCurrencyValue($initialDepositValue),
		'submission_of_plans_to_relevant_entities_due_date' => $submissionOfPlansToRelevantEntitiesDueDate,
		'submission_of_plans_to_relevant_entities_value' => setCurrencyValue($submissionOfPlansToRelevantEntitiesValue),
		'receipt_of_finalised_stamped_plans_due_date' => $receiptOfFinalisedStampedPlansDueDate,
		'receipt_of_finalised_stamped_plans_value' => setCurrencyValue($receiptOfFinalisedStampedPlansValue),
        'deposit_date' => $depositDate,
        'deposit_value' => setCurrencyValue($depositValue),
        'planning_submitted_date' => $planningSubmittedDate,
        'planning_submitted_value' => setCurrencyValue($planningSubmittedValue),
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
	
	//$bsnID = $row['bsn_id'];
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
	
	/*PLANNING DEPOSITS */
   	$initialDepositDueDate = strtotime($initialDepositDueDate);
	$submissionOfPlansToRelevantEntitiesDueDate = strtotime($submissionOfPlansToRelevantEntitiesDueDate);
	$receiptOfFinalisedStampedPlansDueDate = strtotime($receiptOfFinalisedStampedPlansDueDate);
	$depositDate = strtotime($depositDate);
	$planningSubmittedDate = strtotime($planningSubmittedDate);

	$planningStages = [
		$initialDepositDueDate => $initialDepositValue,
		$submissionOfPlansToRelevantEntitiesDueDate => $submissionOfPlansToRelevantEntitiesValue,
		$receiptOfFinalisedStampedPlansDueDate => $receiptOfFinalisedStampedPlansValue,
		$depositDate => $depositValue,
		$planningSubmittedDate => $planningSubmittedValue
	];

	foreach ($planningStages as $dueDate => $amount) {
		// Skip invalid dates or zero amounts
		if (!$dueDate || $amount <= 0) {
			continue;
		}

		foreach ($weekPeriod as &$week) {
			if (isDateInRange($dueDate, $week['start_ts'], $week['end_ts'])) {
				$week['planning_deposit_total'] += $amount;
				break;
			}
		}
		unset($week);
	}
	
	/*PROGRESS PAYMENT DATES */
	$floorSystemCompleteDate = strtotime($floorSystemCompleteDate);
	$wallRoofFramesCompleteDate = strtotime($wallRoofFramesCompleteDate);
	$closeUpCompleteDate = strtotime($closeUpCompleteDate);
	$fixingsCompleteDate = strtotime($fixingsCompleteDate);
	$paintingCompleteDate = strtotime($paintingCompleteDate);
	$projectCompleteDate = strtotime($projectCompleteDate);
	
	$progressStages = [
		$floorSystemCompleteDate => $floorSystemCompleteValue,
		$wallRoofFramesCompleteDate => $wallRoofFramesCompleteValue,
		$closeUpCompleteDate => $closeUpCompleteValue,
		$fixingsCompleteDate => $fixingsCompleteValue,
		$paintingCompleteDate => $paintingCompleteValue,
		$projectCompleteDate => $projectCompleteValue
	];
	
	foreach($progressStages as $dueDate => $amount) {
		if (!$dueDate || $amount <= 0) {
			continue;
		}

		foreach($weekPeriod as &$week) {
			if (isDateInRange($dueDate, $week['start_ts'], $week['end_ts'])) {
				$week['progress_payment_total'] += $amount;
				break;
			}
		}
		unset($week);
	}
	
	/*INCLUSIONS / VARIATIONS */
	$lastVariationInvoiceDate = strtotime($lastVariationInvoiceDate);
	$inclvariationStages = [
		$lastVariationInvoiceDate => $inclusionValue
	];
	
	foreach($inclvariationStages as $dueDate => $amount) {
		if (!$dueDate || $amount <= 0) {
			continue;
		}

		foreach($weekPeriod as &$week) {
			if (isDateInRange($dueDate, $week['start_ts'], $week['end_ts'])) {
				$week['inclusions_variations_total'] += $amount;
				break; // stop once assigned to a week
			}
		}
		unset($week);
	}
	
	/*COMPLETED PROJECTS (Project Completion) */
	$projectCompleteDate = strtotime($projectCompleteDate);
	$completeStages = [
		$projectCompleteDate => $projectCompleteValue
	];
	
	foreach($completeStages as $dueDate => $amount) {
		if (!$dueDate || $amount <= 0) {
			continue;
		}

		foreach($weekPeriod as &$week) {
			if (isDateInRange($dueDate, $week['start_ts'], $week['end_ts'])) {
				$week['completed_projects_total'] += $amount;
				break;
			}
		}
		unset($week);
	}
	
	// Calculate total turnover for each week
	foreach ($weekPeriod as &$week) {
		$week['total_turnover'] =
			$week['customer_design_total'] +
			$week['planning_deposit_total'] +
			$week['progress_payment_total'] +
			$week['inclusions_variations_total'] +
			$week['completed_projects_total'] +
			$week['rental_weetangera'];
	}
	unset($week);
}

$fwViewData['weekPeriod'] = $weekPeriod;
$fwViewData['totalProjectValueForDesign'] = setCurrencyValue($totalProjectValueForDesign);
$fwViewData['totalProjectValueForPlanning'] = setCurrencyValue($totalProjectValueForPlanning);
$fwViewData['totalUninvoicedConstructionValue'] = setCurrencyValue($totalUninvoicedConstructionValue);
