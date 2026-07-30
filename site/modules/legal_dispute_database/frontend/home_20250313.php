<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden) || $_SESSION['show_hidden']) {
	$_SESSION['show_hidden'] =  $show_hidden;
	$where = " WHERE ldd_hide = 1";
}
else{
	$where = " WHERE ldd_hide = 0";
}

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['show_hidden']);
	$where = " where ldd_hide = 0";
}

$ord = ' ORDER BY ldd_created_at DESC';

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open'";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach($projdetail as $project){
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($sql);
$clientArr = [];
foreach($custdetail as $cust){
	$clientArr[$cust['bs_business_id']] = $cust['bcust_fname'] . ' ' . $cust['bcust_lname'];
}
$fwViewData['clientArr'] = $clientArr;

$matsql = "SELECT $TABLE.* FROM $TABLE $where $ord";

$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
    if (!(isset($pagenum))) {
        $pagenum = 1;
    }
    $rows = count($resultData);
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

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['ldd_bsn_id'];
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

$thisTable = new Fw_Db_Table('legal_dispute_database_type');
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table('legal_dispute_database_status');
$fwViewData['statusdata'] = $statusdata  = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
