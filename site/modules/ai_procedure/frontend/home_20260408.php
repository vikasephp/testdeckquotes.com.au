<?php
	$fwViewData['blank_page'] = true;

	function retrieveContent($did)
    {
        // $url = 'https://ai.deckquotes.com.au/api/v1/procedure/document?id=DID' . $did;
        // $response = Http::withToken('A9fK2LmP4QX7ZbR3')->get($url); 
        // return $response->json();
		$url = "https://ai.deckquotes.com.au/api/v1/procedure/document?id=$did";
		$ch = curl_init();
		curl_setopt_array($ch, [
			CURLOPT_URL => "https://ai.deckquotes.com.au/api/v1/procedure/document?id=$did",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTPHEADER => [
				"Authorization: Bearer A9fK2LmP4QX7ZbR3",
				"Accept: application/json, text/plain, */*",
				"User-Agent: Mozilla/5.0",
				"X-Requested-With: XMLHttpRequest",
				"Referer: https://www.deckquotes.com.au/ai_procedure/pd/DID$did",
				"Origin: https://www.deckquotes.com.au"
			],
		]);
		$response = curl_exec($ch);

		// echo "<pre>";
		// echo "URL: $url\n\n";
		// echo $response;
		// exit;

		return json_decode($response, true);
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
                'html' => formatTableToHtml($data['pp_table_overview'])
            ];
        }

        // 2. Doc Info Table (Metadata)
        if (!empty($data['pp_table_doc_info'])) {
            $content[] = [
                'id' => 'metadata',
                'level' => 1,
                'title' => $data['pp_table_doc_info']['heading'] ?? 'Document Info',
                'html' => formatTableToHtml($data['pp_table_doc_info'])
            ];
        }

        // 3. Prerequisites Table
        if (!empty($data['pp_table_prerequisites'])) {
            $content[] = [
                'id' => 'prerequisites',
                'level' => 1,
                'title' => $data['pp_table_prerequisites']['heading'] ?? 'Prerequisites',
                'html' => formatTableToHtml($data['pp_table_prerequisites'])
            ];
        }

        // 4. Steps
        if (!empty($data['pp_steps'])) {
            foreach ($data['pp_steps'] as $index => $step) {
                $title = $step['title'] ?? '';
                $level = 1;
                $stepId = 'step' . ($index + 1);
                $html = '';

                if (preg_match('/^Step (\d+):/i', $title, $matches)) {
                    $stepId = 'step' . $matches[1];
                } elseif (preg_match('/^(\d+)\.\s/i', $title, $matches)) {
                    // Likely a sub-step or numbered item
                    $level = 2;
                    // Try to guess parent step from context or index, but for now just use a unique ID
                    $stepId = 'item-' . ($index + 1);
                } elseif (strpos(strtolower($title), 'question and answer') !== false) {
                    $stepId = 'qa';
                } elseif (strpos(strtolower($title), 'improvement') !== false) {
                    $stepId = 'improvement';
                }

                if(!empty($step['body'])) {
                    $html .= formatStepBodyToHtml($step['body']);
                }

                // if substeps is not empty and content_substeps is empty, then it should not be added in index table
                if(!empty($step['substeps']) && empty($step['contents_substeps'])) {
                    foreach($step['substeps'] as $substep) {
                        $html .= ('<h6>' . $substep['number'] . '. '. $substep['title'] . '</h6>');
                        $html .= ('<div class="ps-4">' . $substep['content'] . '</div>');
                    }
                }

                $content[] = [
                    'id' => $stepId,
                    'level' => $level,
                    'title' => $title,
                    'html' => $html
                ];

                // if substeps is not empty and content_substeps is not empty, then it should not be added in index table
                if(!empty($step['substeps']) && !empty($step['contents_substeps'])) {
                    $substeps = collect($step['substeps']);
                    $level = 2;
                    foreach($step['contents_substeps'] as $i => $substep) {
                        $title = $substep['number'] . '. '. $substep['title'];
                        // $html .= ('<h6>' . $substep['number'] . '. '. $substep['title'] . '</h6>');
                        $html = $substeps->where('title', $substep['title'])->first()['content'] ?? '';

                        $content[] = [
                            'id' => ($stepId . '-' . $level . $i),
                            'level' => $level,
                            'title' => $title,
                            'html' => $html
                        ];
                    }
                }
                
                
            }
        }

        // 5. Q&A Table
        if (!empty($data['pp_qa'])) {
            $content[] = [
                'id' => 'qa',
                'level' => 1,
                'title' => $data['pp_qa']['heading'] ?? 'Q&A',
                'html' => formatTableToHtml($data['pp_qa'], true)
            ];
        }

        // 6. Improvement Table
        if (!empty($data['pp_improvement'])) {
            $content[] = [
                'id' => 'improvement',
                'level' => 1,
                'title' => $data['pp_improvement']['heading'] ?? 'Improvement Suggestion',
                'html' => formatTableToHtml($data['pp_improvement'])
            ];
        }

        return [
            'title' => ($data['pp_title'] ?? ''),
            // 'last-updated' => str_replace('/', '-', $data['pp_doc_last_updated_at'] ?? ''),
            'last-updated' => $data['pp_doc_last_updated_at'],
            'content' => $content,
            'owner' => $data['pp_owner'],
        ];
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
                    $html .= '<th>' . $header . '</th>';
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
                    $cellContent = linkify(nl2br($cell));
                    // $cellContent = linkify(nl2br(e($cell)));
                    $html .= "<td{$class}>{$cellContent}</td>";
                }
                $html .= '</tr>';
            }
        }
        $html .= '</tbody></table>';

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
            $type = $item['type'] ?? 'text';
            $content = $item['content'] ?? '';
            $html .= $content;
        }
        return $html;
    }

	$pd = $fwRequest->getParam('pd', '');
	$did = preg_replace('/\D/', '', $pd);

	$scriptData = null;
	$content = null;
	$data = retrieveContent($pd);
	// echo "<pre>";
	// print_r($data);
	// exit;
	if (isset($data['status']) && $data['status'] === 'ok') {
		$content = convertToDidFormat($data['data']);
	}

	$sql = 'SELECT * FROM template_docs WHERE dh_id = "' . $did . '"';
	$templateDoc = $fwDb->queryOne($sql);
	$linkedDocs = null;
	$pageTitle = $MODULE_PLURAL;
	if(!empty($templateDoc)) {
		$pageTitle = $templateDoc['dh_title'];
		$linkedDocs = $templateDoc['dh_link_word'];
		$scriptData = json_encode($data, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_SLASHES);
	}

	$sql = 'SELECT * FROM busness_status_task_ai_proc WHERE btp_doc = "' . $did . '"';
	$aiProc = $fwDb->query($sql);
	$linkedTasks = [];
	if(!empty($aiProc)) {
		foreach($aiProc as $proc) {
			$linkedTasks[] = $proc['btp_bst_id'];
		}
	}

	$iframeUrl = 'https://planningapprovalscanberra.com.au/api_ai_page/' . $did;
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

		#body-section img {
			padding: .25rem;
			background-color: var(--bs-body-bg);
			border: var(--bs-border-width) solid var(--bs-border-color);
			border-radius: var(--bs-border-radius);
			max-width: 100%;
			height: auto;
			margin-bottom: 1rem;
			/* max-width: 800px;
			display: block; */
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
		<div aria-hidden="true" style="position: absolute; left: -9999px; width: 1px;">
			<?= $scriptData ?>
		</div>
		<div class="d-flex flex-column gap-4 p-4 py-5">
            <section id="page-header">
                <table class="table">
                    <tr>
                        <td class="text-start border-x-0 border-t-0">
                            <span class="text-muted">Procedure ID:</span> <span class="text-dark">DID<?= $did ?></span>
                        </td>
                        <td class="text-end border-x-0 border-t-0"></td>
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
							<td class="text-start border-x-0" colspan="2"><strong>Source Procedure Doc Link:</strong> <a href="<?= $linkedDocs ?>" target="_blank"><?= $linkedDocs ?></a></td>
						</tr>
					<?php
						}
					?>
                </table>
            </section>
            <section id="body">
                <div class="d-flex flex-row gap-3 align-items-start">
                    <div id="content-section" class="position-sticky top-4 z-10">
						<div class="overflow-y-auto" style="height: 90vh !important;">
							<table class="table" style="width: 300px;">
								<tr>
									<th class="bg-navy text-white">Table of Contents</th>
								</tr>
								<?php
									foreach($content['content'] as $row) {
								?>
									<tr>
										<th class="bg-light-blue <?= $row['level'] == 2 ? 'ps-4' : '' ?>">
											<a href="#<?= $row['id'] ?>" class="text-navy"><?= $row['title'] ?></a>
										</th>
									</tr>
								<?php
									}
								?>
							</table>
						</div>
                    </div>
                    <div id="body-section" style="width: 100%;">
						<?php
							$lastIndex = count($content['content']) - 1;
							foreach($content['content'] as $index => $row) {
						?>
                            <div id="<?= $row['id'] ?>" class="py-4">
                                <h3 class="text-start text-navy <?= $row['level'] == 1 ? 'fw-bold h3' : '' ?> <?= $row['level'] == 2 ? 'h4' : '' ?> <?= $row['level'] == 3 ? 'h5' : '' ?>">
                                    <?= $row['title'] ?>
                                </h3>
                                <?= $row['html'] ?>                                
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
		<script>
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