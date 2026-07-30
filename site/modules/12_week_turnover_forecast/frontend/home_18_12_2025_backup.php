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

$sql = "SELECT b.bsn_id, b.bsn_name, b.bsn_status, b.bsn_dair_amount, b.bsn_cip_com_on_date
        FROM business b
        LEFT JOIN business_sellers bs ON bs.bs_business_id = b.bsn_id
        WHERE (b.bsn_status LIKE '%|2|%' OR b.bsn_status LIKE '%|3|%')
        AND (bs.bs_xor_hide = 0 OR bs.bs_xor_hide IS NULL)";
$projects = $fwDb->query($sql);

$bsnIds = array_column($projects, 'bsn_id');
if (empty($bsnIds)) {
    $fwViewData['weekPeriod'] = $weekPeriod;
    return;
}

$sql = "SELECT bt_bsn_id, bt_completed_date
        FROM proposal_tasks
        WHERE bt_task_id = 8 AND bt_bsn_id IN (" . implode(',', $bsnIds) . ")";
$cdaRows = $fwDb->query($sql);
$cdaDates = [];
foreach ($cdaRows as $r) {
    if (strtotime($r['bt_completed_date']) > 0) {
        $cdaDates[$r['bt_bsn_id']] = strtotime('+60 days', strtotime($r['bt_completed_date']));
    }
}

$sql = "SELECT ppd_bsn_id, ppd_stage, ppd_hia_value, ppd_inv_due_date
        FROM progress_payment_detail
        WHERE ppd_bsn_id IN (" . implode(',', $bsnIds) . ")";
$paymentRows = $fwDb->query($sql);

$payments = [];
foreach ($paymentRows as $r) {
    $payments[$r['ppd_bsn_id']][$r['ppd_stage']] = [
        'amount' => getRawNumber($r['ppd_hia_value']),
        'due_date' => $r['ppd_inv_due_date'],
    ];
}

foreach ($projects as $project) {
    $bsnID = $project['bsn_id'];

    /*CUSTOMER DESIGN (CDA) */
    if (!empty($cdaDates[$bsnID])) {
        $cdaTs = $cdaDates[$bsnID];
        $cdaValue = getRawNumber($project['bsn_dair_amount']);

        foreach ($weekPeriod as &$week) {
            if ($cdaTs >= $week['start_ts'] && $cdaTs <= $week['end_ts']) {
                $week['customer_design_total'] += $cdaValue;
                break;
            }
        }
        unset($week);
    }

    /*PLANNING DEPOSITS */
    $planningStages = [
        'Initial Deposit',
        'Submission of Plans to Relevant Entities',
        'Receipt of Finalised Stamped Plans',
        'Deposit',
        'Planning Approvals Submitted'
    ];
    foreach ($planningStages as $stage) {
        if (!isset($payments[$bsnID][$stage])) continue;
        $amount = $payments[$bsnID][$stage]['amount'];
        $dueDate = $payments[$bsnID][$stage]['due_date'];
        foreach ($weekPeriod as &$week) {
            if (isDateInRange($dueDate, $week['start_ts'], $week['end_ts'])) {
                $week['planning_deposit_total'] += $amount;
                break;
            }
        }
        unset($week);
    }

    /*PROGRESS PAYMENT DATES */
    $onsiteTs = strtotime($project['bsn_cip_com_on_date']);
    if ($onsiteTs <= 0) continue;

    $dates = [
        'Floor Systems Complete'        => strtotime('+25 days', $onsiteTs),
        'Wall and Roof Frames Complete' => strtotime('+35 days', $onsiteTs), // 25+10
        'Close Up Complete'             => strtotime('+65 days', $onsiteTs), // 25+10+30
        'Fixing Complete'               => strtotime('+95 days', $onsiteTs), // +30
        'Painting Complete'             => strtotime('+105 days', $onsiteTs), // +10
        'Project Completion'            => strtotime('+135 days', $onsiteTs), // +30
    ];

    foreach ($dates as $stage => $stageTs) {
        $amount = $payments[$bsnID][$stage]['amount'] ?? 0;
        foreach ($weekPeriod as &$week) {
            if ($stageTs >= $week['start_ts'] && $stageTs <= $week['end_ts']) {
                if ($stage === 'Inclusions / Variations') {
                    $week['inclusions_variations_total'] += $amount;
                } else {
                    $week['progress_payment_total'] += $amount;
                }
            }
        }
        unset($week);
    }

    /*INCLUSIONS / VARIATIONS */
	if (isset($payments[$bsnID])) {
		//echo "BSN_ID: {$bsnID}<br>";
		foreach ($payments[$bsnID] as $stageName => $stageData) {
			$amount = $stageData['amount'];
			$dueDateTs = strtotime($stageData['due_date']);
			foreach ($weekPeriod as &$week) {
				if ($dueDateTs >= $week['start_ts'] && $dueDateTs <= $week['end_ts']) {
					if (stripos($stageName, 'inclusion') !== false || stripos($stageName, 'variation') !== false) {
						$week['inclusions_variations_total'] += $amount;
					} else {
						$week['progress_payment_total'] += $amount;
					}
				}
			}
			unset($week);
		}
	}

    /*COMPLETED PROJECTS (Project Completion) */
    $completionTs = $dates['Project Completion'];
    $completionValue = $payments[$bsnID]['Project Completion']['amount'] ?? 0;
    foreach ($weekPeriod as &$week) {
        if ($completionTs >= $week['start_ts'] && $completionTs <= $week['end_ts']) {
            $week['completed_projects_total'] += $completionValue;
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

foreach ($projects as $project) {
    $bsnID = $project['bsn_id'];

    // Customer Design (CDA)
    if (!empty($cdaDates[$bsnID])) {
        $design_stage_total += getRawNumber($project['bsn_dair_amount']);
    }

    // Planning Deposits
    $planningStages = [
        'Initial Deposit',
        'Submission of Plans to Relevant Entities',
        'Receipt of Finalised Stamped Plans',
        'Deposit',
        'Planning Approvals Submitted'
    ];
    foreach ($planningStages as $stage) {
        if (isset($payments[$bsnID][$stage])) {
            $planning_stage_total += $payments[$bsnID][$stage]['amount'];
        }
    }

    // Progress Payments + Inclusions/Variations (Construction but not invoiced)
    if (isset($payments[$bsnID])) {
        foreach ($payments[$bsnID] as $stageName => $stageData) {
            $amount = $stageData['amount'];
            if (stripos($stageName, 'inclusion') !== false || stripos($stageName, 'variation') !== false) {
                $construction_stage_total += $amount;
            } elseif (!in_array($stageName, $planningStages) && $stageName != 'Project Completion') {
                $construction_stage_total += $amount;
            }
        }
    }
}

$fwViewData['weekPeriod'] = $weekPeriod;
//echo "<pre>"; print_r($weekPeriod); exit();

function currencyValue($value)
{
    if ($value == '') {
        return '';
    }
    if ($value < 0) {
        return '-$' . number_format(abs($value), 2);
    }
    return '$' . number_format($value, 2);
}


function rawNumber($value)
{
    $value = str_replace(['$', ','], '', $value);
    return is_numeric($value) ? (float)$value : 0;
}

/* -------------------------------------------------
   1. Fetch projects (SOURCE OF $records)
--------------------------------------------------*/
$sql = "SELECT DISTINCT bsn_id, bsn_name, bsn_status, bsn_dair_amount, bsn_cip_com_on_date FROM business LEFT JOIN business_sellers AS business_sellers ON business_sellers.bs_business_id = business.bsn_id WHERE ((bsn_status like '|12|' AND bsn_id IN ( SELECT dpn_bsn_id FROM document_proposal_name WHERE dpn_dr_hide = 0 AND dpn_dr_type_new = 2 )) OR bsn_status LIKE '%|2|%' OR bsn_status LIKE '%|3|%' OR bsn_status LIKE '%|4|%' ) AND (business_sellers.bs_xor_hide = 0 OR business_sellers.bs_xor_hide IS NULL)";
$records = $fwDb->query($sql);

if (empty($records)) {
    $totalProjectValueForDesign = 0;
    $totalProjectValueForPlanning = 0;
    $totalUninvoicedConstructionValue = 0;
    return;
}

/* -------------------------------------------------
   2. Collect BSN IDs
--------------------------------------------------*/
$bsnIds = array_column($records, 'bsn_id');

/* -------------------------------------------------
   3. DESIGN estimate (proposal task 8)
--------------------------------------------------*/
$sql = 'SELECT PT.bt_bsn_id, PT.bt_completed_date, PT.bt_task_id, PT.bt_task_list_number, DPN.dpn_id, DPN.dpn_bsn_id, DPN.dpn_proposal_number, DPN.dpn_unique_id, DPN.dpn_dr_estimate_cost FROM proposal_tasks AS PT INNER JOIN document_proposal_name AS DPN ON DPN.dpn_proposal_number = PT.bt_task_list_number AND DPN.dpn_bsn_id = PT.bt_bsn_id WHERE PT.bt_bsn_id IN (' . implode(',', $bsnIds) . ') AND PT.bt_task_id IN (8) AND DPN.dpn_proposal_number = 1';
$result = $fwDb->query($sql);

$designEstimate = [];
foreach ($result as $row) {
    $tmp = explode(' ', $row['dpn_dr_estimate_cost']);
    $designEstimate[$row['bt_bsn_id']] = rawNumber($tmp[0] ?? 0);
}

/* -------------------------------------------------
   4. Payment stages + invoice flag
--------------------------------------------------*/
$sql = 'SELECT ppd_bsn_id, ppd_stage, ppd_hia_value, ppd_invoice_sent, ppd_inv_due_date, ppd_invoice_sent_date FROM progress_payment_detail WHERE ppd_bsn_id IN (' . implode(',', $bsnIds) . ')';

$result = $fwDb->query($sql);

$paymentData = [];
foreach ($result as $row) {
    $paymentData[$row['ppd_bsn_id']][$row['ppd_stage']] = [
        'amount'       => rawNumber($row['ppd_hia_value']),
        'invoice_sent' => $row['ppd_invoice_sent']
    ];
}

/* -------------------------------------------------
   5. Variations / Inclusions
--------------------------------------------------*/
$sql = 'SELECT va_bsn_id, va_values FROM bus_variations WHERE va_bsn_id IN (' . implode(',', $bsnIds) . ')';
$result = $fwDb->query($sql);

$variationTotals = [];
foreach ($result as $row) {
    $variationTotals[$row['va_bsn_id']] =
        ($variationTotals[$row['va_bsn_id']] ?? 0) + rawNumber($row['va_values']);
}

/* -------------------------------------------------
   6. FINAL TOTAL CALCULATIONS
--------------------------------------------------*/
$totalProjectValueForDesign = 0;
$totalProjectValueForPlanning = 0;
$totalUninvoicedConstructionValue = 0;

foreach ($records as $row) {

    $bsnID   = $row['bsn_id'];
    $status  = $row['bsn_status'];
    $incls   = $variationTotals[$bsnID] ?? 0;

    /* -------- DESIGN (|12|) -------- */
    if (strpos($status, '|12|') !== false) {
        $hia = $designEstimate[$bsnID] ?? 0;
        $totalProjectValueForDesign += ($hia + $incls);
    }

    /* -------- PLANNING (|2|) -------- */
    if (strpos($status, '|2|') !== false) {
        $hia = 0;
        if (isset($paymentData[$bsnID])) {
            foreach ($paymentData[$bsnID] as $stage) {
                $hia += $stage['amount'];
            }
        }
        $totalProjectValueForPlanning += ($hia + $incls);
    }

    /* -------- CONSTRUCTION UNINVOICED (|3|) -------- */
    if (strpos($status, '|3|') !== false && isset($paymentData[$bsnID])) {
        foreach ($paymentData[$bsnID] as $stage) {
            if ($stage['invoice_sent'] === '' || $stage['invoice_sent'] === null) {
                $totalUninvoicedConstructionValue += $stage['amount'];
            }
        }
    }
}

$fwViewData['totalProjectValueForDesign'] = currencyValue($totalProjectValueForDesign);
$fwViewData['totalProjectValueForPlanning'] = currencyValue($totalProjectValueForPlanning);
$fwViewData['totalUninvoicedConstructionValue'] = currencyValue($totalUninvoicedConstructionValue);