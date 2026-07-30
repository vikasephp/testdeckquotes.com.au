<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " WHERE STR_TO_DATE(po_invoice_date, '%d-%m-%Y') >= '01-07-2024'";

//Fetch all Type for Supplier Report
$type = "SELECT * FROM supplier_report_type";
$resultType = $fwDb->query($type);
$fwViewData['resultType'] = $resultType;


$search_project = $fwRequest->getParam('search_project', '');
if ($search_project):
	$sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_name = '" . $search_project . "'";
	$res = $fwDb->queryOne($sql);
	$where .= " AND cld_bsn_id = " . $res['bsn_id'] . "";
	$_SESSION['search_project'] = $search_project;
	$fwViewData['search_project'] = $_SESSION['search_project'];
elseif ($_SESSION['search_project']):
	$sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_name = '" . $_SESSION['search_project'] . "'";
	$res = $fwDb->queryOne($sql);
	$where .= " AND cld_bsn_id = " . $res['bsn_id'] . "";
	$fwViewData['search_project'] = $_SESSION['search_project'];
endif;

$search_type = $fwRequest->getParam('search_type', '');
if ($search_type != ''):
	$where .= " AND cld_letter_type_id = " . $search_type . "";
	$_SESSION['search_type'] = $search_type;
	$fwViewData['search_type'] = $_SESSION['search_type'];
elseif ($_SESSION['search_type'] != ''):
	$where .= " AND cld_letter_type_id = " . $_SESSION['search_type'] . "";
	$fwViewData['search_type'] = $_SESSION['search_type'];
endif;

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['search_project']);
	unset($_SESSION['search_type']);
	unset($fwViewData['search_project']);
	unset($fwViewData['search_type']);
	$where = " WHERE 1 = 1";
}


$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;
$fwViewData['projdetail'] = $projdetail;

$custsql = "Select business_sellers.bs_business_id, bus_customers.bcust_id, bus_customers.bcust_fname, bus_customers.bcust_lname from business_sellers LEFT JOIN bus_customers on business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($custsql);
$clientArr = [];
foreach ($custdetail as $cust) {
	$clientArr[$cust['bs_business_id']] = $cust['bcust_fname'] . ' ' . $cust['bcust_lname'];
}
$fwViewData['clientArr'] = $clientArr;


$userSql = "SELECT `user_id`, `user_name` FROM `users`";
$userdetail = $fwDb->query($userSql);
$userArr = [];
foreach ($userdetail as $user) {
	$userArr[$user['user_id']] = $user['user_name'];
}
$fwViewData['userArr'] = $userArr;

$additionalFilesArr = [];
$sql = 'SELECT * FROM central_letter_database_files';
$res = $fwDb->query($sql);
foreach ($res as $row) {
	if (!isset($additionalFilesArr[$row['cldf_cld_id']])) {
		$additionalFilesArr[$row['cldf_cld_id']] = [];
	}
	$additionalFilesArr[$row['cldf_cld_id']][$row['cldf_id']] = $row['cldf_file'];
}
$fwViewData['additionalFilesArr'] = $additionalFilesArr;

/* $matsql = "SELECT c.co_id, c.co_company_name, ( SELECT COUNT(*) FROM warranty_log w WHERE w.wa_status = 'Open' AND w.wa_include_supplier LIKE CONCAT('%>', c.co_company_name, '<%') ) AS sr_open_count FROM companies c JOIN poincc2 p ON p.po_supplier = c.co_company_name WHERE STR_TO_DATE(p.po_invoice_date, '%d-%m-%Y') >= '2024-07-01' GROUP BY c.co_id, c.co_company_name"; */

$matsql1 = "INSERT INTO supplier_report (sr_id, sr_supplier_name, sr_open_count) SELECT c.co_id, c.co_company_name, ( SELECT COUNT(*) FROM warranty_log w WHERE w.wa_status = 'Open' AND w.wa_include_supplier LIKE CONCAT('%>', c.co_company_name, '<%') ) AS sr_open_count FROM companies c JOIN poincc2 p ON p.po_supplier = c.co_company_name WHERE STR_TO_DATE(p.po_invoice_date, '%d-%m-%Y') >= '2024-07-01' GROUP BY c.co_id, c.co_company_name ON DUPLICATE KEY UPDATE sr_open_count = VALUES(sr_open_count)";

//$resultData = $fwDb->query($matsql);

/* database layer initialization */
require_once(LIB_DIR . 'Fw/Db.php');

$db = Fw_Db::getInstance();

$result = $db->Execute($matsql1);

$matsql = "SELECT * FROM `supplier_report` ORDER BY sr_open_count DESC";
$resultData = $fwDb->query($matsql);

if (!empty($resultData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($resultData);
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
	$fwViewData['start_sn'] = ($pagenum - 1) * $page_rows + 1;

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);
		foreach ($lists as $list):
			$list['link'] =  $BASE_URL . "business.detail/bsn_id/" . $list['cld_bsn_id'];
			$listsnew[] = $list;
		endforeach;
		$fwViewData['list'] = $listsnew;
	}
}

$thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
$typeArr = [];
foreach($typedata as $row){
	$typeArr[$row['cld_id']] = $row['cld_type'];
}
$fwViewData['typeArr'] = $typeArr;

$thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
$fwViewData['statusdata'] = $statusdata = $thisTable->getAllRows();
$statusArr = [];
foreach($statusdata as $row){
	$statusArr[$row['cld_id']] = $row['cld_status'];
}
$fwViewData['statusArr'] = $statusArr;

$fwViewData['title'] = $MODULE_PLURAL;
