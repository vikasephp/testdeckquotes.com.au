<?php
	require_once(LIB_DIR . 'AIClass.php');

	$fwViewData['blank_page'] = true;

	function normalizeAvailableVersions(array $versions): array
	{
		$normalized = [];
		foreach ($versions as $version) {
			if (is_string($version) && $version !== '') {
				$normalized[] = [
					'pp_version' => $version,
					'pp_edited_by' => '',
					'pp_effective_from' => '',
					'is_current_version' => false,
				];
			} elseif (is_array($version) && !empty($version['pp_version'])) {
				$normalized[] = [
					'pp_version' => $version['pp_version'],
					'pp_edited_by' => $version['pp_edited_by'] ?? '',
					'pp_effective_from' => $version['pp_effective_from'] ?? '',
					'is_current_version' => !empty($version['is_current_version']),
				];
			}
		}
		return $normalized;
	}

	function formatProcedureVersionDate(?string $dateStr): string
	{
		if ($dateStr === null || trim($dateStr) === '') {
			return '';
		}
		$ts = strtotime($dateStr);
		if ($ts === false) {
			return $dateStr;
		}
		return date('d-m-Y H:i', $ts);
	}

	function convertToDidFormat(array $data)
    {
        $content = [];

        // 1. Overview Table (Intro)
        if (!empty($data['pp_table_overview'])) {
            $content[] = [
                'id' => 'intro',
                'level' => 1,
                'title' => $data['pp_table_overview']['heading'] ?? 'Overview',
                'html' => formatTableSectionHtml($data['pp_table_overview'])
            ];
        }

        // 2. Doc Info Table (Metadata)
        if (!empty($data['pp_table_doc_info'])) {
            $content[] = [
                'id' => 'metadata',
                'level' => 1,
                'title' => $data['pp_table_doc_info']['heading'] ?? 'Document Info',
                'html' => formatTableSectionHtml($data['pp_table_doc_info'])
            ];
        }

        // 3. Prerequisites Table
        if (!empty($data['pp_table_prerequisites'])) {
            $content[] = [
                'id' => 'prerequisites',
                'level' => 1,
                'title' => $data['pp_table_prerequisites']['heading'] ?? 'Prerequisites',
                'html' => formatTableSectionHtml($data['pp_table_prerequisites'])
            ];
        }

		if (!empty($data['pp_trigger_condition'])) {
            $content[] = [
                'id' => 'trigger_condition',
                'level' => 1,
                'title' => $data['pp_trigger_condition']['heading'] ?? 'Trigger Conditions',
                'html' => $data['pp_trigger_condition']['content'] ?? 'No data present',
            ];
        }

		if (!empty($data['pp_completion_criteria'])) {
            $content[] = [
                'id' => 'completion_criteria',
                'level' => 1,
                'title' => $data['pp_completion_criteria']['heading'] ?? 'Completion Criteria',
                'html' => $data['pp_completion_criteria']['content'] ?? 'No data present',
            ];
        }

		if (!empty($data['pp_rules'])) {
            $content[] = [
                'id' => 'rules',
                'level' => 1,
                'title' => $data['pp_rules']['heading'] ?? 'Rules',
                'html' => $data['pp_rules']['content'] ?? 'No data present',
            ];
        }

        // 4. Steps
        if (!empty($data['pp_steps'])) {
            foreach ($data['pp_steps'] as $index => $step) {
                $title = $step['title'] ?? '';
                $level = 1;
                $stepId = computeStepUiId($step, $index);
                $html = buildStepSectionHtml($step);

                if (preg_match('/^(\d+)\.\s/i', $title, $matches)) {
                    $level = 2;
                }

                $content[] = [
                    'id' => $stepId,
                    'level' => $level,
                    'title' => $title,
                    'html' => $html,
                    'step_order' => $index + 1,
                    'pp_section' => 'steps',
                ];

                if (!empty($step['substeps']) && !empty($step['contents_substeps'])) {
                    $level = 2;
                    foreach($step['contents_substeps'] as $i => $substep) {
                        $title = $substep['number'] . '. '. $substep['title'];
                        // Match substep content by title (plain PHP — no Laravel collect()).
                        $html = '';
                        if (!empty($step['substeps']) && is_array($step['substeps'])) {
                            foreach ($step['substeps'] as $ss) {
                                if (isset($ss['title']) && $ss['title'] === $substep['title']) {
                                    $html = isset($ss['content']) ? $ss['content'] : '';
                                    break;
                                }
                            }
                        }

                        $content[] = [
                            'id' => ($stepId . '-' . $level . $i),
                            'level' => $level,
                            'title' => $title,
                            'html' => $html,
                            'step_order' => $index + 1,
                            'substep_number' => $substep['number'] ?? '',
                            'pp_section' => 'steps',
                        ];
                    }
                }
                
                
            }
        }

        // 5. Q&A Table
        if (!empty($data['pp_qa'])) {
			// print_r($data['pp_qa']);
            $content[] = [
                'id' => 'qa',
                'level' => 1,
                'title' => $data['pp_qa']['heading'] ?? 'Q&A',
                'html' => formatTableSectionHtml($data['pp_qa'], true)
            ];
        }

        // 6. Improvement Table
        if (!empty($data['pp_improvement'])) {
            $content[] = [
                'id' => 'improvement',
                'level' => 1,
                'title' => $data['pp_improvement']['heading'] ?? 'Improvement Suggestion',
                'html' => formatTableSectionHtml($data['pp_improvement'])
            ];
        }

        $content = mergeCustomSectionsIntoContent($content, $data);

        return [
            'title' => ($data['pp_title'] ?? ''),
            // 'last-updated' => str_replace('/', '-', $data['pp_doc_last_updated_at'] ?? ''),
            'last-updated' => $data['pp_doc_last_updated_at'],
            'content' => $content,
            'owner' => $data['pp_owner'],
        ];
    }

    function buildProcedureSectionRegistry(array $data): array
    {
        $registry = [];

        $tableSections = [
            'intro' => 'pp_table_overview',
            'metadata' => 'pp_table_doc_info',
            'prerequisites' => 'pp_table_prerequisites',
        ];

        foreach ($tableSections as $sectionId => $field) {
            if (!empty($data[$field])) {
                $registry[$sectionId] = [
                    'title' => ['type' => 'field_heading', 'field' => $field],
                    'content' => ['type' => 'table_html', 'field' => $field],
                ];
            }
        }

        $contentSections = [
            'trigger_condition' => 'pp_trigger_condition',
            'completion_criteria' => 'pp_completion_criteria',
            'rules' => 'pp_rules',
            'inputs' => 'pp_inputs',
            'outputs' => 'pp_outputs',
            'exceptions' => 'pp_exceptions',
            'decision_logic' => 'pp_decision_logic',
        ];

        foreach ($contentSections as $sectionId => $field) {
            if (!empty($data[$field])) {
                $registry[$sectionId] = [
                    'title' => ['type' => 'field_heading', 'field' => $field],
                    'content' => ['type' => 'field_content', 'field' => $field],
                ];
            }
        }

        if (!empty($data['pp_steps'])) {
            foreach ($data['pp_steps'] as $index => $step) {
                $uiId = computeStepUiId($step, $index);

                $title = $step['title'] ?? '';
                $level = 1;
                $stepId = $uiId;

                if (preg_match('/^(\d+)\.\s/i', $title, $matches)) {
                    $level = 2;
                }

                $contentType = (!empty($step['substeps']) && empty($step['contents_substeps']))
                    ? 'step_composite_html'
                    : 'step_body_html';

                $registry[$stepId] = [
                    'title' => ['type' => 'step_title', 'ui_id' => $uiId, 'step_index' => $index],
                    'content' => ['type' => $contentType, 'ui_id' => $uiId, 'step_index' => $index],
                ];

                if (!empty($step['substeps']) && !empty($step['contents_substeps'])) {
                    foreach ($step['contents_substeps'] as $i => $substep) {
                        $subSectionId = $stepId . '-2' . $i;
                        $registry[$subSectionId] = [
                            'title' => ['type' => 'substep_title', 'step_index' => $index, 'sub_index' => $i],
                            'content' => ['type' => 'substep_content', 'step_index' => $index, 'sub_index' => $i],
                        ];
                    }
                }
            }
        }

        if (!empty($data['pp_qa'])) {
            $registry['qa'] = [
                'title' => ['type' => 'field_heading', 'field' => 'pp_qa'],
                'content' => ['type' => 'table_html', 'field' => 'pp_qa'],
            ];
        }

        if (!empty($data['pp_improvement'])) {
            $registry['improvement'] = [
                'title' => ['type' => 'field_heading', 'field' => 'pp_improvement'],
                'content' => ['type' => 'table_html', 'field' => 'pp_improvement'],
            ];
        }

        foreach ($data['pp_custom_sections'] ?? [] as $index => $custom) {
            $uiId = getCustomSectionUiId($custom, $index);
            $registry[$uiId] = [
                'title' => ['type' => 'custom_section_title', 'custom_index' => $index],
                'content' => ['type' => 'custom_section_content', 'custom_index' => $index],
                'is_custom' => true,
            ];
        }

        return $registry;
    }

    function formatTableToHtml(array $table, $includeHeader = false)
    {
        $html = '<table class="table table-bordered">';
        
        if ($includeHeader && !empty($table['headers']) && count($table['headers']) > 0) {
            $hasMeaningfulHeaders = false;
            foreach($table['headers'] as $header) {
                if(!empty($header)) $hasMeaningfulHeaders = true;
            }

            if ($hasMeaningfulHeaders) {
                $html .= '<thead><tr>';
                foreach ($table['headers'] as $header) {
                    $html .= ('<th>' . $header . '</th>');
                }
                $html .= '</tr></thead>';
            }
        }

        $html .= '<tbody>';
        if (!empty($table['rows'])) {
            foreach ($table['rows'] as $row) {
                $html .= '<tr>';
                foreach ($row as $index => $cell) {
                    // $class = ($index === 0 && count($row) > 1) ? ' class="fw-bold"' : '';
                    $class = ($index === 0 && count($row) > 1 && !$includeHeader) ? ' class="fw-bold"' : '';
                    // $cellContent = linkify(nl2br($cell));
                    $cellContent = nl2br($cell);
					
                    // $cellContent = linkify(nl2br(e($cell)));
                    $html .= "<td{$class}>{$cellContent}</td>";
                }
                $html .= '</tr>';
            }
        }
        $html .= '</tbody></table>';

        return $html;
    }

    function formatTableSectionHtml(array $table, $includeHeader = false)
    {
        $html = formatTableToHtml($table, $includeHeader);
        if (!empty($table['content'])) {
            $html .= $table['content'];
        }
        return $html;
    }

    function linkify($text)
    {
        // Linkify emails
        $text = preg_replace('/([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})/', '<a href="mailto:$1">$1</a>', $text);
        // Linkify URLs (basic)
        $text = preg_replace('/(https?:\/\/[^\s<]+)/', '<a href="$1" target="_blank">$1</a>', $text);
        return $text;
    }

    function formatStepBodyToHtml(array $body)
    {
        $html = '';
        foreach ($body as $item) {
            $type = $item['type'] ?? 'html';
            if ($type === 'table') {
                $table = [
                    'heading' => $item['table_heading'] ?? '',
                    'headers' => $item['headers'] ?? [],
                    'rows' => $item['rows'] ?? [],
                ];
                $html .= formatTableToHtml($table, !empty($item['headers']));
            } else {
                $html .= $item['content'] ?? '';
            }
        }
        return $html;
    }

    function renderInlineSubstepsHtml(array $substeps): string
    {
        $html = '<div class="d-flex flex-column gap-3">';
        foreach ($substeps as $substep) {
            $subNum = htmlspecialchars((string)($substep['number'] ?? ''), ENT_QUOTES);
            $html .= '<div class="substep" data-substep-number="' . $subNum . '">';
            $html .= ('<p class="mb-1 substep-title">' . $substep['number'] . '. ' . $substep['title'] . '</p>');
            $html .= '<div class="ps-4 d-flex flex-column gap-1">';
            $children = $substep['children'] ?? [];
            foreach ($children as $child) {
                $html .= '<div class="substep-child">';
                if (isset($child['number'], $child['title'])) {
                    $html .= ('<p class="m-0">' . $child['number'] . '. ' . $child['title'] . '</p>');
                }
                if (isset($child['content'])) {
                    $html .= ('<div class="ps-1">' . $child['content'] . '</div>');
                }
                $html .= '</div>';
            }
            if (isset($substep['content']) && $substep['content'] != '<br>') {
                $html .= ('<div class="content">' . $substep['content'] . '</div>');
            }
            $html .= '</div>';
            $html .= '</div>';
        }
        $html .= '</div>';

        return $html;
    }

    function stepHtmlAlreadyContainsSubsteps(string $bodyHtml, array $substeps): bool
    {
        $bodyPlain = trim(preg_replace('/\s+/', ' ', strip_tags($bodyHtml)));
        if ($bodyPlain === '') {
            return false;
        }

        foreach ($substeps as $substep) {
            $snippet = trim(preg_replace('/\s+/', ' ', strip_tags($substep['content'] ?? '')));
            if (strlen($snippet) >= 40 && stripos($bodyPlain, $snippet) !== false) {
                return true;
            }
        }

        return false;
    }

    function buildStepSectionHtml(array $step): string
    {
        $hasSplitSubsteps = !empty($step['substeps']) && !empty($step['contents_substeps']);
        $html = '';

        if ($hasSplitSubsteps) {
            return $html;
        }

        if (!empty($step['body'])) {
            $html .= formatStepBodyToHtml($step['body']);
        }

        if (!empty($step['substeps']) && empty($step['contents_substeps'])) {
            if ($html === '' || !stepHtmlAlreadyContainsSubsteps($html, $step['substeps'])) {
                $html .= renderInlineSubstepsHtml($step['substeps']);
            }
        }

        return $html;
    }

    function getCustomSectionUiId(array $section, int $index): string
    {
        if (!empty($section['ui_id'])) {
            return (string) $section['ui_id'];
        }

        if (is_numeric($section['section_id'] ?? null)) {
            return 'custom-section-' . (int) $section['section_id'];
        }

        return 'custom-section-' . ($index + 1);
    }

    function formatCustomSectionHtml(array $section): string
    {
        if (!empty($section['body']) && is_array($section['body'])) {
            return formatStepBodyToHtml($section['body']);
        }

        return $section['content'] ?? '<p></p>';
    }

    function mergeCustomSectionsIntoContent(array $content, array $data): array
    {
        $customs = $data['pp_custom_sections'] ?? [];
        if (empty($customs)) {
            return $content;
        }

        $placements = [];
        foreach ($customs as $index => $custom) {
            $uiId = getCustomSectionUiId($custom, $index);
            $insertAt = count($content);
            $afterId = (string) ($custom['after_section_id'] ?? '');

            if ($afterId !== '') {
                foreach ($content as $idx => $row) {
                    if (($row['id'] ?? '') === $afterId) {
                        $insertAt = $idx + 1;
                        break;
                    }
                }
            }

            $placements[] = [
                'index' => $insertAt,
                'item' => [
                    'id' => $uiId,
                    'level' => 1,
                    'title' => $custom['title'] ?? 'New Section',
                    'html' => formatCustomSectionHtml($custom),
                    'is_custom' => true,
                ],
            ];
        }

        usort($placements, function ($a, $b) {
            return $b['index'] <=> $a['index'];
        });

        foreach ($placements as $placement) {
            array_splice($content, $placement['index'], 0, [$placement['item']]);
        }

        return $content;
    }

    function migrateLegacyCustomStepsToCustomSections(array &$data): void
    {
        if (!isset($data['pp_custom_sections']) || !is_array($data['pp_custom_sections'])) {
            $data['pp_custom_sections'] = [];
        }

        $remainingSteps = [];
        foreach ($data['pp_steps'] ?? [] as $index => $step) {
            if (!isCustomProcedureStep($step)) {
                $remainingSteps[] = $step;
                continue;
            }

            $data['pp_custom_sections'][] = [
                'section_id' => is_numeric($step['step_id'] ?? null) ? (int) $step['step_id'] : (count($data['pp_custom_sections']) + 1),
                'ui_id' => computeStepUiId($step, $index),
                'title' => $step['title'] ?? 'New Section',
                'body' => $step['body'] ?? [['type' => 'html', 'content' => '<p></p>', 'block_id' => 'blk_custom_1']],
                'after_section_id' => '',
            ];
        }

        $data['pp_steps'] = $remainingSteps;
    }

    function normalizeCustomSections(array &$data): void
    {
        if (!isset($data['pp_custom_sections']) || !is_array($data['pp_custom_sections'])) {
            $data['pp_custom_sections'] = [];
        }

        $maxId = 0;
        foreach ($data['pp_custom_sections'] as $section) {
            if (is_numeric($section['section_id'] ?? null)) {
                $maxId = max($maxId, (int) $section['section_id']);
            }
        }

        foreach ($data['pp_custom_sections'] as $index => &$section) {
            if (!is_numeric($section['section_id'] ?? null)) {
                $maxId++;
                $section['section_id'] = $maxId;
            } else {
                $section['section_id'] = (int) $section['section_id'];
            }
            $section['ui_id'] = getCustomSectionUiId($section, $index);
            if (!isset($section['body']) || !is_array($section['body'])) {
                $section['body'] = [
                    [
                        'block_id' => 'blk_custom_' . $section['section_id'],
                        'type' => 'html',
                        'content' => $section['content'] ?? '<p></p>',
                        'table_heading' => null,
                        'headers' => null,
                        'rows' => null,
                    ],
                ];
            }
            unset($section['content']);
        }
        unset($section);
    }

    function isCustomProcedureStep(array $step): bool
    {
        if (!empty($step['pp_section_type']) && $step['pp_section_type'] === 'custom') {
            return true;
        }

        foreach ($step['body'] ?? [] as $block) {
            $blockId = (string) ($block['block_id'] ?? '');
            if (strpos($blockId, 'blk_custom_') === 0) {
                return true;
            }
            if (preg_match('/^blk_\d{10,}$/', $blockId)) {
                return true;
            }
        }

        return false;
    }

    function normalizeProcedureSteps(array &$data): void
    {
        if (empty($data['pp_steps']) || !is_array($data['pp_steps'])) {
            $data['pp_steps'] = [];
            return;
        }

        $steps = array_values($data['pp_steps']);
        $unique = [];
        $seenStepIds = [];
        $seenTitles = [];

        foreach ($steps as $step) {
            if (!is_array($step)) {
                continue;
            }

            if (is_numeric($step['step_id'] ?? null)) {
                $key = 'id:' . (int) $step['step_id'];
                if (isset($seenStepIds[$key])) {
                    continue;
                }
                $seenStepIds[$key] = true;
            } else {
                $titleKey = strtolower(trim($step['title'] ?? ''));
                if ($titleKey !== '' && isset($seenTitles[$titleKey])) {
                    continue;
                }
                if ($titleKey !== '') {
                    $seenTitles[$titleKey] = true;
                }
            }

            $unique[] = $step;
        }

        $data['pp_steps'] = $unique;
    }

    function computeStepUiId(array $step, $index): string
    {
        $index = (int) $index;

        if (!empty($step['_ui_id'])) {
            return (string) $step['_ui_id'];
        }

        if (!empty($step['pp_section_type']) && $step['pp_section_type'] === 'custom') {
            $numericId = is_numeric($step['step_id'] ?? null) ? (int) $step['step_id'] : ($index + 1);
            return 'custom-step-' . $numericId;
        }

        if (isCustomProcedureStep($step) && is_numeric($step['step_id'] ?? null)) {
            return 'custom-step-' . (int) $step['step_id'];
        }

        if (is_numeric($step['step_id'] ?? null)) {
            return 'step-' . (int) $step['step_id'];
        }

        return 'step-index-' . ($index + 1);
    }

    function assignProcedureStepUiIds(array &$data): void
    {
        normalizeProcedureSteps($data);

        if (empty($data['pp_steps'])) {
            return;
        }

        $usedIds = [];
        foreach ($data['pp_steps'] as $index => &$step) {
            if (is_numeric($step['step_id'] ?? null)) {
                $step['step_id'] = (int) $step['step_id'];
            }
            unset($step['pp_section_type'], $step['_ui_id'], $step['_step_index']);
            $step['_step_index'] = (int) $index;

            $uiId = computeStepUiId($step, $index);
            $baseUiId = $uiId;
            $suffix = 2;
            while (isset($usedIds[$uiId])) {
                $uiId = $baseUiId . '-n' . $suffix;
                $suffix++;
            }
            $usedIds[$uiId] = true;
            $step['_ui_id'] = $uiId;
        }
        unset($step);
    }

	$pd = $fwRequest->getParam('pd', '');
	$did = preg_replace('/\D/', '', $pd);
	$selectedVersion = trim($fwRequest->getParam('version', ''));

	$content = null;
	$procedureDocument = null;
	$sectionRegistry = [];
	$aiObject = new AIClass;
    $data = $aiObject->getProcedureDocuments($pd, $selectedVersion);
	if (isset($data['status']) && $data['status'] === 'ok') {
		$procedureDocument = $data['data'];
		migrateLegacyCustomStepsToCustomSections($procedureDocument);
		normalizeCustomSections($procedureDocument);
		normalizeProcedureSteps($procedureDocument);
		assignProcedureStepUiIds($procedureDocument);
		$content = convertToDidFormat($procedureDocument);
		$sectionRegistry = buildProcedureSectionRegistry($procedureDocument);
	}

	$sql = 'SELECT * FROM template_docs WHERE dh_id = "' . $did . '"';
	$templateDoc = $fwDb->queryOne($sql);
	$linkedDocs = null;
	$pageTitle = $MODULE_PLURAL;
    $procedureType = null;
	$availableVersions = [];
	if (!empty($procedureDocument['available_versions']) && is_array($procedureDocument['available_versions'])) {
		$availableVersions = $procedureDocument['available_versions'];
	} elseif (!empty($data['available_versions']) && is_array($data['available_versions'])) {
		$availableVersions = $data['available_versions'];
	}
	$availableVersions = normalizeAvailableVersions($availableVersions);
	if ($selectedVersion === '' && !empty($procedureDocument['pp_version'])) {
		$selectedVersion = $procedureDocument['pp_version'];
	}
	if ($selectedVersion === '' && !empty($availableVersions)) {
		foreach ($availableVersions as $versionRow) {
			if (!empty($versionRow['is_current_version'])) {
				$selectedVersion = $versionRow['pp_version'];
				break;
			}
		}
	}
	if(!empty($templateDoc)) {
		$pageTitle = $templateDoc['dh_title'];
		$linkedDocs = $templateDoc['dh_link_word'];
        $procedureType = $templateDoc['dh_procedure_type'] ?? null;
	}

	$sql = 'SELECT * FROM busness_status_task_ai_proc WHERE btp_doc = "' . $did . '"';
	$aiProc = $fwDb->query($sql);
	$linkedTasks = [];
	if(!empty($aiProc)) {
		foreach($aiProc as $proc) {
			$linkedTasks[] = $proc['btp_bst_id'];
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?= $pageTitle ?></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://www.deckquotes.com.au/css/sister-styles.css?v=1.01">
	<style>
		html, body {
			height: auto !important;
			overflow: visible !important;
		}
		body {
			font-size: 13px;
		}
		tbody, td, tfoot, th, thead, tr {
			border-color: inherit;
			border-style: solid;
			border-width: 0;
		}
        ol, ul {
            padding-left: 1rem;
        }
		#menuTable, .clipboard_call, #searchInput, #clearSearchBtn {
			display: none;
		}
		.bg-light-blue {
			background: #e8ebf3 !important;
		}
		.bg-navy {
			background: #163c6d !important;
		}
		.container {
			width: 100%;
			margin: 0;
			padding: 0;
			max-width: 100%;
			margin-top: -3rem !important;
			margin-bottom: -3rem !important;
		}
		.fs-20 {
			font-size: 20px;		
		}
		.fs-24 {
			font-size: 24px;		
		}
		.table {
			margin: 0;
		}
		.text-navy {
			color: #163c6d !important;
		}
		.text-red {
			color: rgb(var(--bs-danger-rgb)) !important;
		}
		.text-white {
			color: #fff !important;
		}
		.position-sticky {
			position: -webkit-sticky !important;
			position: sticky !important;
		}
		.top-4 {
			top: 1.5rem !important;
		}
		.z-10 {
			z-index: 10;
		}
		.section-title-view {
			display: flex;
			align-items: center;
			gap: 8px;
			width: 100%;
			justify-content: space-between;
		}
		.section-title-wrap {
			display: flex;
			align-items: center;
			gap: 8px;
			flex-wrap: wrap;
			width: 100%;
		}
		.section-title-edit {
			cursor: pointer;
			opacity: 0.85;
			line-height: 0;
			flex-shrink: 0;
		}
		.section-title-edit:hover {
			opacity: 1;
		}
		.section-title-edit img {
			height: 28px !important;
			width: 28px !important;
			max-width: 28px !important;
			min-width: 28px !important;
			padding: 0 !important;
			margin: 0 !important;
			border: none !important;
			border-radius: 0 !important;
			background: transparent !important;
			display: inline-block !important;
			vertical-align: middle;
		}
		.section-title-edit-form {
			display: flex;
			align-items: center;
			gap: 8px;
			width: 100%;
		}
		.section-title-edit-form input {
			flex: 1;
			min-width: 200px;
			font-size: inherit;
			font-weight: inherit;
			color: #163c6d;
		}
		.section-title-edit-form .btn {
			font-size: 12px;
			padding: 2px 10px;
			white-space: nowrap;
		}
		.section-content-view {
			position: relative;
		}
		.section-content-toolbar {
			display: flex;
			justify-content: flex-end;
			margin-bottom: 6px;
		}
		.section-content-edit {
			cursor: pointer;
			opacity: 0.85;
			line-height: 0;
		}
		.section-content-edit:hover {
			opacity: 1;
		}
		.section-content-edit img {
			height: 28px !important;
			width: 28px !important;
			max-width: 28px !important;
			min-width: 28px !important;
			padding: 0 !important;
			margin: 0 !important;
			border: none !important;
			border-radius: 0 !important;
			background: transparent !important;
			display: inline-block !important;
			vertical-align: middle;
		}
		.section-content-edit-form {
			display: flex;
			flex-direction: column;
			gap: 8px;
			width: 100%;
		}
		.section-content-edit-form textarea {
			width: 100%;
			min-height: 200px;
			font-family: inherit;
			font-size: 14px;
		}
		.section-content-edit-form .cke {
			width: 100% !important;
		}
		.section-content-edit-form .section-content-edit-actions {
			display: flex;
			gap: 8px;
		}
		.section-content-edit-form .btn {
			font-size: 12px;
			padding: 2px 10px;
			white-space: nowrap;
		}
		.procedure-section-actions {
			display: flex;
			align-items: center;
			gap: 8px;
			margin-left: auto;
		}
		.section-delete {
			font-size: 12px;
			padding: 2px 10px;
		}
		.add-section-bar {
			display: flex;
			justify-content: flex-end;
			margin-bottom: 12px;
		}
		.section-insert-bar {
			display: flex;
			justify-content: center;
			margin: 8px 0 16px;
		}
		.section-add-after {
			font-size: 12px;
			padding: 2px 10px;
		}
		.procedure-versions-wrap {
			position: relative;
			display: inline-block;
			text-align: right;
		}
		.procedure-versions-list {
			display: none;
			position: absolute;
			right: 0;
			top: calc(100% + 4px);
			min-width: 280px;
			max-width: 360px;
			max-height: min(60vh, 400px);
			overflow-x: hidden;
			overflow-y: auto;
			margin: 0;
			padding: 6px 0;
			list-style: none;
			background: #fff;
			border: 1px solid #dee2e6;
			border-radius: 6px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
			z-index: 20;
		}
		.procedure-versions-list.is-open {
			display: block;
		}
		.procedure-versions-list li {
			margin: 0;
		}
		.procedure-version-item {
			display: block;
			width: 100%;
			padding: 8px 14px;
			border: 0;
			background: transparent;
			color: #163c6d;
			text-align: left;
			font-size: 13px;
			text-decoration: none;
			line-height: 1.35;
		}
		.procedure-version-label {
			display: block;
			font-weight: 600;
		}
		.procedure-version-current {
			font-weight: 500;
			font-size: 11px;
			color: #198754;
		}
		.procedure-version-meta {
			display: block;
			margin-top: 2px;
			font-size: 11px;
			color: #666;
		}
		.procedure-version-item:hover,
		.procedure-version-item.is-active {
			background: #f0f6ff;
			color: #163c6d;
		}
		.procedure-version-loader {
			display: none;
			position: fixed;
			inset: 0;
			background: rgba(255, 255, 255, 0.82);
			z-index: 99999;
			align-items: center;
			justify-content: center;
		}
		.procedure-version-loader.is-visible {
			display: flex;
		}
		.procedure-version-loader-box {
			min-width: 260px;
			padding: 24px 28px;
			background: #fff;
			border: 1px solid #dee2e6;
			border-radius: 10px;
			box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
			text-align: center;
			color: #163c6d;
			font-size: 14px;
			font-weight: 600;
		}
		.procedure-version-loader-spinner {
			width: 42px;
			height: 42px;
			margin: 0 auto 14px;
			border: 4px solid #d9e6f5;
			border-top-color: #163c6d;
			border-radius: 50%;
			animation: procedureVersionSpin 0.8s linear infinite;
		}
		@keyframes procedureVersionSpin {
			to { transform: rotate(360deg); }
		}
		.procedure-section.hitl-highlight,
		.substep.hitl-highlight {
			outline: 3px solid #fd7e14;
			background: #fff8ef;
			border-radius: 6px;
			scroll-margin-top: 90px;
		}
		.hitl-missing-marker {
			margin: 8px 0;
			padding: 8px 12px;
			border: 2px dashed #dc3545;
			border-radius: 6px;
			background: #fff5f5;
			color: #842029;
			font-size: 13px;
			font-weight: 600;
		}

		#body-section img {
			padding: .25rem;
			background-color: var(--bs-body-bg);
			border: var(--bs-border-width) solid var(--bs-border-color);
			border-radius: var(--bs-border-radius);
			max-width: 100%;
			height: auto;
			margin-bottom: 1rem;
			max-width: 800px;
			display: block;
		}
		#body-section table {
			border-collapse: collapse;
			margin: 0;
			--bs-table-color-type: initial;
			--bs-table-bg-type: initial;
			--bs-table-color-state: initial;
			--bs-table-bg-state: initial;
			--bs-table-color: var(--bs-emphasis-color);
			--bs-table-bg: var(--bs-body-bg);
			--bs-table-border-color: var(--bs-border-color);
			--bs-table-accent-bg: transparent;
			--bs-table-striped-color: var(--bs-emphasis-color);
			--bs-table-striped-bg: rgba(var(--bs-emphasis-color-rgb), 0.05);
			--bs-table-active-color: var(--bs-emphasis-color);
			--bs-table-active-bg: rgba(var(--bs-emphasis-color-rgb), 0.1);
			--bs-table-hover-color: var(--bs-emphasis-color);
			--bs-table-hover-bg: rgba(var(--bs-emphasis-color-rgb), 0.075);
			width: 100%;
			margin-bottom: 1rem;
			vertical-align: top;
			border-color: var(--bs-table-border-color);
		}

		#body-section table > :not(caption) > * {
			border-width: var(--bs-border-width) 0;
		}

		#body-section table > :not(caption) > * > * {
			border-width: 0 var(--bs-border-width);
		}
		#body-section table > :not(caption) > * > * {
			padding: .5rem .5rem;
			color: var(--bs-table-color-state,var(--bs-table-color-type,var(--bs-table-color)));
			background-color: var(--bs-table-bg);
			border-bottom-width: var(--bs-border-width);
			box-shadow: inset 0 0 0 9999px var(--bs-table-bg-state,var(--bs-table-bg-type,var(--bs-table-accent-bg)));
			vertical-align: top;
		}

	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://www.deckquotes.com.au/js/sister-scripts.js?v=1.01"></script>
</head>
<body id="body">
	<?php
		if(!empty($content)) {
	?>
		<div id="procedure-version-loader" class="procedure-version-loader" aria-hidden="true">
			<div class="procedure-version-loader-box">
				<div class="procedure-version-loader-spinner"></div>
				<div id="procedure-version-loader-text">Loading version...</div>
			</div>
		</div>
		<div class="d-flex flex-column gap-4 p-4 py-5">
            <section id="page-header">
                <table class="table">
                    <tr>
                        <td class="text-start border-x-0 border-t-0">
                            <span class="text-muted">Procedure ID:</span> <span class="text-dark">DID<?= $did ?></span>
                        </td>
                        <td class="text-end border-x-0 border-t-0">
                            <?php if(!empty($procedureType)): ?>
                                <span class="text-muted">Procedure Type:</span> <span class="text-dark"><?= $procedureType ?></span>
                            <?php endif; ?>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-start text-navy fs-24 fw-bold border-x-0"><?= $content['title'] ?></td>
                        <td class="text-end border-x-0 align-middle">Linked Tasks: <?= implode(', ', $linkedTasks) ?><!-- <span style="color: green;">&check;</span> <span style="color: green;">&check;</span> --></td>
                    </tr>
                    <tr>
                        <td class="text-start border-x-0">Owner: <?= $content['owner'] ?? 'Sales Operations' ?></td>
                        <td class="text-end border-x-0">Last Updated: <?= $content['last-updated'] ?></td>
                    </tr>
					<?php
						if(isset($linkedDocs) && $linkedDocs) {
					?>
						<tr>
							<td class="text-start border-x-0">
								<strong>Source Procedure Doc Link:</strong>
								<a href="<?= htmlspecialchars($linkedDocs, ENT_QUOTES) ?>" target="_blank"><?= htmlspecialchars($linkedDocs) ?></a>
							</td>
							<td class="text-end border-x-0">
								<?php if (!empty($availableVersions)): ?>
								<div class="procedure-versions-wrap">
									<button type="button" class="btn btn-sm btn-outline-primary" id="procedure-versions-btn">
										Versions<?php if ($selectedVersion !== ''): ?> (<?= htmlspecialchars($selectedVersion) ?>)<?php endif; ?>
									</button>
									<ul id="procedure-versions-list" class="procedure-versions-list">
										<?php foreach ($availableVersions as $versionRow): ?>
										<?php
											$versionCode = $versionRow['pp_version'];
											$editedBy = trim((string)($versionRow['pp_edited_by'] ?? ''));
											$editedByLabel = ($editedBy !== '') ? $editedBy : 'Unknown';
											$effectiveFrom = formatProcedureVersionDate($versionRow['pp_effective_from'] ?? '');
											$isActive = ($selectedVersion === $versionCode);
											$isCurrent = !empty($versionRow['is_current_version']);
										?>
										<li>
											<a href="<?= htmlspecialchars(BASE_URL . 'ai_procedure/pd/' . $pd . '/version/' . rawurlencode($versionCode), ENT_QUOTES) ?>"
												class="procedure-version-item<?= $isActive ? ' is-active' : '' ?>"
												data-version="<?= htmlspecialchars($versionCode, ENT_QUOTES) ?>">
												<span class="procedure-version-label">
													<?= htmlspecialchars($versionCode) ?>
													<?php if ($isCurrent): ?><span class="procedure-version-current"> (Current)</span><?php endif; ?>
												</span>
												<span class="procedure-version-meta">
													<?= htmlspecialchars($editedByLabel) ?>
													<?php if ($effectiveFrom !== ''): ?> &middot; <?= htmlspecialchars($effectiveFrom) ?><?php endif; ?>
												</span>
											</a>
										</li>
										<?php endforeach; ?>
									</ul>
								</div>
								<?php endif; ?>
							</td>
						</tr>
					<?php
						}
					?>
                </table>
            </section>
            <script>
            (function() {
                var versionsBtn = document.getElementById('procedure-versions-btn');
                var versionsList = document.getElementById('procedure-versions-list');
                var versionLoader = document.getElementById('procedure-version-loader');
                var versionLoaderText = document.getElementById('procedure-version-loader-text');

                function showVersionLoader(versionLabel) {
                    if (!versionLoader) {
                        return;
                    }
                    if (versionLoaderText && versionLabel) {
                        versionLoaderText.textContent = 'Loading ' + versionLabel + '...';
                    }
                    versionLoader.classList.add('is-visible');
                    versionLoader.setAttribute('aria-hidden', 'false');
                }

                if (!versionsBtn || !versionsList) {
                    return;
                }
                versionsBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    versionsList.classList.toggle('is-open');
                });
                document.addEventListener('click', function(e) {
                    if (!versionsList.contains(e.target) && e.target !== versionsBtn && !versionsBtn.contains(e.target)) {
                        versionsList.classList.remove('is-open');
                    }
                });
                versionsList.addEventListener('click', function(e) {
                    var item = e.target.closest('.procedure-version-item');
                    if (!item) {
                        return;
                    }
                    e.preventDefault();
                    versionsList.classList.remove('is-open');
                    if (item.classList.contains('is-active')) {
                        return;
                    }
                    var url = item.getAttribute('href');
                    if (!url) {
                        return;
                    }
                    showVersionLoader(item.getAttribute('data-version') || '');
                    window.location.href = url;
                });
            })();
            </script>
            <section id="body">
                <div class="d-flex flex-row gap-3 align-items-start">
                    <div id="content-section" class="position-sticky top-4 z-10">
						<div class="overflow-y-auto" style="height: 90vh !important;">
							<table class="table" style="width: 300px;">
								<tr>
									<th class="bg-navy text-white">Table of Contents</th>
								</tr>
								<tbody id="toc-body">
								<?php
									foreach($content['content'] as $row) {
								?>
									<tr data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">
										<th class="bg-light-blue <?= $row['level'] == 2 ? 'ps-4' : '' ?>">
											<a href="#<?= $row['id'] ?>" id="toc-link-<?= $row['id'] ?>" class="text-navy"><?= htmlspecialchars($row['title']) ?></a>
										</th>
									</tr>
								<?php
									}
								?>
								</tbody>
								<tr>
									<td class="p-2">
										<button type="button" id="add-section-btn" class="btn btn-sm btn-primary w-100">+ Add Section</button>
									</td>
								</tr>
							</table>
						</div>
                    </div>
                    <div id="body-section" style="width: 100%;">
						<div class="add-section-bar">
							<button type="button" id="add-section-btn-body" class="btn btn-sm btn-primary">+ Add Section</button>
						</div>
						<?php
							$lastIndex = count($content['content']) - 1;
							foreach($content['content'] as $index => $row) {
                                $isCustom = !empty($row['is_custom']);
						?>
                            <div id="<?= $row['id'] ?>" class="py-4 procedure-section"
                                data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>"
                                data-is-custom="<?= $isCustom ? '1' : '0' ?>"
                                <?php if (!empty($row['pp_section'])): ?>data-pp-section="<?= htmlspecialchars($row['pp_section'], ENT_QUOTES) ?>"<?php elseif (!empty($row['id'])): ?>data-pp-section="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>"<?php endif; ?>
                                <?php if (!empty($row['step_order'])): ?>data-step-order="<?= (int)$row['step_order'] ?>"<?php endif; ?>
                                <?php if (isset($row['substep_number']) && $row['substep_number'] !== ''): ?>data-substep-number="<?= htmlspecialchars($row['substep_number'], ENT_QUOTES) ?>"<?php endif; ?>
                            >
                                <h3 class="text-start text-navy section-title-wrap <?= $row['level'] == 1 ? 'fw-bold h3' : '' ?> <?= $row['level'] == 2 ? 'h4' : '' ?> <?= $row['level'] == 3 ? 'h5' : '' ?> <?= $isCustom ? 'fw-bold h3' : '' ?>">
                                    <span id="section-title-view-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="section-title-view">
                                        <span id="section-title-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>"><?= htmlspecialchars($row['title']) ?></span>
                                        <span class="procedure-section-actions">
                                            <a href="javascript:void(0);" class="section-title-edit" title="Edit"
                                                data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">
                                                <img src="<?= BASE_URL ?>css/admin/images/edit.png" alt="Edit" />
                                            </a>
                                            <?php if ($isCustom): ?>
                                            <button type="button" class="btn btn-sm btn-outline-danger section-delete"
                                                data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">Delete</button>
                                            <?php endif; ?>
                                        </span>
                                    </span>
                                    <span id="section-title-edit-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="section-title-edit-form" style="display: none;">
                                        <input type="text" id="section-title-input-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="form-control form-control-sm"
                                            value="<?= htmlspecialchars($row['title'], ENT_QUOTES) ?>"
                                            data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" />
                                        <button type="button" class="btn btn-sm btn-primary section-title-save" data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">Save</button>
                                        <button type="button" class="btn btn-sm btn-secondary section-title-cancel" data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">Cancel</button>
                                    </span>
                                </h3>
                                <div class="section-content-block">
                                    <span id="section-content-view-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="section-content-view">
                                        <div class="section-content-toolbar">
                                            <a href="javascript:void(0);" class="section-content-edit" title="Edit content"
                                                data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">
                                                <img src="<?= BASE_URL ?>css/admin/images/edit.png" alt="Edit content" />
                                            </a>
                                        </div>
                                        <div id="section-content-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="section-content-body">
                                            <?= $row['html'] ?>
                                        </div>
                                    </span>
                                    <span id="section-content-edit-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="section-content-edit-form" style="display: none;">
                                        <textarea id="section-content-input-<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>" class="form-control"
                                            cols="100" rows="15"
                                            data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>"></textarea>
                                        <span class="section-content-edit-actions">
                                            <button type="button" class="btn btn-sm btn-primary section-content-save" data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">Save</button>
                                            <button type="button" class="btn btn-sm btn-secondary section-content-cancel" data-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">Cancel</button>
                                        </span>
                                    </span>
                                </div>
                                <div class="section-insert-bar">
                                    <button type="button" class="btn btn-sm btn-outline-primary section-add-after"
                                        data-after-section-id="<?= htmlspecialchars($row['id'], ENT_QUOTES) ?>">
                                        + Add section here
                                    </button>
                                </div>
                            </div>
							<?php
								if($lastIndex != $index) {
							?>
							<hr>
							<?php
								}
							?>
						<?php
							}
						?>
                    </div>
                </div>
            </section>            
        </div>
		<div id="scrollToTop" class="position-fixed rounded-circle bg-lightblue">
			<a href="#body" class="text-white w-100 h-100 d-flex justify-content-center align-items-center fs-5">
				<i class="bi bi-chevron-up"></i>
			</a>
    	</div>
		<script src="<?= BASE_URL ?>js/ckeditor2/ckeditor.js"></script>
		<script src="<?= BASE_URL ?>js/ckeditor2/samples/js/sample.js"></script>
		<script>
            (function() {
                var procedurePd = <?= json_encode($pd) ?>;
                var appBaseUrl = <?= json_encode(BASE_URL) ?>;
                var saveProcedureUrl = <?= json_encode(BASE_URL . 'ai_procedure.update_procedure') ?>;
                var procedureDocument = <?= json_encode($procedureDocument ?? null, JSON_UNESCAPED_UNICODE) ?>;
                var sectionRegistry = <?= json_encode($sectionRegistry ?? [], JSON_UNESCAPED_UNICODE) ?>;
                var sectionContentBackup = {};
                var ckEditorContentsCss = [
                    'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css',
                    appBaseUrl + 'css/sister-styles.css?v=1.01'
                ];

                if (!procedureDocument) {
                    return;
                }

                function getCkEditorConfig() {
                    return {
                        allowedContent: true,
                        extraAllowedContent: '*(*);*{*}',
                        contentsCss: ckEditorContentsCss,
                        bodyClass: 'procedure-content-editor'
                    };
                }

                function ensureProcedureCkEditorStyles() {
                    if (window.procedureCkEditorStylesReady || typeof CKEDITOR === 'undefined') {
                        return;
                    }

                    CKEDITOR.addCss(
                        'body.cke_editable.procedure-content-editor{font-size:13px;}' +
                        'body.cke_editable.procedure-content-editor img{padding:.25rem;background-color:#fff;border:1px solid #dee2e6;border-radius:.375rem;max-width:100%;height:auto;margin-bottom:1rem;display:block;}' +
                        'body.cke_editable.procedure-content-editor table{border-collapse:collapse;width:100%;margin-bottom:1rem;vertical-align:top;}' +
                        'body.cke_editable.procedure-content-editor table td,body.cke_editable.procedure-content-editor table th{padding:.5rem;border:1px solid #dee2e6;vertical-align:top;}' +
                        'body.cke_editable.procedure-content-editor .text-navy{color:#163c6d!important;}' +
                        'body.cke_editable.procedure-content-editor .text-red{color:#dc3545!important;}' +
                        'body.cke_editable.procedure-content-editor .fw-bold{font-weight:700!important;}'
                    );
                    window.procedureCkEditorStylesReady = true;
                }

                function getContentEditorId(sectionId) {
                    return 'section-content-input-' + sectionId;
                }

                function destroySectionContentEditor(sectionId) {
                    var editorId = getContentEditorId(sectionId);
                    if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances[editorId]) {
                        CKEDITOR.instances[editorId].destroy(true);
                    }
                }

                function initSectionContentEditor(sectionId, html) {
                    var editorId = getContentEditorId(sectionId);
                    var inputEl = document.getElementById(editorId);

                    if (!inputEl || typeof CKEDITOR === 'undefined') {
                        if (inputEl) {
                            inputEl.value = html;
                        }
                        return;
                    }

                    destroySectionContentEditor(sectionId);
                    ensureProcedureCkEditorStyles();
                    inputEl.value = html;
                    var editor = CKEDITOR.replace(editorId, getCkEditorConfig());
                    if (editor) {
                        editor.on('instanceReady', function() {
                            editor.setData(html);
                        });
                    }
                }

                function getSectionContentHtml(sectionId) {
                    var editorId = getContentEditorId(sectionId);
                    if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances[editorId]) {
                        return CKEDITOR.instances[editorId].getData();
                    }
                    var inputEl = document.getElementById(editorId);
                    return inputEl ? inputEl.value : '';
                }

                function postJson(url, requestData, onSuccess, errorMessage) {
                    var ajaxCall = (window.jQuery && jQuery.ajax) ? jQuery.ajax : null;
                    if (ajaxCall) {
                        ajaxCall({
                            type: 'POST',
                            url: url,
                            data: requestData,
                            dataType: 'json',
                            success: function(data) {
                                if (data && data.success === true) {
                                    onSuccess(data);
                                } else {
                                    alert((data && data.message) ? data.message : errorMessage);
                                }
                            },
                            error: function() {
                                alert(errorMessage);
                            }
                        });
                        return;
                    }

                    var body = new URLSearchParams(requestData);
                    fetch(url, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: body.toString()
                    })
                    .then(function(response) { return response.json(); })
                    .then(function(data) {
                        if (data && data.success === true) {
                            onSuccess(data);
                        } else {
                            alert((data && data.message) ? data.message : errorMessage);
                        }
                    })
                    .catch(function() {
                        alert(errorMessage);
                    });
                }

                function getNextCustomSectionId() {
                    var maxId = 0;
                    (procedureDocument.pp_custom_sections || []).forEach(function(section) {
                        var id = parseInt(section.section_id, 10);
                        if (!isNaN(id) && id > maxId) {
                            maxId = id;
                        }
                    });
                    return maxId + 1;
                }

                function migrateLegacyCustomStepsInDocument() {
                    if (!procedureDocument.pp_custom_sections) {
                        procedureDocument.pp_custom_sections = [];
                    }
                    var remaining = [];
                    getProcedureStepsArray().forEach(function(step) {
                        if (!step || !step.pp_section_type && !(step.body || []).some(function(block) {
                            var blockId = String(block.block_id || '');
                            return blockId.indexOf('blk_custom_') === 0 || /^blk_\d{10,}$/.test(blockId);
                        })) {
                            remaining.push(step);
                            return;
                        }
                        if (step.pp_section_type !== 'custom' && !(step.body || []).some(function(block) {
                            return String(block.block_id || '').indexOf('blk_custom_') === 0;
                        })) {
                            remaining.push(step);
                            return;
                        }
                        procedureDocument.pp_custom_sections.push({
                            section_id: parseInt(step.step_id, 10) || getNextCustomSectionId(),
                            ui_id: step._ui_id || ('custom-section-' + (procedureDocument.pp_custom_sections.length + 1)),
                            title: step.title || 'New Section',
                            body: step.body || createEmptyBodyBlock(parseInt(step.step_id, 10) || 1),
                            after_section_id: ''
                        });
                    });
                    procedureDocument.pp_steps = remaining;
                }

                function normalizeProcedureStepsInDocument() {
                    procedureDocument.pp_steps = getProcedureStepsArray();
                    procedureDocument.pp_steps.forEach(function(step, index) {
                        step._step_index = index;
                    });
                }

                function sanitizeProcedureDocumentForApi() {
                    migrateLegacyCustomStepsInDocument();
                    normalizeProcedureStepsInDocument();
                    if (!procedureDocument.pp_custom_sections) {
                        procedureDocument.pp_custom_sections = [];
                    }
                    getProcedureStepsArray().forEach(function(step) {
                        var id = parseInt(step.step_id, 10);
                        if (!isNaN(id)) {
                            step.step_id = id;
                        }
                        delete step.pp_section_type;
                    });
                    procedureDocument.pp_steps = getProcedureStepsArray();
                    var maxCustomId = 0;
                    procedureDocument.pp_custom_sections.forEach(function(section, index) {
                        var id = parseInt(section.section_id, 10);
                        if (isNaN(id)) {
                            id = maxCustomId + 1;
                        }
                        section.section_id = id;
                        maxCustomId = Math.max(maxCustomId, id);
                        section.ui_id = 'custom-section-' + id;
                        if (!section.body || !section.body.length) {
                            section.body = createEmptyBodyBlock(id);
                        }
                        if (section.after_section_id === undefined || section.after_section_id === null) {
                            section.after_section_id = '';
                        }
                    });
                }

                function saveProcedureDocument(onSuccess, errorMessage) {
                    sanitizeProcedureDocumentForApi();
                    postJson(saveProcedureUrl, {
                        action: 'saveProcedureDocument',
                        pd: procedurePd,
                        document: JSON.stringify(procedureDocument)
                    }, onSuccess, errorMessage || 'Unable to save procedure');
                }

                function getRegistryPart(sectionId, part) {
                    if (!sectionRegistry[sectionId] || !sectionRegistry[sectionId][part]) {
                        return null;
                    }
                    return sectionRegistry[sectionId][part];
                }

                function getProcedureStepsArray() {
                    var steps = procedureDocument && procedureDocument.pp_steps;
                    if (!steps) {
                        return [];
                    }
                    if (Array.isArray(steps)) {
                        return steps;
                    }
                    return Object.keys(steps)
                        .sort(function(a, b) { return Number(a) - Number(b); })
                        .map(function(key) { return steps[key]; });
                }

                function findStepByUiId(uiId) {
                    var steps = getProcedureStepsArray();
                    for (var i = 0; i < steps.length; i++) {
                        if (steps[i]._ui_id === uiId) {
                            return { step: steps[i], index: i };
                        }
                    }
                    return null;
                }

                function findStepBySectionId(sectionId) {
                    var steps = getProcedureStepsArray();
                    var i;

                    for (i = 0; i < steps.length; i++) {
                        if (steps[i]._ui_id === sectionId) {
                            return { step: steps[i], index: i };
                        }
                    }

                    var meta = getRegistryPart(sectionId, 'title') || getRegistryPart(sectionId, 'content');
                    if (meta) {
                        var fromMeta = getStepFromMeta(meta);
                        if (fromMeta) {
                            return fromMeta;
                        }
                    }

                    var stepMatch = /^step-(\d+)$/i.exec(sectionId) || /^step-index-(\d+)$/i.exec(sectionId);
                    if (stepMatch) {
                        var stepNum = parseInt(stepMatch[1], 10);
                        if (/^step-index-/i.test(sectionId)) {
                            if (steps[stepNum - 1]) {
                                return { step: steps[stepNum - 1], index: stepNum - 1 };
                            }
                        } else {
                            for (i = 0; i < steps.length; i++) {
                                if (parseInt(steps[i].step_id, 10) === stepNum) {
                                    return { step: steps[i], index: i };
                                }
                            }
                        }
                    }

                    var legacyMatch = /^step(\d+)$/i.exec(sectionId);
                    if (legacyMatch) {
                        var legacyNum = parseInt(legacyMatch[1], 10);
                        for (i = 0; i < steps.length; i++) {
                            if (parseInt(steps[i].step_id, 10) === legacyNum) {
                                return { step: steps[i], index: i };
                            }
                        }
                    }

                    return null;
                }

                function getStepFromMeta(meta) {
                    if (!meta) {
                        return null;
                    }

                    var steps = getProcedureStepsArray();
                    var idx = meta.step_index;
                    if (idx !== undefined && idx !== null) {
                        idx = parseInt(idx, 10);
                        if (!isNaN(idx) && steps[idx]) {
                            return { step: steps[idx], index: idx };
                        }
                    }

                    if (meta.ui_id) {
                        var byUiId = findStepByUiId(meta.ui_id);
                        if (byUiId) {
                            return byUiId;
                        }
                    }

                    return null;
                }

                function findCustomSectionByUiId(uiId) {
                    var sections = procedureDocument.pp_custom_sections || [];
                    for (var i = 0; i < sections.length; i++) {
                        if (sections[i].ui_id === uiId) {
                            return { section: sections[i], index: i };
                        }
                    }
                    return null;
                }

                function getCustomSectionFromMeta(meta) {
                    if (!meta || meta.custom_index === undefined) {
                        return null;
                    }
                    if (procedureDocument.pp_custom_sections && procedureDocument.pp_custom_sections[meta.custom_index]) {
                        return {
                            section: procedureDocument.pp_custom_sections[meta.custom_index],
                            index: meta.custom_index
                        };
                    }
                    return null;
                }

                function renormalizeStepOrders() {
                    (procedureDocument.pp_steps || []).forEach(function(step, index) {
                        step.order = index + 1;
                    });
                }

                function escapeAttr(value) {
                    return String(value)
                        .replace(/&/g, '&amp;')
                        .replace(/"/g, '&quot;')
                        .replace(/</g, '&lt;')
                        .replace(/>/g, '&gt;');
                }

                function buildSectionHtml(sectionId, title, contentHtml, isCustom) {
                    var deleteBtn = isCustom
                        ? '<button type="button" class="btn btn-sm btn-outline-danger section-delete" data-section-id="' + escapeAttr(sectionId) + '">Delete</button>'
                        : '';

                    return ''
                        + '<div id="' + escapeAttr(sectionId) + '" class="py-4 procedure-section" data-section-id="' + escapeAttr(sectionId) + '" data-is-custom="' + (isCustom ? '1' : '0') + '">'
                        + '<h3 class="text-start text-navy section-title-wrap fw-bold h3">'
                        + '<span id="section-title-view-' + escapeAttr(sectionId) + '" class="section-title-view">'
                        + '<span id="section-title-' + escapeAttr(sectionId) + '">' + escapeAttr(title) + '</span>'
                        + '<span class="procedure-section-actions">'
                        + '<a href="javascript:void(0);" class="section-title-edit" title="Edit" data-section-id="' + escapeAttr(sectionId) + '">'
                        + '<img src="' + appBaseUrl + 'css/admin/images/edit.png" alt="Edit" />'
                        + '</a>'
                        + deleteBtn
                        + '</span>'
                        + '</span>'
                        + '<span id="section-title-edit-' + escapeAttr(sectionId) + '" class="section-title-edit-form" style="display: none;">'
                        + '<input type="text" id="section-title-input-' + escapeAttr(sectionId) + '" class="form-control form-control-sm" value="' + escapeAttr(title) + '" data-section-id="' + escapeAttr(sectionId) + '" />'
                        + '<button type="button" class="btn btn-sm btn-primary section-title-save" data-section-id="' + escapeAttr(sectionId) + '">Save</button>'
                        + '<button type="button" class="btn btn-sm btn-secondary section-title-cancel" data-section-id="' + escapeAttr(sectionId) + '">Cancel</button>'
                        + '</span>'
                        + '</h3>'
                        + '<div class="section-content-block">'
                        + '<span id="section-content-view-' + escapeAttr(sectionId) + '" class="section-content-view">'
                        + '<div class="section-content-toolbar">'
                        + '<a href="javascript:void(0);" class="section-content-edit" title="Edit content" data-section-id="' + escapeAttr(sectionId) + '">'
                        + '<img src="' + appBaseUrl + 'css/admin/images/edit.png" alt="Edit content" />'
                        + '</a>'
                        + '</div>'
                        + '<div id="section-content-' + escapeAttr(sectionId) + '" class="section-content-body">' + contentHtml + '</div>'
                        + '</span>'
                        + '<span id="section-content-edit-' + escapeAttr(sectionId) + '" class="section-content-edit-form" style="display: none;">'
                        + '<textarea id="section-content-input-' + escapeAttr(sectionId) + '" class="form-control" cols="100" rows="15" data-section-id="' + escapeAttr(sectionId) + '"></textarea>'
                        + '<span class="section-content-edit-actions">'
                        + '<button type="button" class="btn btn-sm btn-primary section-content-save" data-section-id="' + escapeAttr(sectionId) + '">Save</button>'
                        + '<button type="button" class="btn btn-sm btn-secondary section-content-cancel" data-section-id="' + escapeAttr(sectionId) + '">Cancel</button>'
                        + '</span>'
                        + '</span>'
                        + '</div>'
                        + '<div class="section-insert-bar">'
                        + '<button type="button" class="btn btn-sm btn-outline-primary section-add-after" data-after-section-id="' + escapeAttr(sectionId) + '">+ Add section here</button>'
                        + '</div>'
                        + '</div>'
                        + '<hr>';
                }

                function addTocRowAfter(sectionId, title, afterSectionId) {
                    var tocBody = document.getElementById('toc-body');
                    if (!tocBody) {
                        return;
                    }
                    var row = document.createElement('tr');
                    row.setAttribute('data-section-id', sectionId);
                    row.innerHTML = '<th class="bg-light-blue"><a href="#' + escapeAttr(sectionId) + '" id="toc-link-' + escapeAttr(sectionId) + '" class="text-navy">' + escapeAttr(title) + '</a></th>';
                    if (!afterSectionId) {
                        tocBody.appendChild(row);
                        return;
                    }
                    var anchorRow = tocBody.querySelector('tr[data-section-id="' + afterSectionId + '"]');
                    if (anchorRow) {
                        anchorRow.insertAdjacentElement('afterend', row);
                    } else {
                        tocBody.appendChild(row);
                    }
                }

                function insertSectionDomAfterAnchor(sectionHtml, afterSectionId) {
                    var bodySection = document.getElementById('body-section');
                    if (!afterSectionId) {
                        bodySection.insertAdjacentHTML('beforeend', sectionHtml);
                        return;
                    }
                    var anchor = document.getElementById(afterSectionId);
                    if (!anchor) {
                        bodySection.insertAdjacentHTML('beforeend', sectionHtml);
                        return;
                    }
                    var next = anchor.nextElementSibling;
                    if (next && next.tagName === 'HR') {
                        var html = sectionHtml.replace(/<hr>\s*$/i, '');
                        next.insertAdjacentHTML('beforebegin', html);
                        return;
                    }
                    anchor.insertAdjacentHTML('afterend', sectionHtml);
                }

                function createEmptyBodyBlock(sectionId) {
                    return [{
                        block_id: 'blk_custom_' + sectionId,
                        type: 'html',
                        content: '<p></p>',
                        table_heading: null,
                        headers: null,
                        rows: null
                    }];
                }

                function addNewSection(afterSectionId) {
                    if (!procedureDocument.pp_custom_sections) {
                        procedureDocument.pp_custom_sections = [];
                    }

                    var sectionId = getNextCustomSectionId();
                    var uiId = 'custom-section-' + sectionId;
                    var title = 'New Section';
                    var newSection = {
                        section_id: sectionId,
                        ui_id: uiId,
                        title: title,
                        body: createEmptyBodyBlock(sectionId),
                        after_section_id: afterSectionId || ''
                    };

                    procedureDocument.pp_custom_sections.push(newSection);
                    var customIndex = procedureDocument.pp_custom_sections.length - 1;

                    sectionRegistry[uiId] = {
                        title: { type: 'custom_section_title', custom_index: customIndex },
                        content: { type: 'custom_section_content', custom_index: customIndex },
                        is_custom: true
                    };

                    var sectionHtml = buildSectionHtml(uiId, title, '<p></p>', true);
                    insertSectionDomAfterAnchor(sectionHtml, afterSectionId || '');
                    addTocRowAfter(uiId, title, afterSectionId || '');

                    saveProcedureDocument(function() {
                        var sectionEl = document.getElementById(uiId);
                        if (sectionEl) {
                            sectionEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }
                        startEditSectionTitle(uiId);
                    }, 'Unable to save new section');
                }

                function deleteCustomSection(sectionId) {
                    if (!sectionRegistry[sectionId] || !sectionRegistry[sectionId].is_custom) {
                        return;
                    }

                    if (!window.confirm('Delete this section?')) {
                        return;
                    }

                    var customRef = findCustomSectionByUiId(sectionId);
                    if (customRef) {
                        procedureDocument.pp_custom_sections.splice(customRef.index, 1);
                    }

                    delete sectionRegistry[sectionId];

                    var sectionEl = document.getElementById(sectionId);
                    if (sectionEl) {
                        var hr = sectionEl.nextElementSibling;
                        sectionEl.remove();
                        if (hr && hr.tagName === 'HR') {
                            hr.remove();
                        }
                    }

                    var tocRow = document.querySelector('#toc-body tr[data-section-id="' + sectionId + '"]');
                    if (tocRow) {
                        tocRow.remove();
                    }

                    Object.keys(sectionRegistry).forEach(function(key) {
                        var entry = sectionRegistry[key];
                        if (entry && entry.title && entry.title.type === 'custom_section_title' && entry.title.custom_index > (customRef ? customRef.index : -1)) {
                            entry.title.custom_index -= 1;
                            entry.content.custom_index -= 1;
                        }
                    });

                    saveProcedureDocument(function() {}, 'Unable to delete section');
                }

                function parseTableElement(table) {
                    var headers = [];
                    var rows = [];

                    table.querySelectorAll('thead th').forEach(function(th) {
                        headers.push(th.textContent.trim());
                    });

                    var bodyRows = table.querySelectorAll('tbody tr');
                    if (!bodyRows.length) {
                        bodyRows = table.querySelectorAll('tr');
                    }

                    bodyRows.forEach(function(tr, rowIndex) {
                        var cells = [];
                        tr.querySelectorAll('th, td').forEach(function(cell) {
                            cells.push(cell.innerHTML.trim());
                        });
                        if (!cells.length) {
                            return;
                        }
                        if (!headers.length && rowIndex === 0 && tr.querySelector('th')) {
                            headers = cells;
                            return;
                        }
                        if (headers.length && rowIndex === 0 && cells.length === headers.length) {
                            var headerText = headers.join('|');
                            var rowText = cells.join('|');
                            if (headerText === rowText) {
                                return;
                            }
                        }
                        rows.push(cells);
                    });

                    return { headers: headers, rows: rows };
                }

                function getHtmlDocument(html) {
                    return new DOMParser().parseFromString(html || '', 'text/html');
                }

                function getHtmlSupplement(html) {
                    var doc = getHtmlDocument(html);
                    var wrapper = doc.createElement('div');
                    Array.prototype.forEach.call(doc.body.childNodes, function(node) {
                        if (node.nodeType === 1 && node.tagName === 'TABLE') {
                            return;
                        }
                        if (node.nodeType === 3 && !node.textContent.trim()) {
                            return;
                        }
                        wrapper.appendChild(node.cloneNode(true));
                    });
                    return wrapper.innerHTML.trim();
                }

                function parseBodyBlocksFromHtml(html, existingBody) {
                    var doc = getHtmlDocument(html);
                    var blocks = [];
                    var existingIndex = 0;

                    function nextBlockId() {
                        if (existingBody && existingBody[existingIndex] && existingBody[existingIndex].block_id) {
                            return existingBody[existingIndex++].block_id;
                        }
                        return 'blk_' + Date.now() + '_' + Math.random().toString(36).slice(2, 9);
                    }

                    function pushHtmlBlock(content) {
                        if (!content || !content.trim()) {
                            return;
                        }
                        blocks.push({
                            block_id: nextBlockId(),
                            type: 'html',
                            content: content,
                            table_heading: null,
                            headers: null,
                            rows: null
                        });
                    }

                    function pushTableBlock(table) {
                        var parsed = parseTableElement(table);
                        var caption = table.querySelector('caption');
                        blocks.push({
                            block_id: nextBlockId(),
                            type: 'table',
                            content: null,
                            table_heading: caption ? caption.textContent.trim() : null,
                            headers: parsed.headers,
                            rows: parsed.rows
                        });
                    }

                    var htmlBuffer = [];
                    function flushHtmlBuffer() {
                        if (!htmlBuffer.length) {
                            return;
                        }
                        pushHtmlBlock(htmlBuffer.join(''));
                        htmlBuffer = [];
                    }

                    Array.prototype.forEach.call(doc.body.childNodes, function(node) {
                        if (node.nodeType === 3) {
                            if (node.textContent.trim()) {
                                htmlBuffer.push(node.textContent);
                            }
                            return;
                        }
                        if (node.nodeType !== 1) {
                            return;
                        }
                        if (node.tagName === 'TABLE') {
                            flushHtmlBuffer();
                            pushTableBlock(node);
                            return;
                        }
                        htmlBuffer.push(node.outerHTML);
                    });
                    flushHtmlBuffer();

                    if (!blocks.length) {
                        pushHtmlBlock(html);
                    }

                    return blocks;
                }

                function applyNumberedTitle(item, title) {
                    var match = title.match(/^(.+?)\.\s+(.+)$/);
                    if (match) {
                        item.number = match[1];
                        item.title = match[2];
                        return;
                    }
                    item.title = title;
                }

                function applySectionTitleChange(sectionId, title) {
                    var meta = getRegistryPart(sectionId, 'title');
                    if (!meta) {
                        var directStep = findStepBySectionId(sectionId);
                        if (directStep) {
                            directStep.step.title = title;
                            return true;
                        }
                        return false;
                    }

                    if (meta.type === 'field_heading' && procedureDocument[meta.field]) {
                        procedureDocument[meta.field].heading = title;
                        return true;
                    }

                    if (meta.type === 'custom_section_title') {
                        var customRef = getCustomSectionFromMeta(meta);
                        if (customRef) {
                            customRef.section.title = title;
                            return true;
                        }
                    }

                    if (meta.type === 'step_title') {
                        var stepRef = findStepBySectionId(sectionId) || getStepFromMeta(meta);
                        if (stepRef) {
                            stepRef.step.title = title;
                            return true;
                        }
                    }

                    if (meta.type === 'substep_title') {
                        var subStepRef = getStepFromMeta({ step_index: meta.step_index });
                        if (!subStepRef) {
                            return false;
                        }
                        var step = subStepRef.step;
                        if (step.contents_substeps && step.contents_substeps[meta.sub_index]) {
                            applyNumberedTitle(step.contents_substeps[meta.sub_index], title);
                        }
                        if (step.substeps && step.substeps[meta.sub_index]) {
                            applyNumberedTitle(step.substeps[meta.sub_index], title);
                        }
                        return true;
                    }

                    return false;
                }

                function applyHtmlToStepBody(step, html) {
                    step.body = parseBodyBlocksFromHtml(html, step.body || []);
                }

                function applyTableSectionFromHtml(section, html) {
                    var doc = getHtmlDocument(html);
                    var firstTable = doc.querySelector('table');
                    var supplement = getHtmlSupplement(html);

                    if (firstTable) {
                        var parsed = parseTableElement(firstTable);
                        if (parsed.headers.length) {
                            section.headers = parsed.headers;
                        }
                        section.rows = parsed.rows;
                    }

                    if (doc.querySelectorAll('table').length > 1) {
                        var extraWrapper = doc.createElement('div');
                        var tables = doc.querySelectorAll('table');
                        Array.prototype.forEach.call(tables, function(table, index) {
                            if (index > 0) {
                                extraWrapper.appendChild(table.cloneNode(true));
                            }
                        });
                        supplement = (supplement ? supplement : '') + extraWrapper.innerHTML;
                    }

                    section.content = supplement || '';

                    return !!(firstTable || supplement);
                }

                function applySectionContentChange(sectionId, html) {
                    var meta = getRegistryPart(sectionId, 'content');
                    if (!meta) {
                        var directStepOnly = findStepBySectionId(sectionId);
                        if (directStepOnly) {
                            applyHtmlToStepBody(directStepOnly.step, html);
                            return true;
                        }
                        return false;
                    }

                    if (meta.type === 'field_content' && procedureDocument[meta.field]) {
                        procedureDocument[meta.field].content = html;
                        return true;
                    }

                    if (meta.type === 'table_html' && procedureDocument[meta.field]) {
                        return applyTableSectionFromHtml(procedureDocument[meta.field], html);
                    }

                    if (meta.type === 'custom_section_content') {
                        var customContentRef = getCustomSectionFromMeta(meta);
                        if (customContentRef) {
                            customContentRef.section.body = parseBodyBlocksFromHtml(html, customContentRef.section.body || []);
                            return true;
                        }
                    }

                    if (meta.type === 'step_body_html' || meta.type === 'step_composite_html') {
                        var bodyStepRef = findStepBySectionId(sectionId) || getStepFromMeta(meta);
                        if (!bodyStepRef) {
                            return false;
                        }
                        var bodyStep = bodyStepRef.step;
                        if (meta.type === 'step_composite_html') {
                            bodyStep.body = parseBodyBlocksFromHtml(html, bodyStep.body || []);
                            return true;
                        }
                        applyHtmlToStepBody(bodyStep, html);
                        return true;
                    }

                    if (meta.type === 'substep_content') {
                        var contentStepRef = getStepFromMeta({ step_index: meta.step_index });
                        if (!contentStepRef) {
                            return false;
                        }
                        var substeps = contentStepRef.step.substeps;
                        if (substeps && substeps[meta.sub_index]) {
                            substeps[meta.sub_index].content = html;
                            return true;
                        }
                        return false;
                    }

                    return false;
                }

                function sectionIdSuffix(sectionId, suffix) {
                    return suffix + sectionId;
                }

                function getSectionEl(sectionId, suffix) {
                    return document.getElementById(sectionIdSuffix(sectionId, suffix));
                }

                function startEditSectionTitle(sectionId) {
                    var titleEl = getSectionEl(sectionId, 'section-title-');
                    var viewEl = getSectionEl(sectionId, 'section-title-view-');
                    var editEl = getSectionEl(sectionId, 'section-title-edit-');
                    var inputEl = getSectionEl(sectionId, 'section-title-input-');

                    if (!titleEl || !viewEl || !editEl || !inputEl) {
                        return;
                    }

                    inputEl.value = titleEl.textContent.trim();
                    viewEl.style.display = 'none';
                    editEl.style.display = 'flex';
                    inputEl.focus();
                    inputEl.select();
                }

                function cancelSectionTitle(sectionId) {
                    var titleEl = getSectionEl(sectionId, 'section-title-');
                    var viewEl = getSectionEl(sectionId, 'section-title-view-');
                    var editEl = getSectionEl(sectionId, 'section-title-edit-');
                    var inputEl = getSectionEl(sectionId, 'section-title-input-');

                    if (!titleEl || !viewEl || !editEl || !inputEl) {
                        return;
                    }

                    inputEl.value = titleEl.textContent.trim();
                    editEl.style.display = 'none';
                    viewEl.style.display = 'flex';
                }

                function saveSectionTitle(sectionId) {
                    var titleEl = getSectionEl(sectionId, 'section-title-');
                    var inputEl = getSectionEl(sectionId, 'section-title-input-');
                    var tocEl = document.getElementById('toc-link-' + sectionId);

                    if (!titleEl || !inputEl) {
                        return;
                    }

                    var currentTitle = titleEl.textContent.trim();
                    var newTitle = inputEl.value.trim();

                    if (newTitle === '') {
                        alert('Section title cannot be empty');
                        return;
                    }

                    if (newTitle === currentTitle) {
                        cancelSectionTitle(sectionId);
                        return;
                    }

                    if (!applySectionTitleChange(sectionId, newTitle)) {
                        alert('Unable to map this section title into the procedure document');
                        return;
                    }

                    saveProcedureDocument(function() {
                        titleEl.textContent = newTitle;
                        if (tocEl) {
                            tocEl.textContent = newTitle;
                        }
                        cancelSectionTitle(sectionId);
                    }, 'Unable to save procedure');
                }

                function startEditSectionContent(sectionId) {
                    var contentEl = getSectionEl(sectionId, 'section-content-');
                    var viewEl = getSectionEl(sectionId, 'section-content-view-');
                    var editEl = getSectionEl(sectionId, 'section-content-edit-');
                    var inputEl = getSectionEl(sectionId, 'section-content-input-');

                    if (!contentEl || !viewEl || !editEl || !inputEl) {
                        return;
                    }

                    sectionContentBackup[sectionId] = contentEl.innerHTML;
                    viewEl.style.display = 'none';
                    editEl.style.display = 'flex';
                    initSectionContentEditor(sectionId, sectionContentBackup[sectionId]);
                }

                function finishSectionContentEdit(sectionId) {
                    destroySectionContentEditor(sectionId);
                    var viewEl = getSectionEl(sectionId, 'section-content-view-');
                    var editEl = getSectionEl(sectionId, 'section-content-edit-');

                    if (viewEl && editEl) {
                        editEl.style.display = 'none';
                        viewEl.style.display = 'block';
                    }
                    delete sectionContentBackup[sectionId];
                }

                function cancelSectionContent(sectionId) {
                    var contentEl = getSectionEl(sectionId, 'section-content-');
                    var viewEl = getSectionEl(sectionId, 'section-content-view-');
                    var editEl = getSectionEl(sectionId, 'section-content-edit-');
                    var inputEl = getSectionEl(sectionId, 'section-content-input-');

                    if (!contentEl || !viewEl || !editEl || !inputEl) {
                        return;
                    }

                    destroySectionContentEditor(sectionId);

                    if (sectionContentBackup[sectionId] !== undefined) {
                        contentEl.innerHTML = sectionContentBackup[sectionId];
                    }
                    inputEl.value = contentEl.innerHTML;
                    finishSectionContentEdit(sectionId);
                }

                function saveSectionContent(sectionId) {
                    var contentEl = getSectionEl(sectionId, 'section-content-');

                    if (!contentEl) {
                        return;
                    }

                    var currentHtml = (sectionContentBackup[sectionId] !== undefined)
                        ? sectionContentBackup[sectionId]
                        : contentEl.innerHTML;
                    var newHtml = getSectionContentHtml(sectionId);

                    if (newHtml.trim() === '') {
                        alert('Section content cannot be empty');
                        return;
                    }

                    if (newHtml === currentHtml) {
                        cancelSectionContent(sectionId);
                        return;
                    }

                    if (!applySectionContentChange(sectionId, newHtml)) {
                        alert('Unable to map this section content into the procedure document');
                        return;
                    }

                    saveProcedureDocument(function() {
                        contentEl.innerHTML = newHtml;
                        if (window.jQuery) {
                            jQuery(contentEl).find('script').remove();
                        }
                        finishSectionContentEdit(sectionId);
                    }, 'Unable to save procedure');
                }

                document.querySelectorAll('#content-section a[href^="#"]').forEach(function(link) {
                    link.addEventListener('click', function(e) {
                        e.preventDefault();
                        var targetId = this.getAttribute('href').substring(1);
                        var target = document.getElementById(targetId);
                        if (target) {
                            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }
                    });
                });

                document.getElementById('add-section-btn').addEventListener('click', function() {
                    var rows = document.querySelectorAll('#body-section .procedure-section');
                    var afterId = rows.length ? rows[rows.length - 1].getAttribute('data-section-id') : '';
                    addNewSection(afterId);
                });
                document.getElementById('add-section-btn-body').addEventListener('click', function() {
                    var rows = document.querySelectorAll('#body-section .procedure-section');
                    var afterId = rows.length ? rows[rows.length - 1].getAttribute('data-section-id') : '';
                    addNewSection(afterId);
                });

                document.getElementById('body-section').addEventListener('click', function(e) {
                    var addAfterBtn = e.target.closest('.section-add-after');
                    if (addAfterBtn) {
                        e.preventDefault();
                        addNewSection(addAfterBtn.getAttribute('data-after-section-id') || '');
                        return;
                    }

                    var deleteBtn = e.target.closest('.section-delete');
                    if (deleteBtn) {
                        e.preventDefault();
                        deleteCustomSection(deleteBtn.getAttribute('data-section-id'));
                        return;
                    }

                    var editLink = e.target.closest('.section-title-edit');
                    if (editLink) {
                        e.preventDefault();
                        startEditSectionTitle(editLink.getAttribute('data-section-id'));
                        return;
                    }

                    var saveBtn = e.target.closest('.section-title-save');
                    if (saveBtn) {
                        e.preventDefault();
                        saveSectionTitle(saveBtn.getAttribute('data-section-id'));
                        return;
                    }

                    var cancelBtn = e.target.closest('.section-title-cancel');
                    if (cancelBtn) {
                        e.preventDefault();
                        cancelSectionTitle(cancelBtn.getAttribute('data-section-id'));
                        return;
                    }

                    var contentEditLink = e.target.closest('.section-content-edit');
                    if (contentEditLink) {
                        e.preventDefault();
                        startEditSectionContent(contentEditLink.getAttribute('data-section-id'));
                        return;
                    }

                    var contentSaveBtn = e.target.closest('.section-content-save');
                    if (contentSaveBtn) {
                        e.preventDefault();
                        saveSectionContent(contentSaveBtn.getAttribute('data-section-id'));
                        return;
                    }

                    var contentCancelBtn = e.target.closest('.section-content-cancel');
                    if (contentCancelBtn) {
                        e.preventDefault();
                        cancelSectionContent(contentCancelBtn.getAttribute('data-section-id'));
                    }
                });

                document.getElementById('body-section').addEventListener('keydown', function(e) {
                    if (e.target.id && e.target.id.indexOf('section-title-input-') === 0) {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            saveSectionTitle(e.target.getAttribute('data-section-id'));
                        } else if (e.key === 'Escape') {
                            e.preventDefault();
                            cancelSectionTitle(e.target.getAttribute('data-section-id'));
                        }
                        return;
                    }

                });

                // HITL deep-link: scroll/highlight section from ?hitl_section=&hitl_step_order=&hitl_substep=&hitl_after_substep=
                (function navigateHitlLocation() {
                    var params = new URLSearchParams(window.location.search || '');
                    function getQueryParam(name) {
                        return params.get(name) || '';
                    }

                    var sectionMap = {
                        'pp_title': 'body',
                        'pp_table_overview': 'intro',
                        'pp_table_doc_info': 'metadata',
                        'pp_table_prerequisites': 'prerequisites',
                        'pp_trigger_condition': 'trigger_condition',
                        'pp_completion_criteria': 'completion_criteria',
                        'pp_rules': 'rules',
                        'pp_inputs': 'inputs',
                        'pp_outputs': 'outputs',
                        'pp_exceptions': 'exceptions',
                        'pp_decision_logic': 'decision_logic',
                        'pp_qa': 'qa',
                        'pp_improvement': 'improvement'
                    };

                    var hitlSection = getQueryParam('hitl_section');
                    var hitlStepOrder = getQueryParam('hitl_step_order');
                    var hitlSubstep = getQueryParam('hitl_substep');
                    var hitlAfterSubstep = getQueryParam('hitl_after_substep');
                    var hasAfterParam = params.has('hitl_after_substep');
                    var hitlFlag = getQueryParam('hitl_flag');

                    if (!hitlSection && !hitlStepOrder) {
                        return;
                    }

                    function highlightEl(el) {
                        if (!el) { return; }
                        el.classList.add('hitl-highlight');
                        setTimeout(function() {
                            el.scrollIntoView({ behavior: 'smooth', block: 'start' });
                        }, 150);
                    }

                    function findStepSection(order) {
                        return document.querySelector('.procedure-section[data-step-order="' + order + '"]:not([data-substep-number])')
                            || document.querySelector('.procedure-section[data-step-order="' + order + '"]');
                    }

                    function findSubstepInStep(stepEl, substepNumber) {
                        if (!stepEl || !substepNumber) { return null; }
                        var exact = document.querySelector('.procedure-section[data-step-order="' + stepEl.getAttribute('data-step-order') + '"][data-substep-number="' + substepNumber + '"]');
                        if (exact) { return exact; }
                        var inline = stepEl.querySelector('.substep[data-substep-number="' + substepNumber + '"]');
                        return inline;
                    }

                    var target = null;

                    if (hitlSection === 'steps' && hitlStepOrder) {
                        var stepEl = findStepSection(hitlStepOrder);
                        if (hitlSubstep) {
                            target = findSubstepInStep(stepEl, hitlSubstep) || stepEl;
                        } else {
                            target = stepEl;
                        }

                        // Missing-substep marker only when API sent after_substep
                        if (hasAfterParam && stepEl) {
                            var afterEl = hitlAfterSubstep ? findSubstepInStep(stepEl, hitlAfterSubstep) : null;
                            var marker = document.createElement('div');
                            marker.className = 'hitl-missing-marker';
                            marker.textContent = 'HITL: missing substep'
                                + (hitlSubstep ? (' ' + hitlSubstep) : '')
                                + (hitlAfterSubstep ? (' after ' + hitlAfterSubstep) : ' (first substep)')
                                + (hitlFlag ? (' — ' + hitlFlag) : '');
                            if (afterEl && afterEl.parentNode) {
                                if (afterEl.nextSibling) {
                                    afterEl.parentNode.insertBefore(marker, afterEl.nextSibling);
                                } else {
                                    afterEl.parentNode.appendChild(marker);
                                }
                                target = marker;
                            } else {
                                var contentBody = stepEl.querySelector('.section-content-body') || stepEl;
                                contentBody.insertBefore(marker, contentBody.firstChild);
                                target = marker;
                            }
                        }
                    } else if (hitlSection) {
                        var mappedId = sectionMap[hitlSection] || hitlSection;
                        if (mappedId === 'body') {
                            target = document.getElementById('body') || document.querySelector('#body-section');
                        } else {
                            target = document.getElementById(mappedId)
                                || document.querySelector('.procedure-section[data-pp-section="' + mappedId + '"]')
                                || document.querySelector('.procedure-section[data-section-id="' + mappedId + '"]');
                        }
                    }

                    if (target) {
                        highlightEl(target);
                    }
                })();
            })();
        </script>
	<?php
		}
		else {
	?>
		<h4 class="text-center text-danger">No details present</h4>
	<?php
		}
	?>
</body>
</html>