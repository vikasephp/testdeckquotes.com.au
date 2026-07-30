<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);

$table = new Fw_Db_Table('legal_dispute_database');
$defaulWhere = " WHERE FIND_IN_SET($DEFAULT_TYPE_ID, ldd_type_id) AND ldd_hide = 0";

$show_hidden = $fwRequest->getParam('show_hidden', '');
if (!empty($show_hidden) || $_SESSION['show_hidden']) {
	$_SESSION['show_hidden'] =  $show_hidden;
	$where = " WHERE FIND_IN_SET($DEFAULT_TYPE_ID, ldd_type_id) AND ldd_hide = 1";
} else {
	$where = $defaulWhere;
}

//Search by Who Is Managing
$managing = $fwRequest->getParam('search_by_who_is_managing', '');
if ($managing):

	if ($managing == 'NIL') {
		//$where .= " And wa_cgfb_resp = 0";
	} else {
		$where .= " And ldd_manage_id = " . $managing;
	}
	//$where .= " And ldd_manage_id = " . $managing;
	$_SESSION['managing'] = $managing;
	$fwViewData['managing'] = $_SESSION['managing'];

elseif ($_SESSION['managing']):

	$where .= " And ldd_manage_id = " . $_SESSION['managing'];
	$fwViewData['managing'] = $_SESSION['managing'];
	
endif;

$reset = $fwRequest->getParam('reset', '');
if (!empty($reset)) {
	unset($_SESSION['show_hidden']);
	unset($_SESSION['search_type']);

	unset($fwViewData['search_type']);
	unset($fwViewData['managing']);
	unset($_SESSION['managing']);

	$where = $defaulWhere;
}

$set_ldd_dispute_date = $fwRequest->getParam('set_ldd_dispute_date', '');
if (!empty($set_ldd_dispute_date)) {
	$ldd_dispute_date = $fwRequest->getParam('ldd_dispute_date', '');
	$keys = array_keys($ldd_dispute_date);
	$primaryID = $keys[0];
	$data['ldd_dispute_date'] = date('Y-m-d', strtotime($ldd_dispute_date[$primaryID]));
	$data['ldd_dispute_date_updated_by'] = $_SESSION['user']['user_name'];
	$data['ldd_dispute_date_updated_at'] = date('d-m-Y');
	// db($primaryID);
	// db($ldd_dispute_date[$primaryID]);
	// db($data);
	// die();
	$mainTable = new Fw_Db_Table($TABLE);
	$mainTable->setWhere($ID . ' = ' . $primaryID);
	$mainTable->updateRow($data);
}

// Handle Payment Date update
$set_ldd_payment_date = $fwRequest->getParam('set_ldd_payment_date', '');
if (!empty($set_ldd_payment_date)) {
	$ldd_payment_date = $fwRequest->getParam('ldd_payment_date', '');
	$keys = array_keys($ldd_payment_date);
	$primaryID = $keys[0];
	$data['ldd_payment_date'] = !empty($ldd_payment_date[$primaryID]) ? date('Y-m-d', strtotime($ldd_payment_date[$primaryID])) : null;
	$data['ldd_payment_date_updated_by'] = $_SESSION['user']['user_name'];
	$data['ldd_payment_date_updated_at'] = date('d-m-Y');
	$mainTable = new Fw_Db_Table($TABLE);
	$mainTable->setWhere($ID . ' = ' . $primaryID);
	$mainTable->updateRow($data);
}



// Handle Amount Paid update
$set_ldd_amount_paid = $fwRequest->getParam('set_ldd_amount_paid', '');
if (!empty($set_ldd_amount_paid)) {
	$ldd_amount_paid = $fwRequest->getParam('ldd_amount_paid', '');
	$keys = array_keys($ldd_amount_paid);
	$primaryID = $keys[0];
	$data['ldd_amount_paid'] = !empty($ldd_amount_paid[$primaryID]) ? floatval($ldd_amount_paid[$primaryID]) : 0;
	$mainTable = new Fw_Db_Table($TABLE);
	$mainTable->setWhere($ID . ' = ' . $primaryID);
	$mainTable->updateRow($data);
}

// Handle Payment Status update
$set_ldd_payment_status = $fwRequest->getParam('set_ldd_payment_status', '');
if (!empty($set_ldd_payment_status)) {
	$ldd_payment_status = $fwRequest->getParam('ldd_payment_status', '');
	$keys = array_keys($ldd_payment_status);
	$primaryID = $keys[0];
	$data['ldd_payment_status'] = $ldd_payment_status[$primaryID];
	$mainTable = new Fw_Db_Table($TABLE);
	$mainTable->setWhere($ID . ' = ' . $primaryID);
	$mainTable->updateRow($data);
}



$stop = $fwRequest->getParam('stop', '');
if($stop)
{
	 $keys_2 = array_keys($stop);
	 $ky_2 = $keys_2[0];
	 $val_2 = $stop[$ky_2];
	
	
	  $detail['ldd_stop_stm'] = $val_2;
	  $detail['ldd_stop_stm_user'] = $_SESSION['user']['user_name'];
	  $detail['ldd_stop_stm_date'] = date('d-m-Y');
	  
	  $table->setWhere("ldd_id  = ".$ky_2);
	  if($table->rowExists())
	  {
		 $this_id = $table->updateRow($detail);
	  }	  	
}







$ord = ' ORDER BY ldd_created_at DESC';

//$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open' or bsn_sub_status = 'Lost' ";
$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business";
$projdetail  = $fwDb->query($sql);
$projectArr = [];
foreach ($projdetail as $project) {
	$projectArr[$project['bsn_id']] = $project['bsn_name'];
}
$fwViewData['projectArr'] = $projectArr;

$sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id";
$custdetail  = $fwDb->query($sql);
$clientArr = [];
foreach ($custdetail as $cust) {
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
			$list['ldd_type_arr'] = explode(',', $list['ldd_type_id']);
			
			$sql_outdebt = "SELECT SUM( CAST( REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') AS DECIMAL(10,2) ) ) - SUM( CAST( REPLACE(REPLACE(ppd_value, '$', ''), ',', '') AS DECIMAL(10,2) ) ) AS total_amount_owed FROM progress_payment_detail WHERE ppd_bsn_id = ".$list['ldd_bsn_id']." AND ppd_hia_value IS NOT NULL AND ppd_hia_value != '' ";
			$data_outdebt = $fwDb->queryOne($sql_outdebt);
			
			$total_amount_owed = (float)($data_outdebt['total_amount_owed'] ?? 0);
			$list['outdebt'] = '$' . number_format($total_amount_owed, 2);
			
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

//Excel Generation
$export = $fwRequest->getParam('export', 0);
if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Our Claims")
		->setSubject("Our Claims")
		->setDescription("Our Claims exported to Office 2007 XLSX.")
		->setKeywords("our claims openxml php")
		->setCategory("Our Claims file");

	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(false)->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(false)->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(false)->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(false)->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(false)->setWidth(50);
	
	// Wrap text
	$objPHPExcel->getActiveSheet()->getStyle('A')->getAlignment()->setWrapText(true);
	$objPHPExcel->getActiveSheet()->getStyle('B')->getAlignment()->setWrapText(true);
	$objPHPExcel->getActiveSheet()->getStyle('J')->getAlignment()->setWrapText(true);
	$objPHPExcel->getActiveSheet()->getStyle('K')->getAlignment()->setWrapText(true);
	$objPHPExcel->getActiveSheet()->getStyle('L')->getAlignment()->setWrapText(true);

	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Project')
		->setCellValue('B1', 'Client')
		->setCellValue('C1', 'Dispute Date')
		->setCellValue('D1', 'Number of claims')
		->setCellValue('E1', 'Quantum of claim')
		->setCellValue('F1', 'Third Party Costs')
		->setCellValue('G1', 'Who is managing')
		->setCellValue('H1', 'Severity')
		->setCellValue('I1', 'Status')
		->setCellValue('J1', 'Evidence Brief')
		->setCellValue('K1', 'MSTEAM Folder')
		->setCellValue('L1', 'Where are at')
	;

	$from = "A1"; // or any value
	$to = "L1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	
	if ($matsql) {
		$excelData = $fwDb->query($matsql);
	}
	//echo "<pre>"; print_r($excelData); exit("Checking");
	foreach ($resultData as $k => $v) {
		
		$sql_projectName = "SELECT bsn_name FROM business where bsn_id = ".$v['ldd_bsn_id'];
		$res_projectName = $fwDb->queryOne($sql_projectName);
		
		$sql_clientName = "SELECT bus_customers.bcust_fname, bus_customers.bcust_lname FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id where business_sellers.bs_business_id = ".$v['ldd_bsn_id'];
		$res_clientName = $fwDb->queryOne($sql_clientName);
		$fullName = $res_clientName['bcust_fname'].' '.$res_clientName['bcust_lname'];
		
		$sql_NumberOfClaims = "SELECT lddc_option FROM legal_dispute_database_claims where lddc_id = ".$v['ldd_cust_id'];
		$res_NumberOfClaims = $fwDb->queryOne($sql_NumberOfClaims);
		
		$sql_who_managing = "SELECT lddm_option FROM legal_dispute_database_manages where lddm_id = ".$v['ldd_manage_id'];
		$res_who_managing = $fwDb->queryOne($sql_who_managing);
		
		$sql_severity = "SELECT lddse_option FROM `legal_dispute_database_severity` where lddse_id = ".$v['ldd_severity_id'];
		$res_severity = $fwDb->queryOne($sql_severity);
		
		$sql_status = "SELECT ldds_option FROM `legal_dispute_database_status` where ldds_id = ".$v['ldd_status_id'];
		$res_status = $fwDb->queryOne($sql_status);
	
		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $res_projectName['bsn_name'])
			->setCellValue('B' . $row, $fullName)
			->setCellValue('C' . $row, changedate_d_m_y($v['ldd_dispute_date']))
			->setCellValue('D' . $row, $res_NumberOfClaims['lddc_option'])
			->setCellValue('E' . $row, $v['ldd_quantum_of_claim'])
			->setCellValue('F' . $row, $v['ldd_third_party_costs'])
			->setCellValue('G' . $row, $res_who_managing['lddm_option'])
			->setCellValue('H' . $row, $res_severity['lddse_option'])
			->setCellValue('I' . $row, $res_status['ldds_option'])
			->setCellValue('J' . $row, $v['ldd_evidence_brief_link'])
			->setCellValue('K' . $row, $v['ldd_msteam_folder_link'])
			->setCellValue('L' . $row, $v['ldd_where_are_at'])
		;
		
		$row = $row + 1;
		$sr = $sr + 1;
	}

	$objPHPExcel->getActiveSheet()->setTitle('Our Claims');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="our_claims.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	// If you're serving to IE over SSL, then the following may be needed
	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}

$thisTable = new Fw_Db_Table($ATTRIBUTES['type']['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
$fwViewData['statusdata'] = $statusdata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['severity']['table']);
$fwViewData['severitydata'] = $severitydata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['manage']['table']);
$fwViewData['managedata'] = $managedata = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table($ATTRIBUTES['claim']['table']);
$fwViewData['claimdata'] = $claimdata = $thisTable->getAllRows();

$fwViewData['title'] = $MODULE_PLURAL;
