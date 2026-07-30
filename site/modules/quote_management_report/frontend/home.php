<?php
$pagenum = $fwRequest->getparamget('pagenum', 0);
$table = new Fw_Db_Table('debt_recovery_report');

$fwViewData['rejected_color'] = $rejected_color = 'red';
$fwViewData['unprocessed_color'] = $unprocessed_color = 'orange';
$fwViewData['pending_color'] = $pending_color = 'orange';
$fwViewData['approved_color'] = $approved_color = 'green';
$fwViewData['complete_color'] = $complete_color = 'green';
$fwViewData['no_quote_color'] = $no_quote_color = 'red';
$fwViewData['unknown_component_color'] = $unknown_component_color = 'red';
$fwViewData['quote_received_color'] = $quote_received_color = 'orange';

$query = 'SELECT * FROM quote_management_report_status';
$result = $fwDb->query($query);
$quote_management_report_status = [];
$complete_status_id = 0;
$rejected_status_id = 0;
foreach ($result as $row) {
	$quote_management_report_status[$row['qmrs_id']] = $row;
	if ($row['qmrs_name'] == 'Rejected') {
		$rejected_status_id = $row['qmrs_id'];
	} else if ($row['qmrs_name'] == 'Complete') {
		$complete_status_id = $row['qmrs_id'];
	}
}
$fwViewData['quote_management_report_status'] = $quote_management_report_status;
$fwViewData['rejected_status_id'] = $rejected_status_id;
$fwViewData['complete_status_id'] = $complete_status_id;

//$where = " WHERE qm_component_action = 1 ";
//$where = " WHERE qm_component_action = 1 AND qm_qmrs_id != $rejected_status_id AND qm_qmrs_id != $complete_status_id";
$where = " AND qm_qmrs_id NOT IN ($rejected_status_id, $complete_status_id)";

$clear = $fwRequest->getParam('clear', '');
if (!empty($clear)) {
	unset($_SESSION['address']);
	unset($_SESSION['position']);
	unset($_SESSION['component']);
	unset($_SESSION['due_date']);
	unset($_SESSION['quote_status']);
	unset($_SESSION['show_hidden_quotes']);
	unset($_SESSION['show_all_quotes']);
	$fwViewData['quote_status'] = '';
	
	/* unset($_SESSION['approved_quotes']);
	$fwViewData['approved_quotes'] = ''; */

	$redirectUrl = $_SERVER['REQUEST_URI'];
	header("Location: $redirectUrl");
	exit;
}

$show_all_quotes = $fwRequest->getParam('show_all_quotes', '');
if (!empty($show_all_quotes)) {
	$where = " AND 1 = 1 ";
	$_SESSION['show_all_quotes'] = $show_all_quotes;
	$fwViewData['show_all_quotes'] = $_SESSION['show_all_quotes'];
} elseif ($_SESSION['show_all_quotes']) {
	$where = " AND 1 = 1 ";
	$fwViewData['show_all_quotes'] = $_SESSION['show_all_quotes'];
}

$show_hidden_quotes = $fwRequest->getParam('show_hidden_quotes', '');
if (!empty($show_hidden_quotes)) {
	$where = " AND qm_qmrs_id in ($rejected_status_id, $complete_status_id) ";
	$_SESSION['show_hidden_quotes'] = $show_hidden_quotes;
	$fwViewData['show_hidden_quotes'] = $_SESSION['show_hidden_quotes'];
} elseif ($_SESSION['show_hidden_quotes']) {
	$where = " AND qm_qmrs_id in ($rejected_status_id, $complete_status_id) ";
	$fwViewData['show_hidden_quotes'] = $_SESSION['show_hidden_quotes'];
}

$address = $fwRequest->getParam('address', '');
if ($address):
	$where .= " AND quote_management_report.qm_project LIKE '%" . $address . "%'";
	$_SESSION['address'] = $address;
	$fwViewData['address'] = $_SESSION['address'];
elseif ($_SESSION['address']):
	$where .= " AND quote_management_report.qm_project LIKE '%" . $_SESSION['address'] . "%' ";
	$fwViewData['address'] = $_SESSION['address'];
endif;

/* 
$approved_quotes = $fwRequest->getParam('approved_quotes', '');
if ($approved_quotes):
	$where .= " AND quote_management_report.qm_qmrs_id = 4";
	$_SESSION['approved_quotes'] = $approved_quotes;
	$fwViewData['approved_quotes'] = $_SESSION['approved_quotes'];
elseif ($_SESSION['approved_quotes']):
	$where .= " AND quote_management_report.qm_qmrs_id = 4";
	$fwViewData['approved_quotes'] = $_SESSION['approved_quotes'];
else :
	$where .= " AND quote_management_report.qm_qmrs_id != 4 ";
endif; */


$position = $fwRequest->getParam('position', '');
if (!empty($position)) {
	$_SESSION['position'] = $position;
	$fwViewData['position'] = $_SESSION['position'];
}

$component = $fwRequest->getParam('component', '');
if (!empty($component)) {
	$_SESSION['component'] = $component;
}

//Filter for Quote Status
/* $quote_status = $fwRequest->getParam('quote_status', '');
if (!empty($quote_status)) {
	$_SESSION['quote_status'] = $quote_status;
	$fwViewData['quote_status'] = $_SESSION['quote_status'];
} */
$quote_status = $fwRequest->getParam('quote_status', '');
if (!empty($quote_status)) {
	$where .= " AND qm_qmrs_id = ".$quote_status;
	$_SESSION['quote_status'] = $quote_status;
	$fwViewData['quote_status'] = $_SESSION['quote_status'];
} elseif ($_SESSION['quote_status']) {
	$where .= " AND qm_qmrs_id = ".$_SESSION['quote_status'];
	$fwViewData['quote_status'] = $_SESSION['quote_status'];
}
//End Filter for Quote Status


$due_date = $fwRequest->getParam('due_date', '');

if (!empty($due_date)) {
	$_SESSION['due_date'] = $due_date;
}

$query = 'SELECT * FROM quote_management_report_companies';
$result = $fwDb->query($query);
$quote_management_report_companies = [];
foreach ($result as $row) {
	if (!isset($quote_management_report_companies[$row['qmrc_qm_id']])) {
		$quote_management_report_companies[$row['qmrc_qm_id']] = [];
	}
	$quote_management_report_companies[$row['qmrc_qm_id']][] = $row;
}

$query = "SELECT co_id, co_company_name FROM companies";
$result = $fwDb->query($query);
$co_company_names = [];
foreach ($result as $row) {
	$co_company_names[$row['co_id']] = $row['co_company_name'];
}
$fwViewData['co_company_names'] = $co_company_names;

$query = 'SELECT * FROM quote_management_report_status_log WHERE qmrsl_id IN (SELECT MAX(qmrsl_id) FROM quote_management_report_status_log GROUP BY qmrsl_qm_id);';
$result = $fwDb->query($query);
$quote_management_report_status_log = [];
foreach ($result as $row) {
	$quote_management_report_status_log[$row['qmrsl_qm_id']] = $row;
}

$query = "SELECT user_id, user_username FROM users";
$result = $fwDb->query($query);
$users = [];
foreach ($result as $row) {
	$users[$row['user_id']] = $row['user_username'];
}

$query = "SELECT * FROM quote_builder_component";
$result = $fwDb->query($query);
$quote_builder_component = [];
foreach ($result as $row) {
	$quote_builder_component[$row['qb_id']] = $row;
}

$quote_management_report_qa = [];
$query = 'SELECT QMR_MAIN.qm_id, COUNT(*) AS total_ques, (SELECT COUNT(*) FROM quote_management_report_qa AS QMR WHERE QMR.qmr_qa_ans != "" AND QMR.qm_id = QMR_MAIN.qm_id) AS total_ans FROM quote_management_report_qa AS QMR_MAIN GROUP BY QMR_MAIN.qm_id;';
$result = $fwDb->query($query);
foreach ($result as $row) {
	$quote_management_report_qa[$row['qm_id']] = $row;
}

//$matsql = "SELECT " . $TABLE . ".* FROM " . $TABLE . " " . $where;
$matsql = "SELECT " . $TABLE . ".*, 
  CASE 
    WHEN qbc.qb_due_date_sod = 1 
    THEN DATE_SUB(b.bsn_starting_onsite_date, INTERVAL qbc.qb_due_date_week*7 DAY)
    ELSE DATE_ADD(b.bsn_starting_onsite_date, INTERVAL qbc.qb_due_date_week*7 DAY)
  END AS due_date
FROM " . $TABLE . "
LEFT JOIN ( SELECT bsn_name, MAX(STR_TO_DATE(bsn_starting_onsite_date,'%d-%m-%Y')) AS bsn_starting_onsite_date FROM business GROUP BY bsn_name ) b ON b.bsn_name = " . $TABLE . ".qm_project LEFT JOIN quote_builder_component qbc ON qbc.qb_id = " . $TABLE . ".qm_component WHERE qm_component_action = 1 " . $where . " ORDER BY due_date IS NULL ASC, due_date ASC";
//echo $matsql;
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
			$list['suppliers'] = $quote_management_report_companies[$list['qm_id']] ?? [];
			$list['suppliers_color'] = empty($list['suppliers']) ? 'red' : 'white';
			$list['attachment_color'] = 'red';
			if ($list['qm_attachment_1'] || $list['qm_attachment_2'] || $list['qm_attachment_3'] || $list['qm_attachment_4'] || $list['qm_attachment_5']) {
				$list['attachment_color'] = 'white';
			}
			$qa_name_date = '';
			if (isset($quote_management_report_status_log[$list['qm_id']])) {
				$qmrsl_user_id = $quote_management_report_status_log[$list['qm_id']]['qmrsl_user_id'];
				$qmrsl_created_at = $quote_management_report_status_log[$list['qm_id']]['qmrsl_created_at'];
				$qa_name_date .= '
					<div style="display: flex; gap: 0 8px;">
						<div>
							<a href="' . BASE_URL . $BASEFOLDER . '.add_qmr_qa/' . $ID . '/' . $list['qm_id'] . '" class="various">QA</a>:
						</div>
						<div>
							<p style="margin: 0; padding: 0;">' . ($users[$qmrsl_user_id]) . '</p>
							<p style="margin: 0; padding: 0;">' . (strtotime($qmrsl_created_at) > 0 ? date('d-M-Y', strtotime($qmrsl_created_at)) : '') . '</p>
						</div>
					</div>
				';
			}
			$list['qa_name_date'] = $qa_name_date;
			$listsnew[] = $list;
		endforeach;

		$fwViewData['list'] = $listsnew;
	}
}

if (!empty($userData)) {
foreach ($listsnew as $k => $v) {
	$sql_1 = "select bsn_id, bsn_type,  bsn_starting_onsite_date from business where bsn_name='" . $v['qm_project'] . "'";
	$data = $fwDb->queryOne($sql_1);

	$link = BASE_URL . "business.detail/bsn_id/" . $data['bsn_id'];

	$sql_2 = "select pt_name from project_type where pt_id = " . $data['bsn_type'];
	$typedata = $fwDb->queryOne($sql_2);

	$qmrs_name = $quote_management_report_status[$v['qm_qmrs_id']]['qmrs_name'];
	$qm_qmrs_id_color = 'white';
	if ($qmrs_name == 'Rejected') {
		$qm_qmrs_id_color = $rejected_color;
	} elseif ($qmrs_name == 'Approved') {
		$qm_qmrs_id_color = $approved_color;
	} elseif ($qmrs_name == 'Pending') {
		$qm_qmrs_id_color = $pending_color;
	} elseif ($qmrs_name == 'Unprocessed') {
		$qm_qmrs_id_color = $unprocessed_color;
	} elseif ($qmrs_name == 'Complete') {
		$qm_qmrs_id_color = $complete_color;
	} elseif ($qmrs_name == 'No Quote') {
		$qm_qmrs_id_color = $no_quote_color;
	} elseif ($qmrs_name == 'Unknown Component') {
		$qm_qmrs_id_color = $unknown_component_color;
	} elseif ($qmrs_name == 'Quote Received') {
		$qm_qmrs_id_color = $quote_received_color;
	}
	$listsnew[$k]['qmrs_name'] = $qmrs_name;
	$listsnew[$k]['qm_qmrs_id_color'] = $qm_qmrs_id_color;

	// $sqlcm = "Select qb_component, qb_sup_position, qb_sup_email,  qb_due_date_week, qb_due_date_sod
	//            from quote_builder_component where qb_id = " . $v['qm_component'];

	$cmdetail = $quote_builder_component[$v['qm_component']];


	$w = $cmdetail['qb_due_date_week'];
	$s = $cmdetail['qb_due_date_sod'];

	$dy = $w * 7;
	$tdate = $data['bsn_starting_onsite_date'];
	
	$sql_emcode = "SELECT quote_builder_component.qb_email_code, emaillibrary.eml_code FROM `quote_builder_component` LEFT JOIN emaillibrary ON emaillibrary.eml_id = quote_builder_component.qb_email_code where qb_id = ". $v['qm_component'];
	$data_emcode = $fwDb->queryOne($sql_emcode);
	$listsnew[$k]['emcode_link'] = '<a href="'.$BASE_URL.'emaillibrary.compose/eml_id/'.$data_emcode['qb_email_code'].'"target="_blank">'.$data_emcode['eml_code'].'</a>';


	if (!empty($tdate)) {
		if ($s == 1) {
			$tdate = date('d-m-Y', strtotime($tdate . ' -' . $dy . ' day'));
		} else {
			$tdate = date('d-m-Y', strtotime($tdate . ' +' . $dy . ' day'));
		}
	} else {

		$tdate = '';
	}

	$listsnew[$k]['link'] = $link;
	$listsnew[$k]['qb_component_procedure_link'] = $cmdetail['qb_component_procedure_link'] ? ('<a href="' . $cmdetail['qb_component_procedure_link'] . '" target="_blank">Link</a>') : '';
	//	$listsnew[$k]['customer'] = $data_2['bcust_fname']. ' '.$data_2['bcust_lname'];
	$listsnew[$k]['project_type'] = $typedata['pt_name'];
	$listsnew[$k]['bsn_starting_onsite_date'] = $data['bsn_starting_onsite_date'];
	$listsnew[$k]['qb_component'] = $cmdetail['qb_component'];
	$listsnew[$k]['res_position'] = $cmdetail['qb_sup_position'];
	$listsnew[$k]['res_email'] = $cmdetail['qb_sup_email'];
	$listsnew[$k]['due_date'] = $tdate;

	$qa_color = 'inherit';
	if (isset($quote_management_report_qa[$v['qm_id']])) {
		// db($quote_management_report_qa[$v['qm_id']]);
		$total_ques = $quote_management_report_qa[$v['qm_id']]['total_ques'];
		$total_ans = $quote_management_report_qa[$v['qm_id']]['total_ans'];
		if ($total_ques > 0) {
			$qa_color = 'red';
		}
		if ($total_ans >= $total_ques) {
			$qa_color = 'green';
		}
	}
	$listsnew[$k]['qa_color'] = $qa_color;
}

/* SORTING START
$today = strtotime(date('d-m-Y'));
usort($listsnew, function($a, $b) use ($today) {

    $da = !empty($a['due_date']) ? strtotime($a['due_date']) : null;
    $db = !empty($b['due_date']) ? strtotime($b['due_date']) : null;

    if ($da === null && $db === null) return 0;
    if ($da === null) return 1;
    if ($db === null) return -1;

    $a_future = $da >= $today;
    $b_future = $db >= $today;

    if ($a_future && !$b_future) return -1;
    if (!$a_future && $b_future) return 1;

    if ($a_future && $b_future) {
        return $da - $db;
    }

    return $db - $da;
});

SORTING END */

$fwViewData['list'] = $listsnew;

}

if (!empty($position) || isset($_SESSION['position'])) {
	foreach ($listsnew as $m1 => $s1) {
		if (strpos($s1['res_position'], $_SESSION['position']) !== false) {
		} else {
			unset($listsnew[$m1]);
		}
	}
	
	$rows = count($listsnew);
	$last = ceil($rows / $page_rows);
	$fwViewData['last'] = $last;
}

if (!empty($component) || isset($_SESSION['component'])) {
	$fwViewData['component'] = $_SESSION['component'];
	foreach ($listsnew as $m1 => $s1) {
		if (strpos($s1['qb_component'], $_SESSION['component']) !== false) {
		} else {
			unset($listsnew[$m1]);
		}
	}
	
	$rows = count($listsnew);
	$last = ceil($rows / $page_rows);
	$fwViewData['last'] = $last;

}

/* if (!empty($quote_status) || isset($_SESSION['quote_status'])) {
	foreach ($listsnew as $qs => $qs2) {
		if (strpos($qs2['qm_qmrs_id'], $_SESSION['quote_status']) !== false) {
		} else {
			unset($listsnew[$qs]);
		}
	}
	
	$rows = count($listsnew);
	$last = ceil($rows / $page_rows);
	$fwViewData['last'] = $last;
} */

if (!empty($due_date) || isset($_SESSION['due_date'])) {
	if ($_SESSION['due_date'] == 1) {
		$d1 = date('d-m-Y');
		$dts1 = strtotime($d1);

		foreach ($listsnew as $m2 => $s2) {
			$dts2 = strtotime($s2['due_date']);
			if ($dts1 < $dts2) {

				unset($listsnew[$m2]);
			}
		}
	}
	$days = 0;
	if ($_SESSION['due_date'] == 2) {
		$d1 = date('Y-m-d');

		foreach ($listsnew as $m2 => $s2) {
			$d2 = changedate_y_m_d($s2['due_date']);
			$days = daysDifference($d2, $d1);

			if ($days < 0 or $days > 14) {

				unset($listsnew[$m2]);
			}
		}
	}
	
	$rows = count($listsnew);
	$last = ceil($rows / $page_rows);
	$fwViewData['last'] = $last;
}

$fwViewData['list'] = $listsnew;

$fwViewData['list'] = $listsnew;
$fwViewData['title'] = $MODULE_PLURAL;

$sqlpr = "SELECT * FROM quote_builder_component ORDER BY qb_component ASC";
$fwViewData['cdetail'] = $fwDb->query($sqlpr);

$sql_project = "SELECT distinct qm_project FROM `quote_management_report` ";
$fwViewData['project_address'] = $fwDb->query($sql_project);

$sql_position = "SELECT DISTINCT qb_sup_position FROM quote_builder_component WHERE qb_id IN (SELECT DISTINCT qm_component FROM quote_management_report)";
$fwViewData['position_list'] = $fwDb->query($sql_position);

$export = $fwRequest->getParam('export', 0);
if ($export > 0) {
	
	//echo "<pre>"; print_r($userData); exit();
	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Quote Management Report")
		->setSubject("Office 2007 XLSX Quote Management Report")
		->setDescription("Quote Management Report List exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Quote Management Report file");

	$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
	$objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Sr No')
		->setCellValue('B1', 'Project Address')
		->setCellValue('C1', 'Project Type')
		->setCellValue('D1', 'Starting Onsite Date')
		->setCellValue('E1', 'Component')
		->setCellValue('F1', 'Email Link')
		->setCellValue('G1', 'Suppliers')
		->setCellValue('H1', 'Quote Number')
		->setCellValue('I1', 'PO Number')
		->setCellValue('J1', 'Project Component Due Date')
		->setCellValue('K1', 'Responsible Position')
		->setCellValue('L1', 'Quote Status')
	;

	$from = "A1"; // or any value
	$to = "L1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	$sr = 1;
	if (!empty($userData)) {
		foreach ($userData as $k => $v) {
			
			$sql_1 = "select bsn_id, bsn_type, bsn_starting_onsite_date from business where bsn_name='" . $v['qm_project'] . "'";
			$data_1 = $fwDb->queryOne($sql_1);
			
			$sql_2 = "select pt_name from project_type where pt_id = " . $data['bsn_type'];
			$typedata = $fwDb->queryOne($sql_2);
			
			$sql_comp = "SELECT qb_component, qb_sup_position FROM quote_builder_component where qb_id = ".$v['qm_component'];
			$comp_detail = $fwDb->queryOne($sql_comp);
			
			$sql_emcode = "SELECT emaillibrary.eml_code FROM `quote_builder_component` LEFT JOIN emaillibrary ON emaillibrary.eml_id = quote_builder_component.qb_email_code where qb_id = ". $v['qm_component'];
			$data_emcode = $fwDb->queryOne($sql_emcode);
			
			$sql_supp_name = "SELECT companies.co_company_name FROM quote_management_report_companies LEFT JOIN companies ON companies.co_id = quote_management_report_companies.qmrc_co_id WHERE quote_management_report_companies.qmrc_qm_id = ".$v['qm_id'];
			$data_supp_name = $fwDb->queryOne($sql_supp_name);
			
			$sql_qs = "SELECT qmrs_name FROM quote_management_report_status where qmrs_id = ".$v['qm_qmrs_id'];
			$data_qs = $fwDb->queryOne($sql_qs);
			
			$cmdetail = $quote_builder_component[$v['qm_component']];

			$w = $cmdetail['qb_due_date_week'];
			$s = $cmdetail['qb_due_date_sod'];

			$dy = $w * 7;
			$tdate = $data_1['bsn_starting_onsite_date'];

			if (!empty($tdate)) {
				if ($s == 1) {
					$tdate = date('d-m-Y', strtotime($tdate . ' -' . $dy . ' day'));
				} else {
					$tdate = date('d-m-Y', strtotime($tdate . ' +' . $dy . ' day'));
				}
			} else {

				$tdate = '';
			}
			
			$objPHPExcel->getActiveSheet()
				->setCellValue('A' . $row, $v['qm_id'])
				->setCellValue('B' . $row, $v['qm_project'])
				->setCellValue('C' . $row, $typedata['pt_name'])
				->setCellValue('D' . $row, $data_1['bsn_starting_onsite_date'])
				->setCellValue('E' . $row, $comp_detail['qb_component'])
				->setCellValue('F' . $row, $data_emcode['eml_code'])
				->setCellValue('G' . $row, $data_supp_name['co_company_name'])
				->setCellValue('H' . $row, $v['qm_quote_number'])
				->setCellValue('I' . $row, $v['qm_po_number'])
				->setCellValue('J' . $row, $tdate)
				->setCellValue('K' . $row, $comp_detail['qb_sup_position'])
				->setCellValue('L' . $row, $data_qs['qmrs_name'])
			;
			$row = $row + 1;
			$sr = $sr + 1;
		}
	}

	$objPHPExcel->getActiveSheet()->setTitle('Quote Management Report');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="quote_management_report.xls"');
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
