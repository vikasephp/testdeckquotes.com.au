<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());

$sync = $fwRequest->getParam('sync', '');
if ($sync) {
	$sql1 = "select tc_project, tc_days_delay, tc_sync from timeline_center where tc_id = " . $sync;
	$pData = $fwDb->queryOne($sql1);

	$sql2 = "select bsn_cip_total_days_added from business where bsn_name like '%" . $pData['tc_project'] . "'";
	$dataT = $fwDb->queryOne($sql2);

	$add = $dataT['bsn_cip_total_days_added'] + $pData['tc_days_delay'];

	$sql2 = "update business set bsn_cip_total_days_added = " . $add . " where bsn_name like '%" . $pData['tc_project'] . "'";
	$fwDb->queryOne($sql2);

	if ($pData['tc_sync'] == 0) {
		$sql2 = "update timeline_center set tc_sync = 1 where tc_id = " . $sync;
	} elseif ($pData['tc_sync'] == 1) {
		$sql2 = "update timeline_center set tc_sync = 0 where tc_id = " . $sync;
	}
	$fwDb->queryOne($sql2);
}



$where = "WHERE tc_status = 'Open' ";

// $submit = $fwRequest->getParam('openclose', '');
// if (!empty($submit)) {
// 	$_SESSION['openclose'] = true;
// 	$where = "WHERE 1=1";
// } elseif (isset($_SESSION['openclose']) && $_SESSION['openclose']) {
// 	$where = "WHERE 1=1";
// }

$show_open = $fwRequest->getParam('show_open', '');
if(!empty($show_open)) {
	$_SESSION['show_open'] = $show_open;
	unset($_SESSION['show_close']);
}

$show_close = $fwRequest->getParam('show_close', '');
if(!empty($show_close)) {
	$_SESSION['show_close'] = $show_close;
	unset($_SESSION['show_open']);
}

if(isset($_SESSION['show_open'])) {
	$where = "WHERE tc_status = 'Open'";
}

if(isset($_SESSION['show_close'])) {
	$where = "WHERE tc_status = 'Closed'";
}

$ord = " Order by STR_TO_DATE(timeline_center.tc_letter_email, '%d-%m-%Y' ) DESC ";

$matsql = "SELECT timeline_center.* from timeline_center " . $where . $ord;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 500;
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

		$fwViewData['list'] = $listsnew;
	}
}

$fwViewData['title'] = $MODULE_PLURAL;
