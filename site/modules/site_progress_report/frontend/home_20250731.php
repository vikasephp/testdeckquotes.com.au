<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('debt_recovery_report');

$where = " WHERE 1 = 1";
// $ord = " ORDER BY $ID DESC";
$ord = " ORDER BY sp_id DESC";
// $ord =  " ORDER BY IF(sp_date='' OR sp_date IS NULL, 1, 0), STR_TO_DATE(sp_date, '%d-%m-%Y') DESC";

$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['address']);
	unset($_SESSION['sp_task_name']);
	unset($_SESSION['position']);
	unset($_SESSION['due_date']);
	$where = " where 1 = 1";
}

$address = $fwRequest->getParam('address', '');
if ($address):
	$where .= " AND site_progress_report.sp_project LIKE '%" . $address . "%'";
	$_SESSION['address'] = $address;
	$fwViewData['address'] = $_SESSION['address'];
elseif ($_SESSION['address']):
	$where .= " AND site_progress_report.sp_project LIKE '%" . $_SESSION['address'] . "%' ";
	$fwViewData['address'] = $_SESSION['address'];
endif;

$sp_task_name = $fwRequest->getParam('sp_task_name', '');
if ($sp_task_name):
	$where .= " AND site_progress_report.sp_task_name = $sp_task_name";
	$_SESSION['sp_task_name'] = $sp_task_name;
	$fwViewData['sp_task_name'] = $_SESSION['sp_task_name'];
elseif ($_SESSION['sp_task_name']):
	$where .= " AND site_progress_report.sp_task_name = " . $_SESSION['sp_task_name'] . "";
	$fwViewData['sp_task_name'] = $_SESSION['sp_task_name'];
endif;

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

$query = "SELECT * FROM site_progress_report_task";
$result = $fwDb->query($query);
$fwViewData['cdetail'] = $result;
$site_progress_report_task = [];
foreach($result as $row) {
	$site_progress_report_task[$row['tn_id']] = $row['tn_name'];
}
$fwViewData['site_progress_report_task'] = $site_progress_report_task;

$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . ' ' . $where . ' GROUP BY sp_bsn_id, sp_task_name' . $ord;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$fwViewData['total'] = sizeof($userData);
$listsnew = [];
if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 200;
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

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);
		foreach ($lists as $list):
			$listsnew[] = $list;
		endforeach;
	}
}

foreach ($listsnew as $index => $list):
	$listsnew[$index]['link'] = BASE_URL . 'business.detail/bsn_id/' . $list['sp_bsn_id'];
	$listsnew[$index]['sp_project'] = $projectArr[$list['sp_bsn_id']];
	$listsnew[$index]['sp_task_id'] = $list['sp_task_name'];
	$listsnew[$index]['sp_task_name'] = $site_progress_report_task[$list['sp_task_name']];
endforeach;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;




