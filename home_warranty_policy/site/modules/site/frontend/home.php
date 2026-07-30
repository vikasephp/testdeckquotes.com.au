<?php
date_default_timezone_set("Australia/Sydney");
require_once($_SERVER['DOCUMENT_ROOT'] . '/site/lib/CommonClass.php');
$commonObj = new CommonClass;

$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('home_warranty_database');
$tablela = new Fw_Db_Table('home_war_report_last_audit');

$where = "WHERE hw_status = 1 ";

$public_status = $fwRequest->getParam('public_status', '');
if (!empty($public_status)) {
	$dt = date('d-m-Y');
	$key = array_keys($public_status);
	$ky = $key[0];

	if (isset($_SESSION['user']['user_name'])) {
		$user = $_SESSION['user']['user_name'];
		$psDetail['hw_public_status_user'] = $user;
	} else {
		$psDetail['hw_public_status_user'] = '';
	}

	$psDetail['hw_public_status'] = $public_status[$ky];
	$psDetail['hw_public_status_date'] = $dt;

	$table->setWhere('hw_id = ' . $ky);
	if ($table->rowExists()) {
		$detail = $table->updateRow($psDetail);
	}
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where;

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$total2 = sizeof($userData);
$fwViewData['active'] =  $total2;

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
	$page_rows = 100;
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

			$setdata2[] = $list;
		endforeach;

		//$fwViewData['list'] = $listsnew;
	}
}


foreach ($setdata2 as $k => $v2) {

	$sq12 = "SELECT bsn_id, bsn_status from business where bsn_name = '" . $v2['hw_project_address'] . "'";

	$data = $fwDb->queryOne($sq12);
	$link = BASE_URL . "business.detail/bsn_id/" . $data['bsn_id'];

	$setdata2[$k]['link'] = $link;
	$setdata2[$k]['project_status'] = $commonObj->formatProjectStatus($data['bsn_status']);

	$sqldoc = "select doc_file_name from document_check_list
	             where doc_name_id =  121 and doc_bsn_id = " . $data['bsn_id'];
	$doc121 = $fwDb->queryOne($sqldoc);

	$sql173 = "select doc_file_name from document_check_list
	             where doc_name_id =  173 and doc_bsn_id = " . $data['bsn_id'];
	$doc173 = $fwDb->queryOne($sql173);

	$setdata2[$k]['document121'] = $doc121['doc_file_name'];
	$setdata2[$k]['document173'] = $doc173['doc_file_name'];
}

$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;
