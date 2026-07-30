<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('30_days_rec_report');
$tableUp = new Fw_Db_Table('30_days_file');
$tablela = new Fw_Db_Table('30_days_last_audited');


$upload = $fwRequest->getParam('upload', '');
if (!empty($upload)) {
	if ($_FILES['upload_file']['name']) {


		$docfile_1 = $_FILES['upload_file']['name'];
		$file_type = $_FILES['upload_file']['type'];

		$datetime = trim(date('d_m_Y_H_i_'), '0');
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$src = $_FILES['upload_file']['tmp_name'];

		upload_2024($docfile_1, $src);

		$detailup['td_file_name'] = $docfile_1;
		$detailup['td_user'] = $_SESSION['user']['user_name'];
		$detailup['td_date'] = date('d-m-Y');
		chmod($destination, 0664);

		$tableUp->setWhere("td_id = 1");

		$this_id = $tableUp->updateRow($detailup);



		//					$destination = BASE_DIR.'files/uploads_2024/'.$docfile_1;
		//					
		//						if(!move_uploaded_file($src, $destination))
		//								{
		//									//echo "Possible file upload attack";
		//								}
		//						else
		//								{
		//									$detailup['td_file_name'] = $docfile_1;
		//									$detailup['td_user'] = $_SESSION['user']['user_name'];
		//									$detailup['td_date'] = date('d-m-Y');
		//									chmod($destination, 0664);
		//									
		//									$tableUp->setWhere("td_id = 1");
		//	 
		//	  								$this_id = $tableUp->updateRow($detailup);
		//								}						
	}
}
$where = " WHERE td_hide = 0";

$hidden = $fwRequest->getParam('hidden', '');
if (!empty($hidden)) {
	$where = " WHERE 1 = 1";
}

$show_pc_pa = $fwRequest->getParam('show_pc_pa', '');
if (!empty($show_pc_pa)) {
	$where = " WHERE td_hide = 0 Or td_invoice_type = 'Project Commencement' or td_invoice_type = 'Planning Approvals'";
}


$last_audited = $fwRequest->getParam('last_audited', '');
if ($last_audited) {

	$detail['la_date'] = date('d-m-Y');
	$detail['la_who']  = $_SESSION['user']['user_name'];

	$tablela->setWhere("la_id = 1");

	$this_id = $tablela->updateRow($detail);
}


$hide = $fwRequest->getParam('hide', '');
if ($hide) {
	$keys_2 = array_keys($hide);
	$ky_2 = $keys_2[0];
	$val_2 = $hide[$ky_2];

	$detail['td_hide'] = $val_2;
	$table->setWhere("td_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}

/* $fwViewData['record_exist'] = '';

if (isset($_SESSION['record_exist'])) {
	$fwViewData['record_exist'] = $_SESSION['record_exist'];
	unset($_SESSION['record_exist']);
} */

/* $add_to_our_claims = $fwRequest->getParam('add_to_our_claims', '');
if ($add_to_our_claims) {
	$keys_2 = array_keys($add_to_our_claims);
	$ky_2 = $keys_2[0];
	$val_2 = $add_to_our_claims[$ky_2];

	$detail['td_add_to_our_claims'] = $val_2;
	$detail['td_add_to_our_claims_by'] = $_SESSION['user']['user_name'];
	$detail['td_add_to_our_claims_at'] = date('d-m-Y');
	$table->setWhere("td_id = " . $ky_2);
	if ($table->rowExists()) {
		
		$sql_pn = "SELECT td_project_name FROM 30_days_rec_report where td_id = ". $ky_2;
		$data_pn = $fwDb->queryOne($sql_pn);

		$project_name = addslashes($data_pn['td_project_name']);
		$sql_bsn_id = "SELECT bsn_id FROM business WHERE business.bsn_name = '" . $project_name . "'";
		$data_bsn_id = $fwDb->queryOne($sql_bsn_id);
		
		$sql_30day = "SELECT COUNT(*) AS total_add_to_our_claims FROM 30_days_rec_report WHERE td_add_to_our_claims = 1 and td_project_name = '" . $project_name . "'";
		$data_30day = $fwDb->queryOne($sql_30day);
		
		if($data_30day['total_add_to_our_claims'] == 0){
			$this_id = $table->updateRow($detail);
		}
		
		if($data_30day['total_add_to_our_claims'] == 1 && $val_2 == 0 ){
			$this_id = $table->updateRow($detail);
		}

		$legal_table = new Fw_Db_Table('legal_dispute_database');
		
		if ($val_2 == 1) {
			$legal_detail = array();
			$legal_detail['ldd_bsn_id'] = $data_bsn_id['bsn_id'];
			$legal_detail['ldd_type_id'] = 6;
			$legal_detail['ldd_came_from_30_days_rec_report'] = 1;
			
			$check_sql = "SELECT count(*) as total_record_exist FROM legal_dispute_database WHERE ldd_bsn_id = ".$data_bsn_id['bsn_id']." and ldd_type_id = 6 and ldd_came_from_30_days_rec_report = 1";
			$check_data = $fwDb->queryOne($check_sql);
			$fwViewData['record_exist'] = '';
			
			if ($check_data['total_record_exist'] == 0) {
				$legal_table->insertRow($legal_detail);
			} else {
				$_SESSION['record_exist'] = 'Same record already exists.';
			}
		} else {
			$legal_table->setWhere("ldd_bsn_id = " . (int)$data_bsn_id['bsn_id'] . " AND ldd_type_id = 6 AND ldd_came_from_30_days_rec_report = 1");
			$legal_table->deleteRow();
		}		
	}
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
} */

$add_to_our_claims = $fwRequest->getParam('add_to_our_claims', '');
if ($add_to_our_claims) {
	$keys_2 = array_keys($add_to_our_claims);
	$ky_2 = $keys_2[0];
	$val_2 = $add_to_our_claims[$ky_2];

	$detail['td_add_to_our_claims'] = $val_2;
	$detail['td_add_to_our_claims_by'] = $_SESSION['user']['user_name'];
	$detail['td_add_to_our_claims_at'] = date('d-m-Y');
	$table->setWhere("td_id = " . $ky_2);
	if ($table->rowExists()) {
		
		$this_id = $table->updateRow($detail);
		
		$sql_pn = "SELECT td_project_name FROM 30_days_rec_report where td_id = ". $ky_2;
		$data_pn = $fwDb->queryOne($sql_pn);

		$project_name = addslashes($data_pn['td_project_name']);
		$sql_bsn_id = "SELECT bsn_id FROM business WHERE business.bsn_name = '" . $project_name . "'";
		$data_bsn_id = $fwDb->queryOne($sql_bsn_id);

		$legal_table = new Fw_Db_Table('legal_dispute_database');
		
		if ($val_2 == 1) {
			$legal_detail = array();
			$legal_detail['ldd_bsn_id'] = $data_bsn_id['bsn_id'];
			$legal_detail['ldd_type_id'] = 6;
			$legal_detail['ldd_came_from_30_days_rec_report'] = 1;
			
			$legal_table->insertRow($legal_detail);
			
		}		
	}
	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$dmp = $fwRequest->getParam('dmp', '');
if ($dmp) {
	$keys_3 = array_keys($dmp);
	$ky_3 = $keys_3[0];
	$val_3 = $dmp[$ky_3];

	$detailDmp['td_dmp'] = $val_3;
	$detailDmp['td_dmp_date'] = date('d-m-Y');
	$detailDmp['td_dmp_user'] = $_SESSION['user']['user_name'];
	$table->setWhere("td_id = " . $ky_3);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detailDmp);
		$debtTable = new Fw_Db_Table('debt_management');
		if($detailDmp['td_dmp'] == 1){
			// insert
			$debtTable->insertRow([
				'dm_td_id' => $ky_3,
				'dm_bsn_name' => $dmp['bsn_name'],
			]);
			// $dept_sql = "INSERT INTO debt_management(dm_td_id, dm_bsn_name) VALUES($ky_3, '" . $dmp['bsn_name'] . "')";
		}
		else{
			// delete
			$debtTable->setWhere("dm_td_id = $ky_3");
			$debtTable->deleteRow();
			// $dept_sql = "DELETE FROM debt_management WHERE dm_td_id = $ky_3";
		}
		$fwDb->query($dept_sql);
		// echo $dept_sql;
	}
}

$ws = $fwRequest->getParam('ws', '');
if ($ws) {
	$keys_4 = array_keys($ws);
	$ky_4 = $keys_4[0];
	$val_4 = $ws[$ky_4];

	$detailWs['td_weekly_statement'] = $val_4;
	$detailWs['td_ws_date'] = date('d-m-Y');
	$detailWs['td_ws_user'] = $_SESSION['user']['user_name'];
	$table->setWhere("td_id = " . $ky_4);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detailWs);
	}
}


$red = $fwRequest->getParam('red', '');
if (!empty($red)) {
	$where .= " And td_traffic_light = 3";
}

$green = $fwRequest->getParam('green', '');
if (!empty($green)) {
	$where .= " And td_traffic_light = 1";
}

$amber = $fwRequest->getParam('amber', '');
if (!empty($amber)) {
	$where .= " And td_traffic_light = 2";
}

$clear_search = $fwRequest->getParam('clear_search', '');
if (!empty($clear_search)) {
	unset($_SESSION['keyword']);
	unset($keyword);
	$fwViewData['keyword'] = '';
}

$keyword = $fwRequest->getParam('keyword', '');
if ($keyword):
	$where .= " AND  30_days_rec_report.td_project_name LIKE '%" . $keyword . "%'";

	$_SESSION['keyword'] = $keyword;
//$fwViewData['keyword']=$_SESSION['keyword'];

elseif ($_SESSION['keyword']):

	$where .= " AND 30_days_rec_report.td_project_name LIKE '%" . $_SESSION['keyword'] . "%' ";
// $fwViewData['keyword']=$_SESSION['keyword'];
endif;


$ord =  " ORDER BY if(  30_days_rec_report.td_due_date = ' '
         OR 30_days_rec_report.td_due_date IS NULL , 1, 0 ) , STR_TO_DATE( 30_days_rec_report.td_due_date, '%d-%m-%Y' ) ASC";


$sort_date = $fwRequest->getParam('sort_date', '');
if (!empty($sort_date)) {
	$ord =  " ORDER BY if(  30_days_rec_report.td_due_date = ' '
         OR 30_days_rec_report.td_due_date IS NULL , 1, 0 ) , STR_TO_DATE( 30_days_rec_report.td_due_date, '%d-%m-%Y' ) ASC";
}


$sort_value = $fwRequest->getParam('sort_value', '');
if (!empty($sort_value)) {
	$ord =  " ORDER BY CAST(REPLACE(REPLACE(td_value,'$',''),',','') AS DECIMAL(10,2)) DESC";
}

$matsql = "SELECT * from 30_days_rec_report " . $where . ' ' . $ord;

if ($matsql) {
	$userData = $fwDb->query($matsql);
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

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):

			$listsnew[] = $list;
		endforeach;

		//$fwViewData['list'] = $listsnew;

		$setdata2 = $listsnew;
	}
}

if (!empty($setdata2)) {
	foreach ($setdata2 as $k => $v2) {


		$sq12 = "SELECT  business_sellers.bs_business_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble
	 from business_sellers 		
	 Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	 Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name = '" . $v2['td_project_name'] . "'";

		$data = $fwDb->queryOne($sq12);

		$Statusdate = changedate_y_m_d($v2['td_due_date']);

		if (!empty($Statusdate)) {
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}

		$link = BASE_URL . "business.detail/bsn_id/" . $data['bs_business_id'];


		$sql173 = "Select document_check_list.doc_file_name from document_check_list
			          where document_check_list.doc_bsn_id = " . $data['bs_business_id'] . " And document_check_list.doc_name_id = 173";

		$data173 = $fwDb->queryOne($sql173);



		$sqlwa = "select count(*) as tot_log from warranty_log where wa_project like '%" . $v2['td_project_name'] . "%' and wa_status = 'Open'";

		$wadata = $fwDb->queryOne($sqlwa);



		$setdata2[$k]['customer'] = $data['bcust_fname'] . " " . $data['bcust_lname'];
		$setdata2[$k]['link'] = $link;
		$setdata2[$k]['dayscount'] = $dayscount;
		$setdata2[$k]['td_reason_date'] = changedate_d_m_y($v2['td_reason_date']);
		$setdata2[$k]['checklist173'] = $data173['doc_file_name'];
		$setdata2[$k]['total_log'] = $wadata['tot_log'];
	}
}
$fwViewData['list'] = $setdata2;
$fwViewData['title'] = $MODULE_PLURAL;


$sqltot = "select td_value from 30_days_rec_report " . $where;
$totdata = $fwDb->query($sqltot);


$total = 0;
foreach ($totdata as $kt => $vt) {
	$value = 0;

	$value = $vt['td_value'];
	$value = str_replace('$', '', $value);
	$value = str_replace(',', '', $value);

	$total = $total + $value;
}


$fwViewData['total'] = number_format($total, 2, '.', ',');


$printreport = $fwRequest->getParam('print', '');
if (!empty($printreport)) {
	$heading = "30 Days Plus Accounts Receivable Report";
	$fname = 'hello';

	$sqlp = "select * from 30_days_rec_report where td_hide = 0 ";
	$data = $fwDb->query($sqlp);

	$html = '<html><body>';

	$html .= '<table border="1"  cellpadding="5" width="100%">';
	$html .= '<tr><th style="width:5%;">Rec No</th><th style="width:20%;">Project</th><th style="width:11%;">Contact Info</th>
	<th>Value $</th><th>Due Date</th><th style="width:5%;">Days</th>
	<th>Invoice Type</th><th style="width:8%;">Invoice Number</th><th>Last Emailed Date</th><th>Last Spoken Date</th>
	</tr>';
	foreach ($setdata2 as $k => $v) {

		$html .= '<tr nobr="true">';
		$html .= '<td>' . $v['td_id'] . '</td>';
		$html .= '<td>' . $v['td_project_name'] . '</td>';
		$html .= '<td>' . $v['customer'] . '</td>';
		$html .= '<td>' . $v['td_value'] . '</td>';
		$html .= '<td>' . $v['td_due_date'] . '</td>';
		$html .= '<td>' . $v['dayscount'] . '</td>';
		$html .= '<td>' . $v['td_invoice_type'] . '</td>';
		$html .= '<td>' . $v['td_invoice_number'] . '</td>';

		$html .= '<td>' . $v['td_last_email_date'] . '</td>';
		$html .= '<td>' . $v['td_last_spoken_date'] . '</td>';

		$html .= '</tr>';
	}

	$html .= '</table>';
	$html .= '</body><html>';



	create_30_days_pdf($heading, $html, $fname);
}




// Export to Excel

$export = $fwRequest->getParam('export', 0);

if($export > 0)
{
	
require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";

$objPHPExcel = new PHPExcel();
$objPHPExcel->getProperties()->setCreator("Deckquotes")
							 ->setLastModifiedBy("Nick C")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Design q/a report exported to Office 2007 XLSX.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("All Accounts Report");


//$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(50);
$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
//$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);

$objPHPExcel->getActiveSheet()->getStyle('G')->getAlignment()->setWrapText(true);
$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(100);


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
       		->setCellValue('A1', 'Project Address')
           	->setCellValue('B1', "Contact Info")
			->setCellValue('C1', "Value $")
			->setCellValue('D1', "Due Date")
			->setCellValue('E1', "Last Spoken")
			->setCellValue('F1', "Days")
			->setCellValue('G1', "Reason")
			->setCellValue('H1', "Warranty")
			->setCellValue('I1', "DMP")
			->setCellValue('J1', "Weekly Statement")
			->setCellValue('K1', "Invoice Type")
			
			->setCellValue('L1', "Inovice Number")
			->setCellValue('M1', "Last Emailed Date")
			->setCellValue('N1', "Last Spoken Date")
	
;

$from = "A1"; // or any value
$to = "AZ1"; // or any value
$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold( true );


$row=2;
$sr=1;
foreach($setdata2 as $k=>$v)
{
	
	if($v['td_dmp'] == 1 ) { $dmp = 'Yes' ; }else {$dmp = 'No' ; }
	if($v['td_weekly_statement'] == 1 ) { $ws = 'Yes' ; }else {$ws = 'No' ; }

	$objPHPExcel->getActiveSheet()
				->setCellValue('A'.$row, $v['td_project_name'])
				->setCellValue('B'.$row, $v['customer'])
				->setCellValue('C'.$row, $v['td_value'])
				->setCellValue('D'.$row, $v['td_due_date'])
				->setCellValue('E'.$row, $v['td_last_spoken'])
				->setCellValue('F'.$row, $v['dayscount'])
				->setCellValue('G'.$row, $v['td_reason'])
				->setCellValue('H'.$row, $v['total_log'])
				->setCellValue('I'.$row, $dmp)
				
				->setCellValue('J'.$row, $ws)
				->setCellValue('K'.$row, $v['td_invoice_type'])
				
				->setCellValue('L'.$row, $v['td_invoice_number'])
				->setCellValue('M'.$row, $v['td_last_email_date'])
				->setCellValue('N'.$row, $v['td_last_spoken_date'])
						;
					
	$row= $row+1;			
	
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('All Accounts Report');

$objPHPExcel->setActiveSheetIndex(0);
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="all_accounts_report.xls"');
header('Cache-Control: max-age=0');
header('Cache-Control: max-age=1');
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;

}



$sql_1 = "select * from 30_days_last_audited where la_id = 1";
$fwViewData['ladata'] = $fwDb->queryOne($sql_1);

$sql_2 = "select * from 30_days_file where td_id = 1";
$fwViewData['updata'] = $fwDb->queryOne($sql_2);
