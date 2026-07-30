<?php
$pagenum = $fwRequest->getparam('pagenum', '');
$tablePages = new Fw_Db_Table($TABLE);
$export = $fwRequest->getParam('export', 0);
$short = $fwRequest->getParam('s', '');

$table_toplink = new Fw_Db_Table('top_links');

$update_link = $fwRequest->getParam('update_link', '');
if (!empty($update_link)) {
	$proc = $fwRequest->getParam('proc', '');
	$proc2 = $fwRequest->getParam('proc2', '');
	$tlDetail_1['tl_link'] = $proc;
	$tlDetail_2['tl_link'] = $proc2;
	$table_toplink->setWhere("tl_slug = 'street_sign' AND tl_type = 'Proc'");
	$table_toplink->updateRow($tlDetail_1);
	$table_toplink->setWhere("tl_slug = 'street_sign' AND tl_type = 'Pull'");
	$table_toplink->updateRow($tlDetail_2);
}


// Save date_sign_up
$ccd = $fwRequest->getParam('date_sign_up', '');
if (!empty($ccd)) {
	$cc_date = $fwRequest->getParam('date_sign_up', '');

	foreach ($cc_date as $kc => $vc) {
		$ccdDetail['ss_date_signup'] = $vc;

		$tablePages->setWhere('ss_id = ' . $kc);
		$detail = $tablePages->updateRow($ccdDetail);
	}
}
//End date_sign_up

// Save date_sign_down
$dsu = $fwRequest->getParam('date_sign_down', '');
if (!empty($dsu)) {
	$keys_4 = array_keys($dsu);
	$ky_4 = $keys_4[0];
	$val_4 = $dsu[$ky_4];

	$detail['ss_date_signdown'] = $val_4;
	$tablePages->setWhere("ss_id = " . $ky_4);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}
//End date_sign_down

// Save Date Banner Up
$dbu = $fwRequest->getParam('date_bannerup', '');
if (!empty($dbu)) {
	$keys_5 = array_keys($dbu);
	$ky_5 = $keys_5[0];
	$val_5 = $dbu[$ky_5];

	$detail['ss_date_bannerup'] = $val_5;
	$tablePages->setWhere("ss_id = " . $ky_5);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}
//End Date Banner Up

// Save Date Banner Down
$dbd = $fwRequest->getParam('date_bannerdown', '');
if (!empty($dbd)) {
	$keys_6 = array_keys($dbd);
	$ky_6 = $keys_6[0];
	$val_6 = $dbd[$ky_6];

	$detail['ss_date_bannerdown'] = $val_6;
	$tablePages->setWhere("ss_id = " . $ky_6);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}
//End Date Banner Down



$hide = $fwRequest->getParam('hide', '');
if ($hide) {
	foreach ($hide as $k => $v) {
		$id = $k;
	}

	$detail['ss_hide'] = $v;
	$tablePages->setWhere("ss_id = " . $id);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$havesign = $fwRequest->getParam('havesign', '');

if ($havesign) {

	$keys_2 = array_keys($havesign);
	$ky_2 = $keys_2[0];
	$val_2 = $havesign[$ky_2];

	$detail['ss_have_sign'] = $val_2;
	$detail['ss_have_sign_date'] = date('d-m-Y');
	$detail['ss_have_sign_user'] = $_SESSION['user']['user_name'];

	$tablePages->setWhere("ss_id = " . $ky_2);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$havebanner = $fwRequest->getParam('havebanner', '');

if ($havebanner) {

	$keys_3 = array_keys($havebanner);
	$ky_3 = $keys_3[0];
	$val_3 = $havebanner[$ky_3];

	$detail['ss_have_banner'] = $val_3;
	$detail['ss_have_banner_user'] = date('d-m-Y');
	$detail['ss_have_banner_date'] = $_SESSION['user']['user_name'];

	$tablePages->setWhere("ss_id = " . $ky_3);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detail);
	}
}

$clientagrees = $fwRequest->getParam('clientagrees', '');
if ($clientagrees) {
	$keys_ca = array_keys($clientagrees);
	$ky_ca = $keys_ca[0];
	$val_ca = $clientagrees[$ky_ca];

	$detailca['ss_client_agrees'] = $val_ca;
	$detailca['ss_client_agrees_user'] = $_SESSION['user']['user_name'];
	$detailca['ss_client_agrees_date'] = date('d-m-Y');

	$tablePages->setWhere("ss_id = " . $ky_ca);
	if ($tablePages->rowExists()) {
		$this_id = $tablePages->updateRow($detailca);
	}
}


$listdata = $fwRequest->getParam($TABLE, array());

$keyword = $listdata['keyword'];
$where = "WHERE ss_hide = 0 ";
$showall = $fwRequest->getParam('showall', '');
if (!empty($showall)) {
	$where = "WHERE 1 = 1";
} else {
	$where = "WHERE ss_hide = 0 ";
}

$clear_filter = $fwRequest->getParam('clear_filter', '');
if ($clear_filter) {
	unset($icity_filter);
	//unset($_SESSION['intensity_filter']);
	unset($_SESSION['intensity']);
	unset($_SESSION['status_filter']);
	unset($_SESSION['signaction']);
	unset($_SESSION['banneraction']);
	unset($_SESSION['status']);
	unset($_SESSION['status_filter']);
	unset($status);
}


$icity_filter = $fwRequest->getParam('icity_filter', '');
if (!empty($icity_filter) || isset($_SESSION['intensity'])) {
	$intensity = $fwRequest->getParam('intensity', '');
	if (empty($intensity)) {
		$intensity = $_SESSION['intensity'];
	}

	$data = '';
	foreach ($intensity as $k => $v) {
		$data .= "'" . $v . "'" . ",";
		$data4 .= $v . ",";
	}

	$fwViewData['data4'] = $data4;
	$data .= "'" . 'X' . "'";

	$where .= " AND " . $TABLE . ".ss_intensity IN (" . $data . ")";

	if (!empty($intensity)) {
		$_SESSION['intensity'] = $intensity;
	}
}


$search_signaction = $fwRequest->getParam('search_signaction', '');
if (!empty($search_signaction) || isset($_SESSION['signaction'])) {
	$signaction = $fwRequest->getParam('signaction', '');
	if (empty($signaction)) {
		$signaction = $_SESSION['signaction'];
	}

	$datasa = '';
	foreach ($signaction as $k => $v) {
		$datasa .= "'" . $v . "'" . ",";
		$data5 .= $v . ",";
	}

	$fwViewData['data5'] = $data5;
	$datasa .= "'" . 'X' . "'";

	$where .= " AND " . $TABLE . ".ss_sign_action IN (" . $datasa . ")";

	if (!empty($signaction)) {
		$_SESSION['signaction'] = $signaction;
	}
}

$ba_filter = $fwRequest->getParam('ba_filter', '');
if (!empty($ba_filter) || isset($_SESSION['banneraction'])) {
	$banneraction = $fwRequest->getParam('banneraction', '');
	if (empty($banneraction)) {
		$banneraction = $_SESSION['banneraction'];
	}

	$databa = '';
	foreach ($banneraction as $k => $v) {
		$databa .= "'" . $v . "'" . ",";
		$data6 .= $v . ",";
	}

	$fwViewData['data6'] = $data6;
	$databa .= "'" . 'X' . "'";

	$where .= " AND " . $TABLE . ".ss_banner_action IN (" . $databa . ")";

	if (!empty($banneraction)) {
		$_SESSION['banneraction'] = $banneraction;
	}
}

$search_status = $fwRequest->getParam('search_status', '');
if (!empty($search_status) || isset($_SESSION['status'])) {

	$status = $fwRequest->getParam('status', '');
	if (empty($status)) {
		$status = $_SESSION['status'];
	}


	$datast = '';
	foreach ($status as $k => $v) {
		$datast .= "'" . $v . "'" . ",";
		$data7 .= $v . ",";
	}

	$fwViewData['data7'] = $data7;
	$datast .= "'" . 'X' . "'";


	if (!empty($status)) {
		$_SESSION['status'] = $status;
	}
}


if ($intensity_filter) {
	$_SESSION['intensity_filter'] = $intensity_filter;
	$fwViewData['intensity_filter'] = $_SESSION['intensity_filter'];
}

if ($signaction_filter) {
	$_SESSION['signaction_filter'] = $signaction_filter;
	$fwViewData['signaction_filter'] = $_SESSION['signaction_filter'];
}

if ($banneraction_filter) {
	$_SESSION['banneraction_filter'] = $banneraction_filter;
	$fwViewData['banneraction_filter'] = $_SESSION['banneraction_filter'];
}


$sql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where;


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
		$setdata2 = $setdata;
	}
}

$query = "SELECT bsn_status, bsn_id, bsn_name FROM business ";
//$query = "SELECT bsn_status, bsn_id, bsn_name FROM business WHERE bsn_status LIKE '%|3|%' OR bsn_status LIKE '%|4|%' OR bsn_status LIKE '%|6|%' OR bsn_status LIKE '%|15|%'";
//$query = "SELECT bsn_id, bsn_name, bsn_status FROM business WHERE (bsn_status LIKE '%|3|%' OR bsn_status LIKE '%|4|%' OR bsn_status LIKE '%|6|%') AND bsn_status NOT LIKE '%|1|%' AND bsn_status NOT LIKE '%|12|%' AND bsn_status NOT LIKE '%|2|%' AND bsn_status NOT LIKE '%|5|%' AND bsn_status NOT LIKE '%|18|%' ";
$result = $fwDb->query($query);
$business = [];
foreach ($result as $row) {
	$business[$row['bsn_id']] = $row;
}

if (!empty($setdata2)) {
	foreach ($setdata2 as $k => $v) {
		if (!isset($business[$v['ss_bsn_id']])) {
			unset($setdata2[$k]);
			continue;
		}
		
		//$bsn_name = explode("-",$v['ss_address']);


		//$sqls = 'select bsn_status, bsn_id from business where bsn_name like "%'.stripslashes(trim($bsn_name[1])).'%"';
		//$sqls = "select bsn_status, bsn_id from business where bsn_address = '".stripslashes(trim($bsn_name[1]))."'";
		$sqls = "select bsn_status, bsn_id from business where bsn_name = '" . $v['ss_address'] . "'";

		// $data = $fwDb->queryOne($sqls);
		$data = $business[$v['ss_bsn_id']];

		$da = explode("|", $data['bsn_status']);
		$da = implode(",", $da);
		$da = ltrim($da, ',');
		$da = rtrim($da, ',');

		$st_name = '';
		if (!empty($da)) {
			$sql_st = "select st_name from busness_status where st_id In (" . $da . ")";
			$status_data = $fwDb->query($sql_st);


			foreach ($status_data as $k1 => $v1) {
				$st_name .= $v1['st_name'] . "<br>";
			}
		}
		$setdata2[$k]['status'] = $st_name;
		$setdata2[$k]['bsn_id'] = $data['bsn_id'];
		$setdata2[$k]['ss_address'] = $data['bsn_name'];
		//$link = BASE_URL . "business.detail/bsn_id/".$data['bsn_id'];	

		// if($data['bsn_id']) {
		// 	$tableDocuments = new Fw_Db_Table($TABLE);
		// 	$tableDocuments->setWhere($ID." = ".$v['ss_id']);
		// 	$detail = [
		// 		'ss_bsn_id' => $data['bsn_id'],
		// 	];
		// 	db($detail);
		// 	db($tableDocuments->updateRow($detail));
		// }

		unset($data);
	}
}

if ($status_filter || $_SESSION['status_filter']) {

	if ($_SESSION['status_filter']) {
		$status_filter = $_SESSION['status_filter'];
	}

	foreach ($setdata2 as $ks => $vs) {

		if (strstr($vs['status'], $status_filter) == false) {
			unset($setdata2[$ks]);
		}
	}
}

if (!empty($status)) {

	foreach ($setdata2 as $ks => $vs) {
		$true = 0;
		foreach ($status as $k2 => $v2) {

			if (strstr($vs['status'], $v2) == true) {
				$true = 1;
			}
		}
		if ($true == 0) {
			unset($setdata2[$ks]);
		}
	}
}

//echo "<pre>"; print_r($setdata2); exit('checking');

$fwViewData['list'] =  $setdata2;

$_SESSION['last_sql'] = $sql;
$fwViewData['current_date'] = date('Y-m-d');
$fwViewData['title'] = "CGFB Street Sign Report Construction";

$table_toplink->setWhere("tl_slug = 'street_sign' AND tl_type = 'Proc'");
$fwViewData['proc_detail'] = $table_toplink->getRow();

$table_toplink->setWhere("tl_slug = 'street_sign' AND tl_type = 'Pull'");
$fwViewData['proc2_detail'] = $table_toplink->getRow();

$sql10 = "Select * from street_sign_type_pl";
$fwViewData['typedetail'] = $fwDb->query($sql10);

$sqlact = "Select * from street_sign_action_pl";
$fwViewData['actiondetail'] = $fwDb->query($sqlact);

$sqli = "Select * from street_sign_intensity_pl";
$fwViewData['intensitydetail'] = $fwDb->query($sqli);

$sqlba = "Select * from street_sign_banner_pl";
$fwViewData['badetail'] = $fwDb->query($sqlba);

$sqlstu = "Select * from busness_status";
$fwViewData['statusdetail'] = $fwDb->query($sqlstu);


// Export to Excel

$export = $fwRequest->getParam('export', 0);

if ($export > 0) {
	$sqlexport = "Select street_sign_construction.* from street_sign_construction";

	if ($sqlexport) {
		$exportData = $fwDb->query($sqlexport);
	}

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	//require BASE_DIR . "PHPExcel/Classes/PHPExcel/Writer/Excel2007.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Test Document")
		->setSubject("Office 2007 XLSX Test Document")
		->setDescription("Street Sign exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Street sign file");

	//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'SrNo')
		->setCellValue('B1', 'Property Address')
		->setCellValue('C1', 'Have Sign')
		->setCellValue('D1', 'Have Banner')
		->setCellValue('E1', 'Date Sign Up')
		->setCellValue('F1', 'Date Sign Down')
		->setCellValue('G1', 'Date Banner Up')
		->setCellValue('H1', 'Date Banner Down')
		->setCellValue('I1', 'Sign Number')
	;

	$from = "A1"; // or any value
	$to = "L1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	foreach ($exportData as $k => $v) {

		$objPHPExcel->getActiveSheet()
			->setCellValue('A' . $row, $sr)
			->setCellValue('B' . $row, $v['ss_address'])
			->setCellValue('C' . $row, $v['ss_have_sign'])
			->setCellValue('D' . $row, $v['ss_have_banner'])
			->setCellValue('E' . $row, $v['ss_date_signup'])
			->setCellValue('F' . $row, $v['ss_date_signdown'])
			->setCellValue('G' . $row, $v['ss_date_bannerup'])
			->setCellValue('H' . $row, $v['ss_date_bannerdown'])
			->setCellValue('I' . $row, $v['ss_sign_number'])
		;
		$row = $row + 1;
		$sr = $sr + 1;
	}

	// Rename worksheet
	$objPHPExcel->getActiveSheet()->setTitle('Street Sign Construction');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="street_sign_construction.xls"');
	header('Cache-Control: max-age=0');
	// If you're serving to IE 9, then the following may be needed
	header('Cache-Control: max-age=1');

	header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
	header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
	header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
	header('Pragma: public'); // HTTP/1.0

	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}

$submit = $fwRequest->getParam('print', '');
if (!empty($submit)) {

	$heading = "Street Sign Report";
	$where  = " where ss_hide = 0 ";

	if ($_SESSION['intensity_filter']) {
		$where .= " AND street_sign_construction.ss_intensity IN (" . $_SESSION['intensity_filter'] . ")";
	}

	if ($_SESSION['signaction_filter']) {
		$where .= " AND street_sign_construction.ss_sign_action LIKE '%" . $_SESSION['signaction_filter'] . "%'";
	}

	if ($_SESSION['banneraction_filter']) {
		$where .= " AND street_sign_construction.ss_banner_action LIKE '%" . $_SESSION['banneraction_filter'] . "%'";
	}

	$sssql = "SELECT * from street_sign_construction " . $where;


	$ssData = $fwDb->query($sssql);

	$html = '<table cellpadding="5">';
	$html .= '<tr><th>Property Address</th><th>Status</th><th>Sign Action</th><th>Street Sign Type</th>
	          <th>Have Sign</th><th>Have Banner</th><th>Date Sign Up</th><th>Date Sign Down</th>
		  <th>Date Banner Up</th><th>Date Banner Down</th><th>Sign Number</th>
		  </tr>';
	$fname = "";

	foreach ($ssData as $m) {
		$cls = '';
		if (trim($m['ss_have_banner']) == 'No') {
			$cls = 'style="background:#F00;"';
		}
		$bsn_name = explode("-", $m['ss_address']);

		$sqls = 'select bsn_status from business where bsn_name like "%' . stripslashes(trim($bsn_name[1])) . '%"';

		$data = $fwDb->queryOne($sqls);
		$da = explode("|", $data['bsn_status']);
		$da = implode(",", $da);
		$da = ltrim($da, ',');
		$da = rtrim($da, ',');

		$st_name = '';
		if (!empty($da)) {
			$sql_st = "select st_name from busness_status where st_id In (" . $da . ")";
			$status = $fwDb->query($sql_st);


			foreach ($status as $k1 => $v1) {
				$st_name .= $v1['st_name'] . "<br>";
			}
		}

		if ($_SESSION['status_filter']) {
			if (strstr($st_name, $_SESSION['status_filter']) == false) {
			} else {

				$html .= '<tr nobr="true">';
				$html .= '<td>' . $m['ss_address'] . '</td>';
				$html .= '<td>' . $st_name . '</td>';
				$html .= '<td>' . $m['ss_sign_action'] . '<br>' . $m['ss_sign_action_date'] . '<br>' . $m['ss_sign_action_user'] . '</td>';
				$html .= '<td>' . $m['ss_sign_type'] . '</td>';
				$html .= '<td>' . $m['ss_have_sign'] . '<br>' . $m['ss_have_sign_date'] . '<br>' . $m['ss_have_sign_user'] . '</td>';


				if ($m['ss_have_banner'] == 'No') {
					$html .= '<td style="background-color:#F00;">' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
				} else {
					$html .= '<td>' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
				}

				$html .= '<td>' . $m['ss_date_signup'] . '</td>';
				$html .= '<td>' . $m['ss_date_signdown'] . '</td>';
				$html .= '<td>' . $m['ss_date_bannerup'] . '</td>';
				$html .= '<td>' . $m['ss_date_bannerdown'] . '</td>';
				$html .= '<td>' . $m['ss_sign_number'] . '</td>';
				$html .= '</tr>';
			}
		} else {
			$html .= '<tr nobr="true">';
			$html .= '<td>' . $m['ss_address'] . '</td>';
			$html .= '<td>' . $st_name . '</td>';
			$html .= '<td>' . $m['ss_sign_action'] . '<br>' . $m['ss_sign_action_date'] . '<br>' . $m['ss_sign_action_user'] . '</td>';
			$html .= '<td>' . $m['ss_sign_type'] . '</td>';
			$html .= '<td>' . $m['ss_have_sign'] . '<br>' . $m['ss_have_sign_date'] . '<br>' . $m['ss_have_sign_user'] . '</td>';
			if ($m['ss_have_banner'] == "No") {
				$html .= '<td style="background-color:#F00;">' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
			} else {
				$html .= '<td>' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
			}
			$html .= '<td>' . $m['ss_date_signup'] . '</td>';
			$html .= '<td>' . $m['ss_date_signdown'] . '</td>';
			$html .= '<td>' . $m['ss_date_bannerup'] . '</td>';
			$html .= '<td>' . $m['ss_date_bannerdown'] . '</td>';
			$html .= '<td>' . $m['ss_sign_number'] . '</td>';
			$html .= '</tr>';
		}
	}
	$html .= '</table>';
	create_ss_PDF($heading, $html, $fname);
}

// Print Shown Starts

$submitshown = $fwRequest->getParam('printshown', '');
if (!empty($submitshown)) {
	$heading = "Street Sign Report Construction";
	//$where  = " where ss_hide = 0 ";
	//$sssql = "SELECT * from street_sign_construction ". $where;	
	// $ssData = $fwDb->query($sssql);

	$html = '<table cellpadding="5">';
	$html .= '<tr><th>Property Address</th><th>Status</th><th>Sign Action</th><th>Street Sign Type</th>
	          <th>Have Sign</th><th>Have Banner</th><th>Date Sign Up</th><th>Date Sign Down</th>
		  <th>Date Banner Up</th><th>Date Banner Down</th><th>Sign Number</th>
		  </tr>';
	$fname = "";

	//db($sql);
	//exit;

	foreach ($setdata2 as $m) {


		$cls = '';
		if (trim($m['ss_have_banner']) == 'No') {
			$cls = 'style="background:#F00;"';
		}
		$bsn_name = explode("-", $m['ss_address']);

		$sqls = 'select bsn_status from business where bsn_name like "%' . stripslashes(trim($bsn_name[1])) . '%"';

		$data = $fwDb->queryOne($sqls);
		$da = explode("|", $data['bsn_status']);
		$da = implode(",", $da);
		$da = ltrim($da, ',');
		$da = rtrim($da, ',');

		$st_name = '';
		if (!empty($da)) {
			$sql_st = "select st_name from busness_status where st_id In (" . $da . ")";
			$status = $fwDb->query($sql_st);


			foreach ($status as $k1 => $v1) {
				$st_name .= $v1['st_name'] . "<br>";
			}
		}
		$html .= '<tr nobr="true">';
		$html .= '<td>' . $m['ss_address'] . '</td>';
		$html .= '<td>' . $st_name . '</td>';
		$html .= '<td>' . $m['ss_sign_action'] . '<br>' . $m['ss_sign_action_date'] . '<br>' . $m['ss_sign_action_user'] . '</td>';
		$html .= '<td>' . $m['ss_sign_type'] . '</td>';
		$html .= '<td>' . $m['ss_have_sign'] . '<br>' . $m['ss_have_sign_date'] . '<br>' . $m['ss_have_sign_user'] . '</td>';
		if ($m['ss_have_banner'] == "No") {
			$html .= '<td style="background-color:#F00;">' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
		} else {
			$html .= '<td>' . $m['ss_have_banner'] . '<br>' . $m['ss_have_banner_date'] . '<br>' . $m['ss_have_banner_user'] . '</td>';
		}
		$html .= '<td>' . $m['ss_date_signup'] . '</td>';
		$html .= '<td>' . $m['ss_date_signdown'] . '</td>';
		$html .= '<td>' . $m['ss_date_bannerup'] . '</td>';
		$html .= '<td>' . $m['ss_date_bannerdown'] . '</td>';
		$html .= '<td>' . $m['ss_sign_number'] . '</td>';
		$html .= '</tr>';
	}
	$html .= '</table>';
	create_ss_PDF($heading, $html, $fname);
}
