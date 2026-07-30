<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table($TABLE);

$where = " WHERE 1 = 1  ";

$ord = 'order by 2025_165_report.os2_project';

$filter_plan_breach = $fwRequest->getParam('filter_plan_breach', '');
$os2_doc_plan = $fwRequest->getParam('os2_doc_plan', '');
if ($os2_doc_plan != ''):
	$where .= 'AND 2025_165_report.os2_doc_plan = ' . $os2_doc_plan;
	$_SESSION['os2_doc_plan'] = $os2_doc_plan;
	$fwViewData['os2_doc_plan'] = $_SESSION['os2_doc_plan'];
elseif (isset($_SESSION['os2_doc_plan'])):
	$where .= 'AND 2025_165_report.os2_doc_plan = ' . $_SESSION['os2_doc_plan'];
	$fwViewData['os2_doc_plan'] = $_SESSION['os2_doc_plan'];
endif;

$clear_filter_stage = $fwRequest->getParam('clear_filter_stage', '');
if ($clear_filter_stage) {
	unset($_SESSION['os2_stage']);
	$fwViewData['os2_stage'] = 0;
} else {
	$filter_stage = $fwRequest->getParam('filter_stage', '');
	$os2_stage = $fwRequest->getParam('os2_stage', 0);
	if ($os2_stage != 0):
		$where .= 'AND 2025_165_report.os2_stage = ' . $os2_stage;
		$_SESSION['os2_stage'] = $os2_stage;
		$fwViewData['os2_stage'] = $_SESSION['os2_stage'];
	elseif (isset($_SESSION['os2_stage']) && $_SESSION['os2_stage'] != 0):
		$where .= 'AND 2025_165_report.os2_stage = ' . $_SESSION['os2_stage'];
		$fwViewData['os2_stage'] = $_SESSION['os2_stage'];
	endif;
}

$implemented = $fwRequest->getParam('implemented', '');
if ($implemented) {
	$keys_2 = array_keys($implemented);
	$ky_2 = $keys_2[0];
	$val_2 = $implemented[$ky_2];

	$detail['os2_solution_imple'] = $val_2;
	$table->setWhere("os2_id = " . $ky_2);
	if ($table->rowExists()) {
		$this_id = $table->updateRow($detail);
	}
}
$clear = $fwRequest->getParam('clear_search', '');
if (!empty($clear)) {
	unset($fwViewData['address']);
	unset($_SESSION['address']);

	$where = " where 1 = 1";
}

$address = $fwRequest->getParam('address', '');
if ($address):
	$where .= " AND  2025_165_report.os2_project LIKE '%" . $address . "%'";

	$_SESSION['address'] = $address;
	$fwViewData['address'] = $_SESSION['address'];

elseif ($_SESSION['address']):

	$where .= " AND 2025_165_report.os2_project  LIKE '%" . $_SESSION['address'] . "%' ";

	$fwViewData['address'] = $_SESSION['address'];
endif;

$clear_database_for_print_all_files = $fwRequest->getParam('clear_database_for_print_all_files', '');
$download_all_files_report = $fwRequest->getParam('download_all_files_report', '');
if (!empty($clear_database_for_print_all_files)) {

	$thisTable = new Fw_Db_Table("2025_165_report_manage_reports");
	$thisTable->setWhere("`id` != ''");
	$thisTable->deleteRows();
	// loop through the files one by one
	$files_list = glob($_SERVER['DOCUMENT_ROOT'] . "/files/2025_165_report/*");
	foreach ($files_list as $file) {
		// check if is a file and not sub-directory
		if (is_file($file)) {
			// delete file
			unlink($file);
		}
	}

	$files_list = glob($_SERVER['DOCUMENT_ROOT'] . "/files/2025_165_report/full_report/*");
	foreach ($files_list as $file) {
		// check if is a file and not sub-directory
		if (is_file($file)) {
			// delete file
			unlink($file);
		}
	}
}

if (!empty($download_all_files_report)) {
	require_once($_SERVER['DOCUMENT_ROOT'] . '/PDFMerger-master/PDFMerger.php');
	$pdf = new PDFMerger;

	// $fn = "printed_reports" . "_" . time() . ".pdf";
	$fn = "165_reports" . ".pdf";
	//  $po_pdf_newfile = $_SERVER['DOCUMENT_ROOT'].'/files/2025_165_report/'.$v['file_name']; 

	foreach (glob($_SERVER['DOCUMENT_ROOT'] . '/files/2025_165_report/*.*') as $filename) {
		$pdf->addPDF($_SERVER['DOCUMENT_ROOT'] . '/files/2025_165_report/' . basename($filename));
	}
	$pdf->merge('file', $_SERVER['DOCUMENT_ROOT'] . '/files/2025_165_report/full_report/' . $fn);
	$file_absolute_path = $_SERVER['DOCUMENT_ROOT'] . '/files/2025_165_report/full_report/' . $fn;

	header('Content-Description: File Transfer');
	header('Content-Disposition: attachment; filename=' . basename($file_absolute_path));
	header('Expires: 0');
	header('Cache-Control: must-revalidate');
	header('Pragma: public');
	header('Content-Length: ' . filesize($file_absolute_path));

	header("Content-type:application/pdf");
	readfile($file_absolute_path);

	exit();
}

//$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where . ' ' . $ord;

$matsql = "SELECT 2025_165_report.*, planning_project_checklist_admin.ppc_document, 165_2025_stage.st_option FROM 2025_165_report left JOIN planning_project_checklist_admin ON 2025_165_report.os2_doc_plan = planning_project_checklist_admin.ppc_id LEFT JOIN 165_2025_stage ON 165_2025_stage.st_id = 2025_165_report.os2_stage" . $where . ' ' . $ord;

if ($matsql) {
	//$printData variable is used for Printing the Records
	$printData = $userData = $fwDb->query($matsql);
}


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
	$fwViewData['page_rows'] = $page_rows;
	$fwViewData['start_sn'] = $page_rows * ($pagenum - 1);
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

		$fwViewData['list'] = $listsnew;
	}
}

/* foreach ($listsnew as $k => $v) {

	$sqlb = "select bsn_id,bsn_status_sys_date  from business where bsn_name = '" . $v['os_project'] . "'";
	$busdata = $fwDb->queryOne($sqlb);

	$sqluid369 = "Select business_tasks.bt_complete, business_tasks.bt_completed_date from business_tasks
				  where business_tasks.bt_bsn_id = " . $busdata['bsn_id'] . " And business_tasks.bt_task_id = 369";
	$data369 = $fwDb->queryOne($sqluid369);

	$sql_nt = "Select max(STR_TO_DATE(on_date, '%d-%m-%Y' )) as notes_date from 165_report_notes where on_os_id = " . $v['os_id'];
	$ntdata = $fwDb->queryOne($sql_nt);


	$sql_228 = "Select doc_file_name, doc_date_uploaded from document_check_list where  doc_bsn_id  = " . $busdata['bsn_id']
		. " And doc_name_id = 228 ";
	$data228 = $fwDb->queryOne($sql_228);


	$listsnew[$k]['bsn_id'] = $busdata['bsn_id'];
	$listsnew[$k]['bsn_status_sys_date'] = $busdata['bsn_status_sys_date'];

	$listsnew[$k]['bt_completed_date'] = changedate_d_m_y($data369['bt_completed_date']);
	$listsnew[$k]['notes_date']  = changedate_d_m_y($ntdata['notes_date']);

	$listsnew[$k]['doc_file_name_228'] = $data228['doc_file_name'];
	$listsnew[$k]['doc_date_uploaded_228']  = changedate_d_m_y($data228['doc_date_uploaded']);
}


//$fwViewData['list'] = $listsnew;

foreach ($listsnew as $key => $row) {
	$desig[$key] = strtotime($row['bt_completed_date']);
	//$desig[$key]  = $row['bt_completed_date'];
}

array_multisort($desig, SORT_DESC, $listsnew); */

$fwViewData['list'] = $listsnew;

$fwViewData['title'] = $MODULE_PLURAL;

$sql_6 = "Select * from 165_report_change_needed";
$fwViewData['cndata'] = $fwDb->query($sql_6);

$sql = "select * from 165_2025_stage";
$fwViewData['stage'] = $fwDb->query($sql);

$sql = "select ppc_id , ppc_document from planning_project_checklist_admin";
$fwViewData['docplan'] = $fwDb->query($sql);

$sql = "SELECT PPCA.ppc_document, REP.os2_doc_plan, COUNT(*) AS total FROM `2025_165_report` AS REP INNER JOIN planning_project_checklist_admin AS PPCA ON PPCA.ppc_id = REP.os2_doc_plan GROUP BY PPCA.ppc_document, REP.os2_doc_plan;";
$fwViewData['plan_breach'] = $fwDb->query($sql);

$sql = "SELECT COUNT(*) AS total from `2025_165_report` WHERE os2_doc_plan = 0";
$fwViewData['no_plan_total'] = $fwDb->query($sql)[0]['total'];

$sql = "SELECT COUNT(*) AS total from `2025_165_report`";
$fwViewData['total_records'] = $fwDb->query($sql)[0]['total'];

//echo "<pre>"; print_r($listsnew); echo "<pre> Total records are ".count($listsnew)."&nbsp;"; exit("checking the array");

if ($printData) {
	$fwViewData['total_records_of_print_reports'] = $total_records = count($printData);
}
$submit = $fwRequest->getParam('printall', '');

if (!empty($submit)) {

	$total_counted = 0;
	$is_record_exist = 0;
	$printed_r_sql = "SELECT record_id FROM `2025_165_report_manage_reports` WHERE is_printed = 1";
	$total_printed_ids = [];
	if ($printed_r_sql) {
		$total_printed_records = $fwDb->query($printed_r_sql);
	}

	if (!empty($total_printed_records)) {
		foreach ($total_printed_records as $bk => $bv) {
			$total_printed_ids[] = $bv['record_id'];
		}
	}

	$heading = '<span >165 Breach Summary Report</span>';

	$html = '';
	$html .= '<table border="1" width="98%" cellpadding="7">';
	$last_key = end(array_keys($printData));

	set_time_limit(0);
	ini_set('memory_limit', '2048M');
	$construction_alert_merge_files = new Fw_Db_Table('2025_165_report_manage_reports');

	//echo count($listsnew); echo "<pre>"; print_r($listsnew); exit('checking');
	foreach ($printData as $lk => $lv) {
		$newDate = date("d-m-Y", strtotime($lv["os2_breach_date"]));

		if (!in_array($lv["os2_id"], $total_printed_ids)) {

			$is_record_exist = 1;

			$html .= '<tr style="text-align:center;">';
			// 		$html .= '<th colspan="2">Rec. No. '.$lv["os2_id"].' </th>';
			$html .= '<th colspan="2"> </th>';
			$html .= '</tr>';
			$html .= '<tr><td colspan="1" style="color: #000; font-size: 14pt; font-weight: bold;">Document or Plan: ' . $lv["ppc_document"] . '</td><td colspan="1" style="color: #000; font-size: 14pt; font-weight: bold;">Stage: ' . $lv["st_option"] . '</td></tr>';
			$html .= '<tr><td colspan="2">Project: ' . $lv["os2_project"] . '</td></tr>';
			$html .= '<tr><td colspan="2">Breach Date: ' . $newDate . '</td></tr>';
			$html .= '<tr><td colspan="2">Breach Text: ' . $lv["os2_breach_test"] . '</td></tr>';

			if ($lk <> $last_key) {

				//	$html .= '<br pagebreak="true" />';
			}

			$insertData = ["record_id" => $lv["os2_id"], "is_printed" => 1];

			$construction_alert_merge_files->insertRow($insertData);

			if ($total_counted > 27) {
				break;
			}
			$total_counted++;
		}
	}
	$html .= '</table>';
	//	echo "<pre>"; print_r($html); exit('checking');
	if ($is_record_exist > 0) {
		create_2025_165_report($heading, $total_records, $html);
	}
}

$printed_r_sql = "SELECT record_id FROM `2025_165_report_manage_reports` WHERE is_printed = 1";
if ($printData) {
	$listsDetail = $fwDb->query($printed_r_sql);
	$fwViewData['total_printed_records'] = $total_printed_records = $total_records = count($listsDetail);
	//echo "<pre> Check Count of Projects";  print_r($listsDetail); exit;
}
