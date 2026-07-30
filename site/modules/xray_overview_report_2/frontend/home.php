<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$title = $MODULE_PLURAL;

//$projectType = $fwRequest->getparamget('project', 'construction');
$where = '1=1';
//$fwViewData['project_type'] = $projectType;

$thead = [
    'sn' => [
        'text' => 'S.N.',
        'style' => '',
    ],
    'bsn_name' => [
        'text' => 'Project Address',
        'style' => 'white-space: wrap; word-break: break-word; word-wrap: break-word; max-width: 200px; min-width: 200px;',
    ],
	'project_status' => [
        'text' => 'Status',
        'style' => 'white-space: nowrap;',
    ],
    'proposal_delivery_date' => [
        'text' => 'Proposal<br>Delivery<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'cda_date' => [
        'text' => 'CDA Date',
        'style' => 'white-space: nowrap;',
    ],
    'cda_value' => [
        'text' => 'CDA Value',
        'style' => '',
    ],
    'hia_signup_date' => [
        'text' => 'HIA<br>Sign-up<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'hia_value' => [
        'text' => 'HIA Value',
        'style' => '',
    ],
	'inclusions_date' => [
        'text' => 'Inclusions/<br>Variations<br>Date',
        'style' => '',
    ],
    'inclusions_value' => [
        'text' => 'Inclusions/<br>Variations<br>Value',
        'style' => '',
    ],
    'total_project_value' => [
        'text' => 'Total<br>Project<br>Value',
        'style' => '',
    ],
	'receipt_of_finalised_stamped_plans_due_date' => [
        'text' => 'Receipt of<br>Finalised<br>Stamped<br>Plans<br>Due Date',
        'style' => 'white-space: nowrap;',
    ],
	'receipt_of_finalised_stamped_plans_value' => [
        'text' => 'Receipt of<br>Finalised<br>Stamped<br>Plans<br>Value',
        'style' => 'white-space: nowrap;',
    ],
    'deposit_date' => [
        'text' => 'Deposit<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'deposit_value' => [
        'text' => 'Deposit<br>Value',
        'style' => '',
    ],
	'deposit_paid' => [
        'text' => 'Deposit<br>Paid',
        'style' => '',
    ],
    'planning_submitted_date' => [
        'text' => 'Planning<br>Approvals<br>Submitted<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'planning_submitted_value' => [
        'text' => 'Planning<br>Approvals<br>Submitted<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'planning_submitted_paid' => [
        'text' => 'Planning<br>Approvals<br>Submitted<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'onsite_date' => [
        'text' => 'Onsite<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'floor_system_complete_date' => [
        'text' => 'Floor<br>System<br>Complete<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'floor_system_complete_value' => [
        'text' => 'Floor<br>System<br>Complete<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'floor_system_complete_paid' => [
        'text' => 'Floor<br>System<br>Complete<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'wall_roof_frames_complete_date' => [
        'text' => 'Wall and Roof<br>Frames<br>Complete<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'wall_roof_frames_complete_value' => [
        'text' => 'Wall and Roof<br>Frames<br>Complete<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'wall_roof_frames_complete_paid' => [
        'text' => 'Wall and Roof<br>Frames<br>Complete<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'close_up_complete_date' => [
        'text' => 'Close Up<br>Complete<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'close_up_complete_value' => [
        'text' => 'Close Up<br>Complete<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'close_up_complete_paid' => [
        'text' => 'Close Up<br>Complete<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'fixings_complete_date' => [
        'text' => 'Fixings<br>Complete<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'fixings_complete_value' => [
        'text' => 'Fixings<br>Complete<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'fixings_complete_paid' => [
        'text' => 'Fixings<br>Complete<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'painting_complete_date' => [
        'text' => 'Painting<br>Complete<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'painting_complete_value' => [
        'text' => 'Painting<br>Complete<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'painting_complete_paid' => [
        'text' => 'Painting<br>Complete<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
    'project_complete_date' => [
        'text' => 'Project<br>Completion<br>Date',
        'style' => 'white-space: nowrap;',
    ],
    'project_complete_value' => [
        'text' => 'Project<br>Completion<br>Value',
        'style' => 'white-space: nowrap;',
    ],
	'project_complete_paid' => [
        'text' => 'Project<br>Completion<br>Paid',
        'style' => 'white-space: nowrap;',
    ],
];

function getRawNumber($value)
{
    $value = str_replace('$', '', $value);
    $value = str_replace(',', '', $value);
    return is_numeric($value) ? $value : 0;
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

//$sql = "SELECT b.bsn_id, b.bsn_name, b.bsn_status, b.bsn_dair_amount, b.bsn_cip_com_on_date, ( SELECT dpn.dpn_dcr_value FROM document_proposal_name dpn WHERE dpn.dpn_bsn_id = b.bsn_id AND dpn.dpn_dr_hide = 0 AND dpn.dpn_dcr_go_ahead = 1 AND dpn.dpn_dr_type_new IN (1, 2) AND dpn.dpn_dcr_value IS NOT NULL AND dpn.dpn_dcr_value != '' LIMIT 1 ) AS dpn_dcr_value FROM business_sellers bs INNER JOIN business b ON bs.bs_business_id = b.bsn_id WHERE bs.bs_xor_hide = 0 AND ( ( EXISTS (SELECT 1 FROM document_proposal_name dpn WHERE dpn.dpn_bsn_id = b.bsn_id AND dpn.dpn_dr_hide = 0 AND dpn.dpn_dcr_go_ahead = 1 and dpn_dr_type_new IN (1, 2) and dpn_dcr_value IS NOT NULL and dpn_dcr_value != '') ) OR b.bsn_status LIKE '%|2|%' OR b.bsn_status LIKE '%|3|%' OR b.bsn_status LIKE '%|4|%' OR b.bsn_status LIKE '%|5|%' OR b.bsn_status LIKE '%|6|%' ) GROUP BY b.bsn_id ORDER BY CASE WHEN b.bsn_status LIKE '%|12|%' AND b.bsn_status NOT LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 1 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 2 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 3 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 4 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 5 WHEN b.bsn_status LIKE '%|2|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 6 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status NOT LIKE '%|2|%' AND b.bsn_status NOT LIKE '%|5|%' AND b.bsn_status NOT LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 7 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 8 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 9 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 10 WHEN b.bsn_status LIKE '%|3|%' AND b.bsn_status NOT LIKE '%|4|%' THEN 11 WHEN b.bsn_status LIKE '%|5|%' AND b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 12 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 13 WHEN b.bsn_status LIKE '%|6|%' AND b.bsn_status LIKE '%|4|%' THEN 14 WHEN b.bsn_status LIKE '%|3|%' AND b.bsn_status LIKE '%|4|%' THEN 15 WHEN b.bsn_status LIKE '%|4|%' THEN 16 ELSE 99 END, b.bsn_id";
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
    //$cdaValue = getRawNumber($row['bsn_dair_amount']);
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

    /* $inclusionValue = 0;
    if (isset($busVariationArray[$bsnID]) && $busVariations = $busVariationArray[$bsnID]) {
        foreach ($busVariations as $busVariation) {
            $inclusionValue += $busVariation['amount'];
        }
    } */
	
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
	
    //if ($projectType == 'design_stage_and_like_to_sign') {
	if ($row['bsn_status'] === '|12|') {
       /*  if (isset($proposalTasksArray[$bsnID]) && isset($proposalTasksArray[$bsnID][8])) {
            $dpn_dr_estimate_cost = $proposalTasksArray[$bsnID][8]['dpn_dr_estimate_cost'];
            $tempArray = explode(' ', $dpn_dr_estimate_cost);
            if (isset($tempArray[0])) {
                $hiaValue = getRawNumber($tempArray[0]);
                // db($hiaValue);
            }
        } */
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
	
	//if (strpos($row['bsn_status'], '|3|') !== false) {}
	//marking green if Invoic paid 
	$invoiced_deposit = (
		isset($paymentDetailArray[$bsnID]['Deposit']) && ($paymentDetailArray[$bsnID]['Deposit']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Deposit']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_planning_submitted = (
		isset($paymentDetailArray[$bsnID]['Planning Approvals Submitted']) && ($paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Planning Approvals Submitted']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_floor_system = (
		isset($paymentDetailArray[$bsnID]['Floor Systems Complete']) && ($paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Floor Systems Complete']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_wall_frames = (
		isset($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']) && ($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_close_up = (
		isset($paymentDetailArray[$bsnID]['Close Up Complete']) && ($paymentDetailArray[$bsnID]['Close Up Complete']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Close Up Complete']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_fixing = (
		isset($paymentDetailArray[$bsnID]['Fixing Complete ']) && ($paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Fixing Complete ']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_painting = (
		isset($paymentDetailArray[$bsnID]['Painting Complete']) && ($paymentDetailArray[$bsnID]['Painting Complete']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Painting Complete']['invoice_sent'] !== null)
	) ? 1 : 0;

	$invoiced_completion = (
		isset($paymentDetailArray[$bsnID]['Project Completion']) && ($paymentDetailArray[$bsnID]['Project Completion']['invoice_sent'] !== '' && $paymentDetailArray[$bsnID]['Project Completion']['invoice_sent'] !== null)
	) ? 1 : 0;

	
	$sql_inv_date = "SELECT ppd_invoice_sent_date FROM progress_payment_detail WHERE ppd_bsn_id = $bsnID AND (ppd_stage LIKE '%Variation%' OR ppd_stage LIKE '%Inclusion%') AND ppd_hia_value IS NOT NULL AND (ppd_value IS NULL OR ppd_value = '') ORDER BY ppd_id DESC LIMIT 1";
	$data_inv_date = $fwDb->queryOne($sql_inv_date);
	//$lastVariationInvoiceDate = isset($data_inv_date['ppd_invoice_sent_date']) ? date('d-M-Y', strtotime($data_inv_date['ppd_invoice_sent_date'])) : '';
	$lastVariationInvoiceDate = (!empty($data_inv_date['ppd_invoice_sent_date'])) ? date('d-m-Y', strtotime($data_inv_date['ppd_invoice_sent_date'])) : '';
	
	$depositPaid = isset($paymentDetailArray[$bsnID]['Deposit']['paid_value'])
    ? setCurrencyValue($paymentDetailArray[$bsnID]['Deposit']['paid_value']) : '';

	$planningSubmittedPaid = isset($paymentDetailArray[$bsnID]['Planning Approvals Submitted']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Planning Approvals Submitted']['paid_value']) : '';

	$floorSystemPaid = isset($paymentDetailArray[$bsnID]['Floor Systems Complete']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Floor Systems Complete']['paid_value']) : '';

	$wallFramesPaid = isset($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Wall and Roof Frames Complete']['paid_value']) : '';

	$closeUpPaid = isset($paymentDetailArray[$bsnID]['Close Up Complete']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Close Up Complete']['paid_value']) : '';

	$fixingsPaid = isset($paymentDetailArray[$bsnID]['Fixing Complete ']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Fixing Complete ']['paid_value']) : '';

	$paintingPaid = isset($paymentDetailArray[$bsnID]['Painting Complete']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Painting Complete']['paid_value']) : '';

	$completionPaid = isset($paymentDetailArray[$bsnID]['Project Completion']['paid_value'])
		? setCurrencyValue($paymentDetailArray[$bsnID]['Project Completion']['paid_value']) : '';

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
		'receipt_of_finalised_stamped_plans_due_date' => $receiptOfFinalisedStampedPlansDueDate,
		'receipt_of_finalised_stamped_plans_value' => setCurrencyValue($receiptOfFinalisedStampedPlansValue),
        'deposit_date' => $depositDate,
        'deposit_value' => setCurrencyValue($depositValue),
        'planning_submitted_date' => $planningSubmittedDate,
        //'planning_submitted_value' => setCurrencyValue($planningSubmittedValue),
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
		'deposit_invoiced' => $invoiced_deposit,
		'planning_invoiced' => $invoiced_planning_submitted,
		'floor_system_invoiced' => $invoiced_floor_system,
		'wall_frames_invoiced' => $invoiced_wall_frames,
		'close_up_invoiced' => $invoiced_close_up,
		'fixing_invoiced' => $invoiced_fixing,
		'painting_invoiced' => $invoiced_painting,
		'completion_invoiced' => $invoiced_completion,
		'deposit_paid' => $depositPaid,
		'planning_submitted_paid' => $planningSubmittedPaid,
		'floor_system_complete_paid' => $floorSystemPaid,
		'wall_roof_frames_complete_paid' => $wallFramesPaid,
		'close_up_complete_paid' => $closeUpPaid,
		'fixings_complete_paid' => $fixingsPaid,
		'painting_complete_paid' => $paintingPaid,
		'project_complete_paid' => $completionPaid,
    ];

    $finalList[] = $data;
}

$fwViewData['totalProjectValueForDesign'] = setCurrencyValue($totalProjectValueForDesign);
$fwViewData['totalProjectValueForPlanning'] = setCurrencyValue($totalProjectValueForPlanning);
$fwViewData['totalUninvoicedConstructionValue'] = setCurrencyValue($totalUninvoicedConstructionValue);

$fwViewData['thead'] = $thead;
$fwViewData['total_th'] = count($thead);
$fwViewData['final_list'] = $finalList;
$fwViewData['title'] = $title;

$fwViewData['project_table'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/' . $BASEFOLDER . '/frontend/project_table.tpl';
$fwViewData['project_under_construction'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/' . $BASEFOLDER . '/frontend/project_under_construction.tpl';
$fwViewData['project_under_planning_and_preparation'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/' . $BASEFOLDER . '/frontend/project_under_planning_and_preparation.tpl';
$fwViewData['project_under_design_stage_and_sign'] =  $_SERVER['DOCUMENT_ROOT'] . '/site/modules/' . $BASEFOLDER . '/frontend/project_under_design_stage_and_sign.tpl';

//Export to Excel
$export = $fwRequest->getParam('export', 0);
if ($export > 0) {

    require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
    $objPHPExcel = new PHPExcel();
	
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("XRay Overview Report 2.0")
		->setSubject("XRay Overview Report 2.0")
		->setDescription("XRay Overview Report 2.0 exported to Office 2007 XLSX.")
		->setKeywords("xray overview report 2.0 openxml php")
		->setCategory("XRay Overview Report 2.0 file");

    $sheet = $objPHPExcel->setActiveSheetIndex(0);

    $colIndex = 0;
    foreach ($thead as $key => $th) {
        $colLetter = PHPExcel_Cell::stringFromColumnIndex($colIndex);
        $headerText = strip_tags(str_replace('<br>', ' ', $th['text']));

        $sheet->setCellValue($colLetter . '1', $headerText);
        $sheet->getStyle($colLetter . '1')->getFont()->setBold(true);
        $sheet->getStyle($colLetter . '1')->getAlignment()->setWrapText(true);

        $sheet->getColumnDimension($colLetter)->setAutoSize(true);

        $colIndex++;
    }

    $rowNum = 2;
    foreach ($finalList as $rowData) {
        $colIndex = 0;

        foreach ($thead as $key => $th) {
            $colLetter = PHPExcel_Cell::stringFromColumnIndex($colIndex);

            $value = isset($rowData[$key]) ? $rowData[$key] : '';

            if (is_string($value)) {
                $value = strip_tags(str_replace('<br>', "\n", $value));
            }

            $sheet->setCellValue($colLetter . $rowNum, $value);
            $sheet->getStyle($colLetter . $rowNum)->getAlignment()->setWrapText(true);

            $colIndex++;
        }

        $rowNum++;
    }

    $sheet->setTitle('XRay Overview Report 2.0');
    $objPHPExcel->setActiveSheetIndex(0);

    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="xray_overview_report_2_0.xls"');
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
    header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
    header('Cache-Control: cache, must-revalidate');
    header('Pragma: public');

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output');
    exit;
}
