<?php
$pagenum = $fwRequest->getparamget('pagenum',0);
$fwViewData['ran'] =  rand(100000,999999);

$TABLE = new Fw_Db_Table($TABLE);

$where = "WHERE 1=1 ";

// Show Visible / Show Hidden:
// - Show Hidden uses a one-time session flag, then redirects to GET
// - Manual refresh (next GET) returns to Visible
$show_hidden = $fwRequest->getParam('show_hidden', '');
$show_visible = $fwRequest->getParam('show_visible', '');
$homeUrl = BASE_URL . (isset($XFA['home']) ? $XFA['home'] : 'project_delay_register.home');

if (!empty($show_hidden)) {
	$_SESSION['pdr_show_hidden_once'] = 1;
	Location($homeUrl);
}
if (!empty($show_visible)) {
	unset($_SESSION['pdr_show_hidden_once']);
	Location($homeUrl);
}

$pdrShowMode = 'visible';
if (!empty($_SESSION['pdr_show_hidden_once'])) {
	$pdrShowMode = 'hidden';
	unset($_SESSION['pdr_show_hidden_once']);
}
$fwViewData['pdr_show_mode'] = $pdrShowMode;

$project_hide = $fwRequest->getParam('project_hide', '');
if (!empty($project_hide) && !empty($project_hide['pdr_id'])) {

	$pdr_id = (int)$project_hide['pdr_id'];
	// Checkbox unchecked => hidden field 0 (or missing) restores project to visible list.
	$val_os = isset($project_hide['pdr_hide']) ? (int)$project_hide['pdr_hide'] : 0;
	if ($val_os !== 1) {
		$val_os = 0;
	}

	$detail_en = array();
	$detail_en['pdr_hide'] = $val_os;
	$detail_en['pdr_hide_by'] = $_SESSION['user']['user_name'];
	$detail_en['pdr_hide_date'] = date('d-m-Y');

	$TABLE->setWhere("pdr_id = $pdr_id");

	if ($TABLE->rowExists()) {
		$TABLE->updateRow($detail_en);
	}

	$redirectUrl = $homeUrl;
	if (!empty($pagenum)) {
		$redirectUrl .= '/pagenum/' . (int)$pagenum;
	}
	Location($redirectUrl);
}

// Default / Show Visible: only non-hidden. Show Hidden: only for this one page load.
if ($pdrShowMode === 'hidden') {
	$where .= " AND IFNULL(pdr_hide, 0) = 1 ";
} else {
	$where .= " AND IFNULL(pdr_hide, 0) = 0 ";
}

// Search by Project (same pattern as central_letter_database home)
$search_project = $fwRequest->getParam('search_project', '');
$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['pdr_search_project']);
	unset($fwViewData['search_project']);
} elseif ($search_project) {
	$where .= " AND pdr_project_address = '" . addslashes($search_project) . "'";
	$_SESSION['pdr_search_project'] = $search_project;
	$fwViewData['search_project'] = $_SESSION['pdr_search_project'];
} elseif (!empty($_SESSION['pdr_search_project'])) {
	$where .= " AND pdr_project_address = '" . addslashes($_SESSION['pdr_search_project']) . "'";
	$fwViewData['search_project'] = $_SESSION['pdr_search_project'];
}

// Datalist options = only projects already added to Project Delay Register
$projSql = "SELECT DISTINCT pdr_project_address AS bsn_name
	FROM project_delay_register
	WHERE pdr_project_address IS NOT NULL AND TRIM(pdr_project_address) <> ''
	ORDER BY pdr_project_address ASC";
$fwViewData['projdetail'] = $fwDb->query($projSql);
if (!isset($fwViewData['search_project'])) {
	$fwViewData['search_project'] = '';
}
   
$matsql = "SELECT project_delay_register.* FROM project_delay_register ".$where." ORDER BY $ID ASC";	

if($matsql){$userData = $fwDb->query($matsql);}

// Timeline aggregates (shared by list + dashboard summary).
$timelineLetterCounts = [];
$timelineDelaySums = [];
$timelineLastLetterSent = [];
$timelineAggSql = "SELECT tc_project,
		COUNT(*) AS letter_count,
		COALESCE(SUM(CAST(tc_days_delay AS DECIMAL(12,2))), 0) AS delay_sum,
		MAX(STR_TO_DATE(NULLIF(TRIM(tc_letter_email), ''), '%d-%m-%Y')) AS last_letter_sent_date
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
		$delaySum = (float)$tcRow['delay_sum'];
		$timelineDelaySums[$projectKey] = (floor($delaySum) == $delaySum)
			? (int)$delaySum
			: $delaySum;
		$lastDate = !empty($tcRow['last_letter_sent_date']) ? $tcRow['last_letter_sent_date'] : '';
		if ($lastDate && $lastDate !== '0000-00-00') {
			$timelineLastLetterSent[$projectKey] = date('d-m-Y', strtotime($lastDate));
		} else {
			$timelineLastLetterSent[$projectKey] = '';
		}
	}
}

// Dashboard summary totals: visible projects only (hidden never counted).
$summaryLetters = 0;
$summaryDelays = 0;
$summaryProjects = 0;
$visibleSql = "SELECT pdr_project_address FROM project_delay_register WHERE IFNULL(pdr_hide, 0) = 0";
$visibleRows = $fwDb->query($visibleSql);
if (!empty($visibleRows) && is_array($visibleRows)) {
	foreach ($visibleRows as $visRow) {
		$summaryProjects++;
		$pKey = strtolower(trim((string)$visRow['pdr_project_address']));
		if ($pKey === '') {
			continue;
		}
		if (isset($timelineLetterCounts[$pKey])) {
			$summaryLetters += (int)$timelineLetterCounts[$pKey];
		}
		if (isset($timelineDelaySums[$pKey])) {
			$summaryDelays += $timelineDelaySums[$pKey];
		}
	}
}
$fwViewData['summary_project_count'] = $summaryProjects;
$fwViewData['summary_total_letters'] = $summaryLetters;
$fwViewData['summary_total_delays'] = $summaryDelays;

if(!empty($userData))
{
if (!(isset($pagenum))){ $pagenum = 1; } 
    $rows = count($userData);
    $page_rows = 100;
    $last = ceil($rows/$page_rows);    
    if ($pagenum <= 1)
    {
        $pagenum = 1;
    }
    elseif ($pagenum > $last)
    {
        $pagenum = $last;
    }
    $fwViewData['last'] = $last;
    $fwViewData['lastone'] = $last-1;
	$fwViewData['lasttow'] = $last-2;
    $fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for($i=0; $i<9; $i++)
		{
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext ++;
		}
		$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;	
	for($i=0; $i<9; $i++)
		{
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev --;
		}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
	
    $max = 'limit ' .($pagenum - 1) * $page_rows .',' .$page_rows;
    
    $sql2 =  $matsql." ".$max;
    if($sql2){
		$lists = $fwDb->query($sql2);

		$listsnew = [];
		foreach($lists as $k => $v ):
		
			if (!empty($v['docqa_id'])) {
				$sql_note_date = "SELECT doc_created_at FROM dual_occupancy_notes where doc_docqa_id = ".$v['docqa_id']." order by doc_id desc limit 1";
				$data_note_date = $fwDb->queryOne($sql_note_date);
				$v['note_date'] = !empty($data_note_date['doc_created_at']) ? $data_note_date['doc_created_at'] : '';
			} else {
				$v['note_date'] = '';
			}

			$pdrProjectKey = strtolower(trim((string)$v['pdr_project_address']));
			$v['total_letters_sent'] = isset($timelineLetterCounts[$pdrProjectKey])
				? $timelineLetterCounts[$pdrProjectKey]
				: 0;
			$v['total_delays_added'] = isset($timelineDelaySums[$pdrProjectKey])
				? $timelineDelaySums[$pdrProjectKey]
				: 0;
			$v['last_letter_sent'] = isset($timelineLastLetterSent[$pdrProjectKey])
				? $timelineLastLetterSent[$pdrProjectKey]
				: '';
			
			$listsnew[] = $v;
		endforeach;
		
		//echo "<pre>"; print_r($listsnew); exit();
		
		$fwViewData['list'] = $listsnew;
	  }
}

$fwViewData['title'] = $MODULE_PLURAL;
