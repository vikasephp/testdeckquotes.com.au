<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('business_sellers');

$matsql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, business_sellers.bs_paqr_alertoption, business_sellers.bs_paqr_alertoption_at, business_sellers.bs_paqr_alertoption_by, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status, business.bsn_address, business.bsn_type, bus_customers.bcust_id, bus_customers.bcust_user_id, business_sellers.bs_sales_phase_hide, business.bsn_planning_last_login_date, business.bsn_sales_next_meeting_date, business.bsn_sales_next_meeting_time, business.bsn_sales_next_meeting_location, business.bsn_sales_next_meeting_zoom_link, business.bsn_sales_next_meeting_zoom_id, business.bsn_sales_next_meeting_where, business.bsn_splat_id FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id  INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id WHERE business_sellers.bs_sales_phase_hide = 0 AND business.bsn_status LIKE '%|1|%' AND business.bsn_sales_next_meeting_date IS NOT NULL AND business.bsn_sales_next_meeting_date BETWEEN CURDATE() + INTERVAL 1 DAY AND CURDATE() + INTERVAL 10 DAY ORDER BY business.bsn_sales_next_meeting_date ASC, STR_TO_DATE(business.bsn_sales_next_meeting_time, '%h:%i %p') ASC";

if ($matsql) {
	$userData = $fwDb->query($matsql);
}

$fwViewData['total'] = sizeof($userData);

if (!empty($userData)) {
	if (!(isset($pagenum))) {
		$pagenum = 1;
	}
	$rows = count($userData);
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

	$max = 'limit ' . ($pagenum - 1) * $page_rows . ',' . $page_rows;

	$sql2 =  $matsql . " " . $max;
	if ($sql2) {
		$lists = $fwDb->query($sql2);

		foreach ($lists as $list):

			$listsnew[] = $list;
		endforeach;
	}
}

if (!empty($userData)) {
	foreach ($listsnew as $k => $v) {
		
		$sqluser = "select user_id, user_username, user_name from users where user_id = ".$v['bs_paqr_alertoption_by'];
		$datauser = $fwDb->queryOne($sqluser);
		$listsnew[$k]['alert_option_user'] = $datauser['user_name'];
		
		$sqluid302 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 302 and business_tasks.bt_complete = 1";
		$data302 = $fwDb->queryOne($sqluid302);
		$listsnew[$k]['boxsent'] = $data302['bt_completed_date'];

		$sql44 = "Select document_check_list.doc_file_name from document_check_list where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 44 ";
		$data44 = $fwDb->queryOne($sql44);
		$listsnew[$k]['par_report'] = $data44['doc_file_name'];
		
		$sql214 = "Select document_check_list.doc_file_name from document_check_list where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 214 ";
		$data214 = $fwDb->queryOne($sql214);
		$listsnew[$k]['design_agreement'] = $data214['doc_file_name'];
		
		$sql358 = "Select document_check_list.doc_file_name from document_check_list where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 358 ";
		$data358 = $fwDb->queryOne($sql358);
		$listsnew[$k]['par_proposal'] = $data358['doc_file_name'];
		
		$sql290 = "Select document_check_list.doc_file_name from document_check_list where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 290 ";
		$data290 = $fwDb->queryOne($sql290);
		$listsnew[$k]['meeting_agenda'] = $data290['doc_file_name'];
		
		$sql705 = "Select document_check_list.doc_file_name from document_check_list where document_check_list.doc_bsn_id = " . $v['bsn_id'] . " And document_check_list.doc_name_id = 705 ";
		$data705 = $fwDb->queryOne($sql705);
		$listsnew[$k]['utpar_report'] = $data705['doc_file_name'];

	}
}

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sqlAlert = "Select * from paqr_alert_admin";
$fwViewData['alertdata'] = $fwDb->query($sqlAlert);

$sqlAppointmentType = "Select * from sales_phase_logon_appointment_type";
$fwViewData['appointmentType'] = $fwDb->query($sqlAppointmentType);


$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Upcoming 10 Days Appointment")
		->setSubject("Office 2007 XLSX Upcoming 10 Days Appointment")
		->setDescription("Upcoming 10 Days Appointment List exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Upcoming 10 Days Appointment file");

	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Sr No')
		->setCellValue('B1', 'Date and Time')
		->setCellValue('C1', 'Customer Name - Project Address')
		->setCellValue('D1', 'Appointment Type')
		->setCellValue('E1', 'Where')
		->setCellValue('F1', 'PAR Couriered')
		->setCellValue('G1', 'Intro Box Sent')
	;

	$from = "A1"; // or any value
	$to = "G1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	if (!empty($userData)) {
		foreach ($listsnew as $k => $v) {
			
			$sqluserex = "select user_id, user_username, user_name from users where user_id = ".$v['bs_paqr_alertoption_by'];
			$datauserex = $fwDb->queryOne($sqluserex);
			$alert_option_user = $datauserex['user_name'];
			
			$sqlAppTyex = "Select * from sales_phase_logon_appointment_type where splat_id = ".$v['bsn_splat_id'];
			$dataAppTyex = $fwDb->queryOne($sqlAppTyex);
			$appoint_type = $dataAppTyex['splat_option'];
			
			$sqlParCouex = "Select * from paqr_alert_admin where pa_id = ".$v['bs_paqr_alertoption'];
			$dataParCouex = $fwDb->queryOne($sqlParCouex);
			$parCouex = $dataParCouex['pa_alert'];
			
			$sqluid302ex = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks where business_tasks.bt_bsn_id = " . $v['bsn_id'] . " And business_tasks.bt_task_id = 302 and business_tasks.bt_complete = 1";
			$data302ex = $fwDb->queryOne($sqluid302ex);
			$boxsent = $data302ex['bt_completed_date'];
			
			$objPHPExcel->getActiveSheet()
				->setCellValue('A' . $row, $sr)
				->setCellValue('B' . $row, changedate_d_m_y($v['bsn_sales_next_meeting_date']) . " " . $v['bsn_sales_next_meeting_time'])
				->setCellValue('C' . $row, $v['bcust_fname']." ".$v['bcust_lname']." ".$v['bsn_address'])
				->setCellValue('D' . $row, $appoint_type)
				->setCellValue('E' . $row, $v['bsn_sales_next_meeting_where'])
				->setCellValue('F' . $row, $parCouex." ".changedate_d_m_y($v['bs_paqr_alertoption_at'])." ".$alert_option_user)
				->setCellValue('G' . $row, $boxsent)
			;
			$row = $row + 1;
			$sr = $sr + 1;
		}
	}

	$objPHPExcel->getActiveSheet()->setTitle('Upcoming 10 Days Appointment');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="upcoming_10_days_par_appointment.xls"');
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
