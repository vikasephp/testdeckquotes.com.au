<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tableusers = new Fw_Db_Table('users');
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');
$fwViewData['cur_user'] = $_SESSION['user']['user_id'];


$searchkey = $fwRequest->getParam('searchkey', '');

unset($_SESSION['searchkey']);

if ($searchkey):

	$where .= " AND users.user_name  LIKE '%" . $searchkey . "%' ";
	$_SESSION['searchkey'] = $searchkey;
//$fwViewData['searchkey']=$_SESSION['searchkey'];

elseif ($_SESSION['searchkey'] && $pagenum > 0):

	$where .= " AND users.user_name LIKE  '%" . $_SESSION['searchkey'] . "%' ";
// $fwViewData['searchkey']=$_SESSION['searchkey'];

elseif (isset($_SESSION['searchkey'])) :

	$where .= " AND users.user_name LIKE  '%" . $_SESSION['searchkey'] . "%' ";

endif;



$type = $fwRequest->getParam('type', '');
if ($type):

	$where .= " AND users.user_pm_type = " . $type;
	$_SESSION['type'] = $type;
	$fwViewData['type'] = $_SESSION['type'];

elseif ($_SESSION['type'] && $pagenum > 0):

	$where .= " AND users.user_pm_type = " . $_SESSION['type'];
	$fwViewData['type'] = $_SESSION['type'];

elseif (isset($_SESSION['type'])) :

	$where .= " AND users.user_pm_type = " . $_SESSION['type'];

endif;


$active_filter = $fwRequest->getParam('active_filter', '');

if ($active_filter):

	if ($active_filter == 2) {
		$active_filter = 0;
	}
	$where .= " AND users.user_pm_active = " . $active_filter;
	$_SESSION['active_filter'] = $active_filter;
	$fwViewData['active_filter'] = $_SESSION['active_filter'];

elseif ($_SESSION['active_filter'] && $pagenum > 0):

	$where .= " AND users.user_pm_active = " . $_SESSION['active_filter'];
	$fwViewData['active_filter'] = $_SESSION['active_filter'];

elseif (isset($_SESSION['active_filter'])) :

	$where .= " AND users.user_pm_active = " . $_SESSION['active_filter'];

endif;

$clearall = $fwRequest->getParam('clearall', '');

if ($clearall) {
	$where = '';
	unset($_SESSION['searchkey']);
	unset($_SESSION['type']);
	unset($_SESSION['active_filter']);
}


if ($short) {
	switch ($short) {
		case 'lc':
			$_SESSION['sort_order'] = $TABLE . ".mlbs_update_date DESC";
			break;

		case 'bl':
			$_SESSION['sort_order'] = $TABLE . ".mlbs_last_buyer_feedback ASC";
			break;
	}
}
if ($_SESSION['sort_order']) {
	$order = "ORDER BY " . $_SESSION['sort_order'];
} else {
	$order = "ORDER BY " . $TABLE . ".mlbs_update_date DESC";
}
$logged_username = $_SESSION['user']['user_username'];

if (empty($pagenum)) {
	unset($_SESSION['last_sql']);
}
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$fwViewData['detail'] = $detail;
	$fwViewData['ord_id'] = $detail['orderBy'];
}

//if($_SESSION['last_sql']){$sql = $_SESSION['last_sql'];}
//else{
$sql = "SELECT customers.*, users.*, users_groups.group_id, groups.group_name, positions.p_name  FROM users 
			LEFT JOIN users_groups ON users.user_id = users_groups.user_id
			LEFT JOIN customers ON users.user_id = customers.user_id 
			LEFT JOIN groups ON users_groups.group_id = groups.group_id
			RIGHT JOIN positions ON positions.p_id IN (customers.customer_positions)
		
			WHERE users_groups.group_id IN (1,3,4, 5) " . $where . " ORDER BY  users.user_pm_active DESC";
//}


if ($sql) {
	$userData = $fwDb->query($sql);
}
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

	$sql2 =  $sql . " " . $max;

	if ($sql2) {
		$list = $fwDb->query($sql2);
		if ($list) {
			foreach ($list as $val) {
				if ($val['customer_positions']) {
					$psql = "SELECT p_name FROM positions WHERE p_id IN (" . str_replace("|", ",", $val['customer_positions']) . ") ";
					$positions = $fwDb->query($psql);
				}
				$val['p_name'] = $positions;
				$newlist[] = $val;
			}
			$list = $newlist;
		}
		$fwViewData['list'] = $list;
	}
}

$count = sizeof($list);
if ($count <= 0) {
	$fwViewData['notfound'] = 'No Record Found';
}

$fwViewData['title'] = "People Management";

$sqltype = "SELECT  * from people_man_type_admin";
$fwViewData['typedetail'] = $fwDb->query($sqltype);




// Export to Excel

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

	$objPHPExcel = new PHPExcel();
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("People management exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("People Management Report");

	//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(20);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(20);

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Employee Name')
		->setCellValue('B1', "Type")
		->setCellValue('C1', "Status");

	$from = "A1"; // or any value
	$to = "AZ1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	foreach ($list as $k => $v) {
		$sqltype = "SELECT  et_option from people_man_type_admin where et_id = " . $v['user_pm_type'];
		$type = $fwDb->queryOne($sqltype);

		if ($v['user_pm_active'] == 1) {
			$active = "Yes";
		} else {
			$active = "No";
		}

		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $v['user_name'])
			->setCellValue('B' . $row, $type['et_option'])
			->setCellValue('C' . $row, $active);

		$row = $row + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('People Management Report');

	$objPHPExcel->setActiveSheetIndex(0);
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="pm_report.xls"');
	header('Cache-Control: max-age=0');
	header('Cache-Control: max-age=1');
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}
