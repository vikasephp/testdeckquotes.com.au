<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$fwViewData['ran'] =  rand(100000, 999999);

$save_rc = $fwRequest->getParam('save_rc', '');
if (!empty($save_rc)) {
	$re_id = $fwRequest->getParam('re_id', 0);
	$link = $fwRequest->getParam('re_recruitment_checklist', '');

	$tablePages->setWhere('re_id = ' . $re_id);
	$detailRC['re_recruitment_checklist'] = $link;

	$opr = $tablePages->updateRow($detailRC);

	$fwViewData['opr'] = $opr;
}


$save_oc = $fwRequest->getParam('save_oc', '');
if (!empty($save_oc)) {
	$re_id = $fwRequest->getParam('re_id', 0);
	$link = $fwRequest->getParam('re_onboarding_checklist', '');

	$tablePages->setWhere('re_id = ' . $re_id);
	$detailOC['re_onboarding_checklist'] = $link;

	$opr = $tablePages->updateRow($detailOC);

	$fwViewData['opr'] = $opr;
}



// Save email 1 sent
$email_1 = $fwRequest->getParam('email_1', '');
if (!empty($email_1)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($email_1);
	$ky = $key[0];

	$emailDetail['re_email_1_sent'] = $email_1[$ky];
	$emailDetail['re_email_1_user'] = $user;
	$emailDetail['re_email_1_date'] = $dt;

	$tablePages->setWhere('re_id = ' . $ky);
	$detail = $tablePages->updateRow($emailDetail);
}
//End Email 1 Sent


// Save email 2 sent
$email_2 = $fwRequest->getParam('email_2', '');
if (!empty($email_2)) {
	$dt = date('d-m-Y h:i:sa');
	$user = $_SESSION['user']['user_name'];
	$key = array_keys($email_2);
	$ky = $key[0];

	$emailDetail['re_email_2_sent'] = $email_2[$ky];
	$emailDetail['re_email_2_user'] = $user;
	$emailDetail['re_email_2_date'] = $dt;

	$tablePages->setWhere('re_id = ' . $ky);
	$detail = $tablePages->updateRow($emailDetail);
}
//End Email 1 Sent



$hide = $fwRequest->getParam('hide', '');


if ($hide) {

	foreach ($hide as $k => $v) {
		$id = $k;
	}

	$detail['re_hide'] = $v;
	$tablePages->setWhere("re_id = " . $id);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$login = $fwRequest->getParam('login', '');
if ($login) {
	foreach ($login as $k => $v) {
		$id = $k;
	}

	$detail['re_is_login_enabled'] = $v;
	$tablePages->setWhere("re_id = " . $id);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE re_hide = 0 ";
$showall = $fwRequest->getParam('showall', '');
if (!empty($showall)) {
	$where = "WHERE 1 = 1";
} else {
	$where = "WHERE re_hide = 0 ";
}

if ($keyword) {
	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];
} else {
	unset($_SESSION['keyword']);
}


if ($keyword):
	$where .= "AND " . $TABLE . ".re_position LIKE '%" . $keyword . "%' OR " . $TABLE . ".re_name LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
	$fwViewData['keyword'] = $_SESSION['keyword'];

elseif ($_SESSION['keyword'] && $pagenum > 0):

	$where .= "AND " . $TABLE . ".re_position LIKE '%" . $keyword . "%' OR " . $TABLE . ".re_name LIKE '%" . $keyword . "%'";

	$fwViewData['keyword'] = $_SESSION['keyword'];
endif;

//Get Positions   
$get_positions = "SELECT position_matrix.pm_position, positions.p_name FROM `position_matrix` Left JOIN positions on position_matrix.pm_position = positions.p_id";
if($get_positions){
	$get_positions_data = $fwDb->query($get_positions);
	$fwViewData['get_positions_data'] =  $get_positions_data;
}

$sql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . " Order by re_id DESC ";

if ($sql) {
	$userData = $fwDb->query($sql);
}

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}

	$rows = count($userData);

	$page_rows = 400;
	$last = ceil($rows / $page_rows);

	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$numstartvounter =  $page_rows * ($pagenum - 1) + 1;
	$fwViewData['numstartvounter'] = $numstartvounter;

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

	$sql2 =  $sql . " " . $max;

	if ($sql2) {

		$setdata = $fwDb->query($sql2);
		$fwViewData['list'] =  $setdata;
	}
}

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Recruitment List";