<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$where = " WHERE 1 = 1";
$ord = "Order by `cld_date_uploaded` desc";


// $reset = $fwRequest->getParam('reset', '');
// if (!empty($reset)) {
// 	unset($_SESSION['search_project']);
// 	unset($_SESSION['search_type']);
// 	unset($fwViewData['search_project']);
// 	unset($fwViewData['search_type']);
// }

$save_central_letter_database_files = $fwRequest->getParam('save_central_letter_database_files', '');
if ($save_central_letter_database_files && !empty($_FILES['central_letter_database_files']['name'])) {
	$this_id = (int)$fwRequest->getParam($ID, 0);
	$files = $_FILES['central_letter_database_files'];
	// db($_SESSION);
	// db($files);
	// db($this_id);
	// die();
	foreach ($_FILES['central_letter_database_files']['name'] as $index => $name) {
		$record = [];
		$docfile_1 = $name;
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		// db($docfile_1);
		$temp_name_1 = $files['tmp_name'][$index];
		// db($temp_name_1);
		$fileUploaded = upload($docfile_1, $temp_name_1);
		$record['cldf_file'] = $fileUploaded;
		$table = new Fw_Db_Table('central_letter_database_files');
		$record['cldf_cld_id'] = $this_id;
		$record['cldf_file_upload_at'] = date('Y-m-d');
		$record['cldf_file_upload_by'] = $_SESSION['user']['user_id'];
		// db($record);
		$table->insertRow($record);
	}
	// die();
}

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
	$ord = "Order by `cld_id` desc";
}


$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;
$fwViewData['projdetail'] = $projdetail;


//$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
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
// // db($userArr);

// $lmpsql = "SELECT `doc_bsn_id`,`doc_name_id`, `doc_file_name`, `doc_date_uploaded`, `doc_user_name` FROM `document_check_list` where `doc_name_id` = 491";
// $lmpdetail  = $fwDb->query($lmpsql);
// $lmpArr = [];
// foreach ($lmpdetail as $projectlmp ) {
// 	$lmpArr[$projectlmp['doc_bsn_id']] = [
//                                     	    "doc_file_name"=>$projectlmp['doc_file_name'],
//                                     	    "doc_date_uploaded"=>$projectlmp['doc_date_uploaded']
//                                     	    ]; 
// }
// $fwViewData['lmpArr'] = $lmpArr;

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
// db($additionalFilesArr);

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

// db($listsnew);

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

// Export to Excel

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

	$objPHPExcel = new PHPExcel();
	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Design q/a report exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("XRay Report");


	//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);


	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Project Name')
		->setCellValue('B1', 'Customer Name')
		->setCellValue('C1', "Letter Type")
		->setCellValue('D1', "Date Uploaded")
		->setCellValue('E1', "Uploaded By")
		->setCellValue('F1', "Status");

	$from = "A1"; // or any value
	$to = "AZ1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	foreach ($resultData as $k => $v) {
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $projectArr[$v['cld_bsn_id']])
			->setCellValue('B' . $row, $clientArr[$v['cld_bsn_id']])
			->setCellValue('C' . $row, $typeArr[$v['cld_letter_type_id']])
			->setCellValue('D' . $row, strtotime($v['cld_date_uploaded']) > 0 ? date('d-m-Y', strtotime($v['cld_date_uploaded'])) : '')
			->setCellValue('E' . $row, $userArr[$v['cld_file_uploaded_by']])
			->setCellValue('F' . $row, $statusArr[$v['cld_status_id']]);
		$row = $row + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle($MODULE_PLURAL . ' Report');

	$objPHPExcel->setActiveSheetIndex(0);
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="' . $TABLE . '_report.xls"');
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
