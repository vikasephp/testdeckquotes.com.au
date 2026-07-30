<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$keyword = $listdata['keyword'];
$where = " WHERE 1 = 1";

$clear = $fwRequest->getParam('clear', '');
if(!empty($clear)) {
	unset($_SESSION['keyword']);
	$keyword = '';
}

if(isset($_SESSION['keyword'])) {
	$keyword = $_SESSION['keyword'];
}

$fwViewData['keyword'] = $keyword;

 $matsql = 'SELECT CASE WHEN( ( SELECT MAX(LMM.lmm_doc_date_uploaded) FROM last_meeting_minutes AS LMM WHERE LMM.lmm_bsn_name IS NOT NULL AND LMM.lmm_bsn_name = last_meeting_minutes.lmm_bsn_name ) = last_meeting_minutes.lmm_doc_date_uploaded ) AND( ( SELECT MAX(LMM.lmm_id) FROM last_meeting_minutes AS LMM WHERE LMM.lmm_bsn_name IS NOT NULL AND LMM.lmm_bsn_name = last_meeting_minutes.lmm_bsn_name AND LMM.lmm_doc_date_uploaded = last_meeting_minutes.lmm_doc_date_uploaded ) = last_meeting_minutes.lmm_id ) THEN "Latest" ELSE lmm_doc_date_uploaded END AS latest_date, last_meeting_minutes.* FROM last_meeting_minutes WHERE lmm_bsn_name IS NOT NULL AND lmm_bsn_name LIKE "%' . $keyword . '%" ORDER BY latest_date DESC, lmm_id DESC;';
$userData = $fwDb->query($matsql);
$fwViewData['total'] = sizeof($userData);

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 300;
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$fwViewData['last'] = $last;
	$fwViewData['lastone'] = $last - 1;
	$fwViewData['lasttow'] = $last - 2;
	$fwViewData['pagenum'] = $pagenum;
	$pagenatedatanext = $pagenum;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginate[$pagenatedatanext] = $pagenatedatanext;
		$pagenatedatanext++;
	}
	$fwViewData['paginatenext'] = $paginate;
	$pagenatedataprev = $pagenum;
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	// $sql2 =  $matsql . " " . $max;
	// if ($sql2) {
	// 	$lists = $fwDb->query($sql2);

	// 	foreach ($lists as $list):

	// 		$listsnew[] = $list;
	// 	endforeach;

	// 	$fwViewData['list'] = $listsnew;
	// }
	$startPoint = $page_rows * ($pagenum - 1);
    $endPoint = $startPoint + $page_rows - 1;

	$listsnew = [];
    for ($i=$startPoint; $i<=$endPoint; $i++) {
		if(!empty($userData[$i])){
			$listsnew[] = $userData[$i];
		}
	}
}


foreach ($listsnew as $k => $v) {
	$fwDb = new Fw_Db();

	$sql_1 = 'SELECT bsn_id, bsn_status FROM business WHERE bsn_name = "' . $v['lmm_bsn_name'] . '"';
    $dataBus = $fwDb->queryOne($sql_1);
	// db($sql_1, 'sql_1');
	// db($dataBus, 'dataBus');
	
	// $listsnew[$k]['lmm_doc_date_uploaded'] = $listsnew[$k]['lm_id'] == $listsnew[$k]['latest_id'] ? 'Latest' : $listsnew[$k]['lmm_doc_date_uploaded'];
	$listsnew[$k]['latest_date'] = $listsnew[$k]['latest_date'];
	
	$status_string = "'" . $dataBus['bsn_status'] . "'";
	$status = '';

	if (strpos($status_string, '|1|') > 0) {
		$status .= "Convert<br>";
	}
	if (strpos($status_string, '|2|') > 0) {
		$status .= "Planning Approvals<br>";
	}
	if (strpos($status_string, '|3|') > 0) {
		$status .= "Construction<br>";
	}
	if (strpos($status_string, '|4|') > 0) {
		$status .= "Complete<br>";
	}
	if (strpos($status_string, '|5|') > 0) {
		$status .= "Inclusions<br>";
	}
	if (strpos($status_string, '|6|') > 0) {
		$status .= "Pre-construction<br>";
	}
	if (strpos($status_string, '|12|') > 0) {
		$status .= "Design Phase<br>";
	}
	if (strpos($status_string, '|15|') > 0) {
		$status .= "Lost";
	}

	$listsnew[$k]['status'] = $status;

	$sqltp = 'SELECT count(*) as tot_mm FROM last_meeting_minutes WHERE lmm_bsn_name = "' . $v['lmm_bsn_name'] . '"';
	$datatp  = $fwDb->queryOne($sqltp);

	$listsnew[$k]['tot_mm'] = $datatp['tot_mm'];
}

$fwViewData['list'] = $listsnew;


$fwViewData['title'] = $MODULE_PLURAL;
