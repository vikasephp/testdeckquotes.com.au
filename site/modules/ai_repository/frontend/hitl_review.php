<?php

$did = trim($fwRequest->getParam('did', ''));
$statusFilter = trim($fwRequest->getParam('status', 'open'));
$severityFilter = trim($fwRequest->getParam('severity', ''));

if ($did === '') {
	Location(BASE_URL . 'ai_repository.review_queue');
	exit;
}

$pipelineStatus = array();
$flagData = array('flags' => array());
$isProcessing = false;
$fwViewData['apiError'] = '';

require_once(LIB_DIR . 'AIClass.php');

/**
 * Default content JSON shape for PATCH /{did}/content by location.section.
 */
function hitlContentTemplateForSection($section)
{
	$section = trim((string)$section);
	$headingContent = array(
		'pp_rules', 'pp_completion_criteria', 'pp_trigger_condition', 'pp_outputs',
		'pp_exceptions', 'pp_decision_logic', 'pp_inputs',
	);
	$tableKeys = array(
		'pp_qa', 'pp_improvement', 'pp_table_overview', 'pp_table_prerequisites', 'pp_table_doc_info',
	);

	if ($section === 'pp_title') {
		return array('pp_title' => '');
	}
	if ($section === 'pp_steps' || $section === 'steps') {
		return array(
			'pp_steps' => array(
				array(
					'order' => 1,
					'title' => 'Step title',
					'substeps' => array(
						array('number' => '1', 'title' => 'Substep title', 'children' => array()),
					),
				),
			),
		);
	}
	if ($section === 'pp_references') {
		return array('pp_references' => array('https://example.com'));
	}
	if (in_array($section, $headingContent, true)) {
		return array(
			$section => array(
				'heading' => '',
				'content' => '',
			),
		);
	}
	if (in_array($section, $tableKeys, true)) {
		return array(
			$section => array(
				'heading' => '',
				'headers' => array('Column 1', 'Column 2'),
				'rows' => array(array('Value 1', 'Value 2')),
			),
		);
	}

	// Fallback when section unknown — reviewer can replace key.
	return array(
		'pp_rules' => array(
			'heading' => 'Procedure Rules',
			'content' => '',
		),
	);
}

function hitlBuildProcedureViewUrl($didNormalized, $loc, $flagId)
{
	$query = array();
	if (!empty($loc['section'])) {
		$query['hitl_section'] = $loc['section'];
	}
	if (isset($loc['step_order']) && $loc['step_order'] !== '' && $loc['step_order'] !== null) {
		$query['hitl_step_order'] = (int)$loc['step_order'];
	}
	if (isset($loc['substep_number']) && $loc['substep_number'] !== '' && $loc['substep_number'] !== null) {
		$query['hitl_substep'] = (string)$loc['substep_number'];
	}
	if (array_key_exists('after_substep', $loc) && $loc['after_substep'] !== null) {
		$query['hitl_after_substep'] = (string)$loc['after_substep'];
	}
	if (!empty($flagId)) {
		$query['hitl_flag'] = $flagId;
	}
	return BASE_URL . 'ai_procedure/pd/' . $didNormalized
		. (empty($query) ? '' : ('?' . http_build_query($query)));
}

try {
	$aiObject = new AIClass();
	if (!method_exists($aiObject, 'getDidFlags')) {
		$fwViewData['apiError'] = 'AIClass.php on the server is missing sp-pipeline methods. Please upload the updated site/lib/AIClass.php.';
		$fwViewData['did'] = strtoupper($did);
	} else {
		$pipelineStatus = $aiObject->getPipelineStatus($did);
		$flagData = $aiObject->getDidFlags($did, $statusFilter, $severityFilter);
		$isProcessing = !empty($flagData['pipeline_status'])
			&& in_array($flagData['pipeline_status'], array('pending', 'processing'), true);
		$fwViewData['did'] = $aiObject->normalizeDid($did);

		if (isset($flagData['error'])) {
			$fwViewData['apiError'] = !empty($flagData['error']['message']) ? $flagData['error']['message'] : 'Unable to load flags.';
		} elseif (isset($flagData['success']) && $flagData['success'] === false) {
			$fwViewData['apiError'] = !empty($flagData['message']) ? $flagData['message'] : 'Unable to load flags.';
		}
	}
} catch (Exception $e) {
	$fwViewData['apiError'] = 'HITL review error: ' . $e->getMessage();
	$fwViewData['did'] = strtoupper($did);
}

$didNormalized = isset($fwViewData['did']) ? $fwViewData['did'] : strtoupper($did);
$flags = (isset($flagData['flags']) && is_array($flagData['flags'])) ? $flagData['flags'] : array();

$openCount = 0;
$fixingCount = 0;
$terminalCount = 0;
$firstPreviewUrl = BASE_URL . 'ai_procedure/pd/' . $didNormalized;

foreach ($flags as $idx => $flag) {
	$loc = (isset($flag['location']) && is_array($flag['location'])) ? $flag['location'] : array();
	$status = isset($flag['status']) ? $flag['status'] : '';
	$section = isset($loc['section']) ? $loc['section'] : '';

	if ($status === 'open') {
		$openCount++;
	} elseif ($status === 'fixing') {
		$fixingCount++;
	} elseif (in_array($status, array('fixed', 'rejected', 'needs_manual_edit'), true)) {
		$terminalCount++;
	}

	$viewUrl = hitlBuildProcedureViewUrl($didNormalized, $loc, isset($flag['flag_id']) ? $flag['flag_id'] : '');
	$flags[$idx]['procedure_view_url'] = $viewUrl;
	$flags[$idx]['issue_summary'] = isset($flag['issue_summary']) ? $flag['issue_summary'] : '';
	$flags[$idx]['content_template_json'] = json_encode(
		hitlContentTemplateForSection($section),
		JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE
	);

	if ($idx === 0 || ($status === 'open' && $firstPreviewUrl === BASE_URL . 'ai_procedure/pd/' . $didNormalized)) {
		$firstPreviewUrl = $viewUrl;
	}
}

// Prefer first open flag for initial iframe preview.
foreach ($flags as $flag) {
	if ((isset($flag['status']) ? $flag['status'] : '') === 'open' && !empty($flag['procedure_view_url'])) {
		$firstPreviewUrl = $flag['procedure_view_url'];
		break;
	}
}

$hitlStatus = '';
if (!empty($pipelineStatus['hitl_status'])) {
	$hitlStatus = $pipelineStatus['hitl_status'];
} elseif (!empty($flagData['hitl_status'])) {
	$hitlStatus = $flagData['hitl_status'];
}

$isApproved = ($hitlStatus === 'approved');
$allTerminal = (!$isProcessing && count($flags) > 0 && $openCount === 0 && $fixingCount === 0);
$flagsCountApi = isset($flagData['flags_count']) ? (int)$flagData['flags_count'] : count($flags);
$openFlagsApi = isset($flagData['open_flags']) ? (int)$flagData['open_flags'] : $openCount;

$fwViewData['pipelineStatus'] = $pipelineStatus;
$fwViewData['flagData'] = $flagData;
$fwViewData['flags'] = $flags;
$fwViewData['isProcessing'] = $isProcessing;
$fwViewData['statusFilter'] = $statusFilter;
$fwViewData['severityFilter'] = $severityFilter;
$fwViewData['hitlActionUrl'] = BASE_URL . $XFA['hitl_action'];
$fwViewData['hitlReviewUrl'] = BASE_URL . $XFA['hitl_review'];
$fwViewData['procedureBaseUrl'] = BASE_URL . 'ai_procedure/pd/' . $didNormalized;
$fwViewData['procedurePreviewUrl'] = $firstPreviewUrl;
$fwViewData['hitlStatus'] = $hitlStatus;
$fwViewData['isApproved'] = $isApproved;
$fwViewData['allTerminal'] = $allTerminal;
$fwViewData['openCount'] = $openCount;
$fwViewData['fixingCount'] = $fixingCount;
$fwViewData['terminalCount'] = $terminalCount;
$fwViewData['flagsCountApi'] = $flagsCountApi;
$fwViewData['openFlagsApi'] = $openFlagsApi;
$fwViewData['title'] = 'HITL Review - ' . $didNormalized;
$fwViewData['hitlJsConfig'] = json_encode(array(
	'did' => $didNormalized,
	'actionUrl' => BASE_URL . $XFA['hitl_action'],
	'reviewUrl' => BASE_URL . $XFA['hitl_review'],
	'isProcessing' => $isProcessing ? true : false,
	'isApproved' => $isApproved ? true : false,
	'hasFixing' => $fixingCount > 0,
));
