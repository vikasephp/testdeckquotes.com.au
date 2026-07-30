<?php

$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);

$export = $fwRequest->getParam('export', 0);
$fwViewData['ran'] = rand(100000, 999999);

$where = " WHERE 1=1 ";
$ord = " ORDER BY STR_TO_DATE(short_stays_payables_tracker.ssp_invoice_date,'%d-%m-%Y') DESC";

$sub_ssp_pornp = $fwRequest->getParam('ssp_pornp', '');
if (!empty($sub_ssp_pornp)) {
	$pornp = $fwRequest->getParam('ssp_pornp', '');
	foreach ($pornp as $k => $v) {
		$pnpDetail['ssp_pornp'] = $v;
		$tablerm = new Fw_Db_Table('short_stays_payables_tracker');
		$tablerm->setWhere('ssp_id = ' . $k);
		$tablerm->updateRow($pnpDetail);
	}
}

$submit_coacc = $fwRequest->getParam('ssp_chartof_acc', '');
if (!empty($submit_coacc)) {
	$chartof_acc = $fwRequest->getParam('ssp_chartof_acc', '');
	foreach ($chartof_acc as $k => $v) {
		$coaDetail['ssp_chartof_acc'] = $v;
		$tablerm = new Fw_Db_Table('short_stays_payables_tracker');
		$tablerm->setWhere('ssp_id = ' . $k);
		$tablerm->updateRow($coaDetail);
	}
}

$clearall = $fwRequest->getParam('clearall', '');

$supplier = $fwRequest->getParam('supplier_search', '');
if (!empty($supplier)) {
	$where .= " AND ssp_supplier LIKE '%" . $supplier . "%' ";
	$_SESSION['ssp_supplier'] = $supplier;
	$fwViewData['supplier'] = $_SESSION['ssp_supplier'];
} elseif (!empty($_SESSION['ssp_supplier'])) {
	$where .= " AND ssp_supplier LIKE '%" . $_SESSION['ssp_supplier'] . "%' ";
	$fwViewData['supplier'] = $_SESSION['ssp_supplier'];
}

$project = $fwRequest->getParam('project', '');
if (!empty($project)) {
	$_SESSION['ssp_project'] = $project;
	$data = '';
	$data3 = '';
	foreach ($project as $k => $v) {
		$data .= $v;
		$data3 .= $v . ",";
	}
	$fwViewData['data3'] = $data3;
	$where .= " AND (" . $TABLE . ".ssp_project_number LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number2 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number3 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number4 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number5 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number6 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number7 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number8 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number9 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number10 LIKE '%" . $data . "%')";
	$fwViewData['class7'] = 'style="background:#F00!important"';
	$ord = " ORDER BY short_stays_payables_tracker.ssp_urn DESC";
} elseif (!empty($_SESSION['ssp_project'])) {
	$project = $_SESSION['ssp_project'];
	$data = '';
	$data3 = '';
	foreach ($project as $k => $v) {
		$data .= $v;
		$data3 .= $v . ",";
	}
	$fwViewData['data3'] = $data3;
	$where .= " AND (" . $TABLE . ".ssp_project_number LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number2 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number3 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number4 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number5 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number6 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number7 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number8 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number9 LIKE '%" . $data . "%' OR " . $TABLE . ".ssp_project_number10 LIKE '%" . $data . "%')";
	$fwViewData['class7'] = 'style="background:#F00!important"';
	$ord = " ORDER BY short_stays_payables_tracker.ssp_urn DESC";
}

$myboid = $fwRequest->getParam('myboid', '');
if (!empty($myboid)) {
	$data = '';
	$data4 = '';
	foreach ($myboid as $k => $v) {
		$data .= "'" . $v . "',";
		$data4 .= $v . ",";
	}
	$fwViewData['data4'] = $data4;
	$data .= "'X'";
	$where .= " AND " . $TABLE . ".ssp_myobid IN (" . $data . ")";
	$fwViewData['class8'] = 'style="background:#F00!important"';
	$ord = " ORDER BY short_stays_payables_tracker.ssp_urn DESC";
}

$search_by_p_or_np = $fwRequest->getParam('search_by_p_or_np', '');
if (!empty($search_by_p_or_np)) {
	$where .= " AND ssp_pornp = '" . $search_by_p_or_np . "'";
	$_SESSION['ssp_search_by_p_or_np'] = $search_by_p_or_np;
	$fwViewData['search_by_p_or_np'] = $_SESSION['ssp_search_by_p_or_np'];
} else if(empty($search_by_p_or_np)) {
	$fwViewData['search_by_p_or_np'] = "";
	unset($_SESSION['ssp_search_by_p_or_np']);
} elseif (!empty($_SESSION['ssp_search_by_p_or_np'])) {
	$where .= " AND ssp_pornp = '" . $_SESSION['ssp_search_by_p_or_np'] . "'";
	$fwViewData['search_by_p_or_np'] = $_SESSION['ssp_search_by_p_or_np'];
}

$myobid_broad = $fwRequest->getParam('myobid_broad_search', '');
if (!empty($myobid_broad)) {
	$where .= " AND ssp_myobid LIKE '%" . $myobid_broad . "%' ";
	$_SESSION['ssp_myobid_broad'] = $myobid_broad;
	$fwViewData['myobid_broad'] = $_SESSION['ssp_myobid_broad'];
} elseif (!empty($_SESSION['ssp_myobid_broad'])) {
	$where .= " AND ssp_myobid LIKE '%" . $_SESSION['ssp_myobid_broad'] . "%' ";
	$fwViewData['myobid_broad'] = $_SESSION['ssp_myobid_broad'];
}

$type = $fwRequest->getParam('type', '');
if (!empty($type)) {
	$data = '';
	$data5 = '';
	foreach ($type as $k => $v) {
		$data .= "'" . $v . "',";
		$data5 .= $v . ",";
	}
	$fwViewData['data5'] = $data5;
	$data .= "'X'";
	unset($_SESSION['ssp_keyword']);
	$_SESSION['ssp_type'] = $type;
	$where .= " AND " . $TABLE . ".ssp_type IN (" . $data . ")";
	$fwViewData['class10'] = 'style="background:#F00!important"';
	$ord = " ORDER BY short_stays_payables_tracker.ssp_urn DESC";
} elseif (!empty($_SESSION['ssp_type'])) {
	$type = $_SESSION['ssp_type'];
	$data = '';
	$data5 = '';
	foreach ($type as $k => $v) {
		$data .= "'" . $v . "',";
		$data5 .= $v . ",";
	}
	$fwViewData['data5'] = $data5;
	$data .= "'X'";
	$where .= " AND " . $TABLE . ".ssp_type IN (" . $data . ")";
	$fwViewData['class7'] = 'style="background:#F00!important"';
	$ord = " ORDER BY short_stays_payables_tracker.ssp_urn DESC";
}

$invoice_no = $fwRequest->getParam('inv_no', '');
if (!empty($invoice_no)) {
	$where .= " AND ssp_invoice_number = '" . $invoice_no . "' ";
	$_SESSION['ssp_invoice_no'] = $invoice_no;
	$fwViewData['invoice_no'] = $_SESSION['ssp_invoice_no'];
} elseif (!empty($_SESSION['ssp_invoice_no'])) {
	$where .= " AND ssp_invoice_number = '" . $_SESSION['ssp_invoice_no'] . "' ";
	$fwViewData['invoice_no'] = $_SESSION['ssp_invoice_no'];
}

$inv_stg = $fwRequest->getParam('inv_stg', '');
if (!empty($inv_stg)) {
	$where .= " AND ssp_invoice_stage = " . $inv_stg;
	$fwViewData['inv_stg'] = $inv_stg;
	$_SESSION['ssp_inv_stg'] = $inv_stg;
} else if(empty($inv_stg)) {
	$fwViewData['inv_stg'] = "";
	unset($_SESSION['ssp_inv_stg']);
} elseif (!empty($_SESSION['ssp_inv_stg'])) {
	$where .= " AND ssp_invoice_stage = " . $_SESSION['ssp_inv_stg'];
	$fwViewData['inv_stg'] = $_SESSION['ssp_inv_stg'];
}

if ($clearall) {
	$where = " WHERE 1=1 ";
	$fwViewData['class9'] = 'style="background:#F00!important"';
	unset($_SESSION['ssp_supplier']);
	unset($_SESSION['ssp_project']);
	unset($_SESSION['ssp_type']);
	unset($_SESSION['ssp_myobid_broad']);
	unset($_SESSION['ssp_invoice_no']);
	unset($_SESSION['ssp_inv_stg']);
	unset($_SESSION['ssp_search_by_p_or_np']);
	$fwViewData['search_by_p_or_np'] = "";
	$fwViewData['invoice_no'] = "";
	$fwViewData['myobid_broad'] = "";
	$fwViewData['supplier'] = "";
	$fwViewData['inv_stg'] = "";
}

$sql10 = "SELECT sum(CAST(REPLACE(REPLACE(ssp_invoice_value, ',', ''), '$', '') AS decimal(15,2))) as inv_val FROM short_stays_payables_tracker WHERE ssp_invoice_stage = 1";
$datanew = $fwDb->queryOne($sql10);
$fwViewData['totval'] = $datanew['inv_val'];

$sql = "SELECT SQL_CALC_FOUND_ROWS null as row_name, " . $TABLE . ".* FROM " . $TABLE . " " . $where . $ord;
$fwViewData['sql'] = $sql;
$expdata = $fwDb->query($sql);

$setdata = array();
$rows = 0;
$page_rows = 100;

if ($sql) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	} elseif ($pagenum <= 1) {
		$pagenum = 1;
	}
	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;
	$sql2 = $sql . " " . $max;
	if ($sql2) {
		$setdata = $fwDb->query($sql2);
	}
	$total_rows = $fwDb->query('SELECT FOUND_ROWS() as `rows`');
	$rows = $total_rows[0]['rows'];
}

if (!empty($setdata)) {
	$last = ceil($rows / $page_rows);
	if ($pagenum <= 1) {
		$pagenum = 1;
	} elseif ($pagenum > $last) {
		$pagenum = $last;
	}
	$fwViewData['numstartvounter'] = $page_rows * ($pagenum - 1) + 1;
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
	for ($i = 0; $i < 9; $i++) {
		$paginateprev[$pagenatedataprev] = $pagenatedataprev;
		$pagenatedataprev--;
	}
	$fwViewData['paginateprev'] = array_reverse($paginateprev);
}

if (!empty($setdata)) {
	foreach ($setdata as $k2 => $v2) {
		$sql2 = "select is_color from short_stays_payables_tracker_invoice_stage where is_id = " . (int)$v2['ssp_invoice_stage'];
		$coldata = $fwDb->queryOne($sql2);
		$setdata[$k2]['color_code'] = !empty($coldata['is_color']) ? $coldata['is_color'] : '#FFFFFF';
	}
}

$fwViewData['list'] = $setdata;
$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "Short Stays Payables Tracker";

$sql2 = "SELECT distinct ssp_supplier from short_stays_payables_tracker order by ssp_supplier";
$fwViewData['suplist'] = $fwDb->query($sql2);

$sql3 = "SELECT DISTINCT ssp_project_number AS project_number FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number2 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number3 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number4 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number5 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number6 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number7 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number8 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number9 FROM short_stays_payables_tracker
UNION SELECT DISTINCT ssp_project_number10 FROM short_stays_payables_tracker
ORDER BY project_number";
$fwViewData['projlist'] = $fwDb->query($sql3);

$sql4 = "SELECT distinct ssp_myobid from short_stays_payables_tracker order by ssp_myobid";
$fwViewData['myobidlist'] = $fwDb->query($sql4);

$sql5 = "SELECT distinct ssp_type from short_stays_payables_tracker order by ssp_type";
$fwViewData['typelist'] = $fwDb->query($sql5);

$sql4c = "select co_company_name from companies order by co_company_name";
$fwViewData['companydetail'] = $fwDb->query($sql4c);

$sql_stg = "select * from short_stays_payables_tracker_invoice_stage order by is_sequence asc, is_id asc";
$fwViewData['isdetail'] = $fwDb->query($sql_stg);

if (!empty($export)) {
	require BASE_DIR . "PHPExcel/SimpleXLSXGen/SimpleXLSXGen.php";
	$my_excel_data = array();
	$title = array('URN', 'Type', 'P Or NP', 'Project', 'Email Date', 'Invoice No', 'Supplier', 'Invoice Date', 'Invoice Due Date', 'Invoice Value', 'US Invoice Value', 'Invoice Stage', 'MYOBID', 'Chart of Acc');
	$my_excel_data[] = $title;

	foreach ($expdata as $k => $v) {
		$sqlis = "select is_option from short_stays_payables_tracker_invoice_stage where is_id = " . (int)$v['ssp_invoice_stage'];
		$isdata = $fwDb->queryOne($sqlis);
		$is = $isdata['is_option'] . "\n" . $v['ssp_inv_stage_user'] . "-" . $v['ssp_inv_stage_date'];
		$my_excel_data[] = array(
			$v['ssp_urn'],
			$v['ssp_type'],
			$v['ssp_pornp'],
			$v['ssp_project_number'],
			$v['ssp_email_date'],
			$v['ssp_invoice_number'],
			$v['ssp_supplier'],
			$v['ssp_invoice_date'],
			$v['ssp_invoice_due_date'],
			$v['ssp_invoice_value'],
			$v['ssp_us_invoice_value'],
			$is,
			$v['ssp_myobid'],
			$v['ssp_chartof_acc']
		);
	}
	Shuchkin\SimpleXLSXGen::fromArray($my_excel_data)->downloadAs('short_stays_payables_tracker.xlsx');
	exit();
}
