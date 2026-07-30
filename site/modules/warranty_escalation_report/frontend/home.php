<?php
//get the current limit
$memlimit = ini_get('memory_limit');
//set it to something else
//ini_set("memory_limit", "1024M");
// ini_set("memory_limit", "2048M");
ini_set('max_execution_time', 0);
$startTime = microtime(true);

$pagenum = $fwRequest->getparamget('pagenum', 0);
$listdata = $fwRequest->getParam($TABLE, array());
$table = new Fw_Db_Table('warranty_log');
$serviceClass = new ServiceClass;

// $photos = $serviceClass->setLogPhotosIdWise();
// $fwViewData['photos'] = $photos;
// $videos = $serviceClass->setLogVideosIdWise();
// $fwViewData['videos'] = $videos;
// $inspection_photos = $serviceClass->setLogInspectionPhotoIdWise();
// $fwViewData['inspection_photos'] = $inspection_photos;

$where = " WHERE (wa_status = 'Open' Or wa_status = 'Pending')";
$ord = ' ORDER BY format_flag_date ASC';

$sort_date = $fwRequest->getParam('sort_date', '');
if (!empty($sort_date)) {
	$ord =  " ORDER BY IF(warranty_log.wa_date = ' ' OR warranty_log.wa_date IS NULL , 1, 0 ) , STR_TO_DATE( warranty_log.wa_date, '%d-%m-%Y' ) DESC";
	$_SESSION['ord'] = $ord;
}

$sort_proj = $fwRequest->getParam('sort_proj', '');
if (!empty($sort_proj)) {
	$ord =  " ORDER BY  warranty_log.wa_project ";
	$_SESSION['ord'] = $ord;
}

$search_project = $fwRequest->getParam('project_name', '');
if ($search_project):
	$where .= " AND wa_project  LIKE '%" . $search_project . "%'  ";
	$_SESSION['search_project'] = $search_project;
	$fwViewData['search_project'] = $_SESSION['search_project'];
elseif ($_SESSION['search_project'] && $pagenum > 0):
	$where .= " AND wa_project LIKE  '%" . $_SESSION['search_project'] . "%' ";
	$fwViewData['search_project'] = $_SESSION['search_project'];

endif;

// Type search starts
$warranty_type = $fwRequest->getParam('warranty_type', '');
if ($warranty_type):
	$where .= " AND wa_type  LIKE '%" . $warranty_type . "%'  ";
	$_SESSION['warranty_type'] = $warranty_type;
	$fwViewData['warranty_type'] = $_SESSION['warranty_type'];
elseif ($_SESSION['warranty_type']):
	$where .= " AND wa_type LIKE  '%" . $_SESSION['warranty_type'] . "%' ";
	$fwViewData['warranty_type'] = $_SESSION['warranty_type'];
endif;
$_SESSION['where'] = $where;
// Type search ends


//Search by CGFB Responsible
$cgfb_responsible = $fwRequest->getParam('search_by_cgfb_responsible', '');
if ($cgfb_responsible):
	if ($cgfb_responsible == 'NIL') {
		$where .= " And wa_cgfb_resp = 0";
	} else {
		$where .= " And wa_cgfb_resp = " . $cgfb_responsible;
	}
	$_SESSION['cgfb_responsible'] = $cgfb_responsible;
	$fwViewData['cgfb_responsible'] = $_SESSION['cgfb_responsible'];
	$_SESSION['where'] = $where;
elseif ($_SESSION['cgfb_responsible']):
	$where .= " And wa_cgfb_resp = " . $_SESSION['cgfb_responsible'];
	$fwViewData['cgfb_responsible'] = $_SESSION['cgfb_responsible'];
	$_SESSION['where'] = $where;
endif;

// Record No search starts
$recno = $fwRequest->getParam('recno', '');
if ($recno):
	$where = " where 1 = 1";
	$where .= " and  wa_id  = " . $recno;
	$_SESSION['recno'] = $recno;
	$fwViewData['recno'] = $_SESSION['recno'];
	$_SESSION['where'] = $where;
elseif ($_SESSION['recno']):
	$where = " where 1 = 1";
	$where .= " AND wa_id  = " . $_SESSION['recno'];
	$fwViewData['recno'] = $_SESSION['recno'];
	$_SESSION['where'] = $where;
endif;
// Record No search starts  

// Responsible Staff search starts
$res_staff = $fwRequest->getParam('search_by_rs', '');
if ($res_staff):
	$where .= " AND wa_resp_staff   LIKE '%" . $res_staff . "%'  ";
	$_SESSION['res_staff'] = $res_staff;
	$fwViewData['res_staff'] = $_SESSION['res_staff'];

elseif ($_SESSION['res_staff']):

	$where .= " AND wa_resp_staff  LIKE  '%" . $_SESSION['res_staff'] . "%' ";
	$fwViewData['res_staff'] = $_SESSION['res_staff'];

endif;
// Responsible Staff search ends



$clear = $fwRequest->getParam('clear', '');
if ($clear) {
	//clearAllFilterSearch();
	$fwViewData['search_project'] = '';
	$where = "WHERE (wa_status = 'Open' OR wa_status = 'Pending')";
	$fwViewData['oc'] = 1;
	$fwViewData['pr'] = '';
	unset($_SESSION['search_project']);
	unset($_SESSION['where']);
	unset($_SESSION['recno']);
	unset($_SESSION['res_staff']);
	$fwViewData['res_staff'] = '';
	unset($_SESSION['cgfb_responsible']);
	$fwViewData['cgfb_responsible'] = '';
}

if ($pagenum > 1) {
	if (isset($_SESSION['ord'])) {
		$ord = $_SESSION['ord'];
	}
	if (isset($_SESSION['where'])) {
		$where = $_SESSION['where'];
	}
}

if (isset($_SESSION['where'])) {
	$where = $_SESSION['where'];
}

$where .= ' AND warranty_log.wa_flag = "Yes"';
$matsql = "SELECT " . $TABLE . ".*, STR_TO_DATE(warranty_log.wa_flag_date, '%d-%m-%Y') AS format_flag_date  FROM " . $TABLE . " " . $where . ' ' . $ord;
$userData = $fwDb->query($matsql);
$setdata2 = [];
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
			$setdata2[] = $list;
		endforeach;
	}
}

$wa_project_array = [];
foreach ($userData as $row) {
	$wa_project_array[] = $row['wa_project'];
}

$query = 'SELECT bsn_id, bsn_name FROM business WHERE bsn_name IN ("' . implode('","', $wa_project_array) . '")';
$result = $fwDb->query($query);
$bsn_id_array = [];
$bsn_name_array = [];
foreach ($result as $row) {
	$bsn_id_array[] = $row['bsn_id'];
	$bsn_name_array[$row['bsn_id']] = $row['bsn_name'];
}

$query = 'SELECT doc_bsn_id, doc_file_name, doc_date_uploaded FROM document_check_list WHERE doc_bsn_id IN (' . implode(',', $bsn_id_array) . ') AND doc_name_id = 779';
$result = $fwDb->query($query);
$document_check_list_array = [];
foreach ($result as $row) {
	$document_check_list_array[$bsn_name_array[$row['doc_bsn_id']]] = [
		'file' => $row['doc_file_name'],
		'date' => $row['doc_date_uploaded'],
	];
}

$query = 'SELECT wa_project, COUNT(*) AS total FROM warranty_log WHERE warranty_log.wa_flag = "Yes" GROUP BY wa_project;';
$result = $fwDb->query($query);
$total_open_logs_data = [];
foreach ($result as $row) {
	$total_open_logs_data[$row['wa_project']] = $row['total'];
}

if (!empty($setdata2)) {
	foreach ($setdata2 as $k => $v2) {

		$signed_warranty_agreement = '';
		if (isset($document_check_list_array[$v2['wa_project']]) && ($file = $document_check_list_array[$v2['wa_project']]['file']) && ($date = $document_check_list_array[$v2['wa_project']]['date'])) {
			$signed_warranty_agreement = ('<a href="/warranty_log2.download_content?file_name=' . $file . '&module_name=business.home" class="action_checklist" title="' . $file . '" target="_blank" style="display: block;">Download</a>');
			$signed_warranty_agreement .= ('<span>' . date('d-M-Y', strtotime($date)) . '</span>');
		}
		$setdata2[$k]['signed_warranty_agreement'] = $signed_warranty_agreement;

		$sq12 = "SELECT  business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname,
         bus_customers.bcust_misc_moble from business_sellers 		
	     Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	     Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name Like '%" . $v2['wa_project'] . "%'";

		$data = $fwDb->queryOne($sq12);

		$projectLink = $v2['wa_project'];
		if (!empty($data['bs_business_id'])) {
			$projectLink = '<a target="_blank" href="business.detail/bsn_id/' . $data['bs_business_id'] . '">' . $v2['wa_project'] . '</a>';
		}
		$setdata2[$k]['project_link'] = $projectLink;

		$wwwLink = '';
		if (!empty($data['bs_business_id'])) {
			// $wwwLink = '<a target="_blank" href="https://warrantyreport.com.au/project/warranty_issue/' . $data['bs_business_id'] . '">Link</a>';
			$warranty_link = BASE_URL . 'sales_phase_logon.warranty/bsn_id/' . $data['bs_business_id'] . '/login_type/customer/wa_id/' . $v2['wa_id'];
			$wwwLink = '<a target="_blank" href="' . $warranty_link . '">Link</a>';
		}

		$setdata2[$k]['www_link'] = $wwwLink;

		$daysc = '';
		if (!empty($data['bs_business_id'])) {
			$sql_datec = "select bsn_status_sys_date from business where bsn_id = " . $data['bs_business_id'];
			$data_datec = $fwDb->queryOne($sql_datec);
			$udata_datec = changedate_y_m_d($data_datec['bsn_status_sys_date']);
			$datec_current = date('Y-m-d');
			$daysc_diff = daysDifference($datec_current, $udata_datec);
		}

		$dayscount = '';
		$ccdate = $v2['wa_date'];
		if (strtotime($ccdate) > 0) {
			$Statusdate = date('Y-m-d', strtotime($ccdate));
			$curdate_y_m_d = date('Y-m-d');
			$dayscount = daysDifference($curdate_y_m_d, $Statusdate);
		}
		$setdata2[$k]['dayscount'] = $dayscount;

		$escalation_days_count = '';
		$wa_flag_date = $v2['wa_flag_date'];
		if (strtotime($wa_flag_date) > 0) {
			$wa_flag_date = date('Y-m-d', strtotime($wa_flag_date));
			$curdate_y_m_d = date('Y-m-d');
			$escalation_days_count = daysDifference($curdate_y_m_d, $wa_flag_date);
		}
		$setdata2[$k]['escalation_days_count'] = $escalation_days_count;

		$sql_t = "Select wa_id  from trade_responsibility where wa_log_number = " . $v2['wa_id'];
		$data_tr = $fwDb->queryOne($sql_t);


		$sqlenq = "Select we_answer from warranty_enquiry where we_wa_id = " . $v2['wa_id'];
		$ansdata = $fwDb->query($sqlenq);

		$sql_ud = "Select max(ws_date) as update_date from warranty_supplier_update where  ws_wa_id = " . $v2['wa_id'];
		$udData = $fwDb->queryOne($sql_ud);

		$sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = " . $v2['wa_id'];
		$ntdata = $fwDb->queryOne($sql_nt);

		$sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = " . $v2['wa_id'];
		$ntdata2 = $fwDb->queryOne($sql_nt2);



		$lnsql_1 = "select wn_notes from warranty_log_notes where wn_date = '" . changedate_d_m_Y($ntdata['notes_date']) . "' and wn_wa_id = " . $v2['wa_id'];
		$nd_1 = $fwDb->queryOne($lnsql_1);

		$sql_comch2 = "Select max(ws_date) as ws_date from warranty_supplier_update 
                 where ws_wa_id = " . $v2['wa_id'];
		$chkcomp2 = $fwDb->queryOne($sql_comch2);



		$lnsql_2 = "select ws_update_text from warranty_supplier_update 
               where ws_date = '" . $chkcomp2['ws_date'] . "' and ws_wa_id = " . $v2['wa_id'];
		$nd_2 = $fwDb->queryOne($lnsql_2);



		if (strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2'])) {
			$ndate =  $ntdata['notes_date'];
			$setdata2[$k]['notes_text'] = $nd_1['wn_notes'];
		} else {
			$ndate =  $ntdata2['notes_date2'];
			$setdata2[$k]['notes_text'] = $nd_2['ws_update_text'];
		}
		
		$sql_escnt = "SELECT elsn_notes, elsn_created_at FROM warranty_log_escalation_notes WHERE elsn_wa_id = ".$v2['wa_id']." ORDER BY elsn_created_at DESC LIMIT 1";
		$escntdata = $fwDb->queryOne($sql_escnt);
		
		if (empty($escntdata) || empty($escntdata['elsn_created_at'])) {
			$setdata2[$k]['esc_notes_date'] = '';
			$setdata2[$k]['esc_notes_text'] = '';
		} else {
			$setdata2[$k]['esc_notes_date'] = $escntdata['elsn_created_at'];;
			$setdata2[$k]['esc_notes_text'] = $escntdata['elsn_notes'];
		}

		$sql_comch = "Select max(STR_TO_DATE(ch_date, '%d-%m-%Y' ))  as comp_date from warranty_checklist 
               where ch_wa_id = " . $v2['wa_id'] . " and ch_status = 'Complete'";
		$chkcomp = $fwDb->queryOne($sql_comch);


		if (!empty($chkcomp['comp_date'])) {
			$sql99 = "select wc_task_name from warranty_checklist_admin
 	              Inner Join warranty_checklist On warranty_checklist_admin.wc_id = warranty_checklist.ch_checklist 
				  where warranty_checklist.ch_date = '" . changedate_d_m_Y($chkcomp['comp_date']) . "' and ch_wa_id = " . $v2['wa_id'];

			$chdata = $fwDb->queryOne($sql99);

			$setdata2[$k]['task_name'] = $chdata['wc_task_name'];
		} else {
			$setdata2[$k]['task_name'] = '';
		}



		$sql100 = "select sa_co_id from supplier_warranty where sa_wa_id = " . $v2['wa_id'];
		$data100 = $fwDb->query($sql100);

		$red = 0;
		foreach ($data100 as $k10 => $v10) {
			$sql101 = "Select se_co_id from supplier_email_warranty where se_co_id = " . $v10['sa_co_id'] . " and se_wa_id = " . $v2['wa_id'];
			$found = $fwDb->query($sql101);
			if (empty($found)) {
				$red = 1;
			}
		}


		$sql_11 = "Select  DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) as diff_wn 
               from warranty_log_notes where wn_wa_id = " . $v2['wa_id'] . " 
			   and DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) < 0 and wn_resolved = 0 ";
		$data11 = $fwDb->query($sql_11);

		$sql_22 = "Select DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) as diff_ws 
                from warranty_supplier_update where  ws_wa_id = " . $v2['wa_id'] .  " 
				and DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) < 0 and ws_resolved = 0 ";
		$data22 = $fwDb->query($sql_22);


		$setdata2[$k]['wa_project'] = stripslashes($v2['wa_project']);

		$setdata2[$k]['bs_business_id'] = $data['bs_business_id'];
		$setdata2[$k]['bs_customers_id'] = $data['bs_customers_id'];
		$setdata2[$k]['bcust_fname'] = $data['bcust_fname'];
		$setdata2[$k]['bcust_lname'] = $data['bcust_lname'];
		$setdata2[$k]['bcust_misc_moble'] = $data['bcust_misc_moble'];
		$setdata2[$k]['wa_selected'] = $red;
		$setdata2[$k]['total_open_logs'] = $total_open_logs_data[$v2['wa_project']] ?? 0;
		$setdata2[$k]['update_date'] = changedate_d_m_y($udData['update_date']);
		$setdata2[$k]['notes_date']  = changedate_d_m_y($ndate);

		if (!empty($data11) || !empty($data22)) {
			$setdata2[$k]['cell_red'] = 1;
		} else {
			$setdata2[$k]['cell_red'] = 0;
		}


		if (!empty($data_tr['wa_id'])) {
			$setdata2[$k]['wa_button'] =  $data_tr['wa_id'];
		}

		$setdata2[$k]['enquiry_pen'] = 0;
		foreach ($ansdata as $k4 => $v4) {
			if (strlen(trim($v4['we_answer'])) == 0 || $v4['we_answer'] == NULL) {
				$setdata2[$k]['enquiry_pen'] = 1;
				break;
			}
		}
		$sql4 = "select count(*) as tot from warranty_supplier_update where ws_wa_id = " . $v2['wa_id'];
		$cudata = $fwDb->queryOne($sql4);

		if ($cudata['tot'] > 0) {
			$setdata2[$k]['supplier_upadate'] = true;
		}

		$setdata2[$k]['wa_lia_acc'] = $v2['wa_lia_acc'];

		$sql5 = "Select count(*) as tot_cd from warranty_checklist where ch_wa_id = " . $v2['wa_id'] . " and ch_status IN ('Complete')";
		$cd_data = $fwDb->queryOne($sql5);

		$setdata2[$k]['tot_cd'] = $cd_data['tot_cd'];

		$sql1234 = "Select bsn_id from business where bsn_name like '%" . $v2['wa_project'] . "%'";
		//db($sql1234);
		$bsnData = $fwDb->queryOne($sql1234);

		$sql5678 = "Select business_tasks.bt_completed_date from business_tasks
			     where business_tasks.bt_bsn_id = " . $bsnData['bsn_id'] . " And business_tasks.bt_task_id = 254 ";

		$data2 = $fwDb->queryOne($sql5678);

		$setdata2[$k]['bt_completed_date_254'] = changedate_d_m_y($data2['bt_completed_date']);

		if ($bsnData['bsn_id']) {
			//$bsn_id = $bsnRow['bsn_id'];
			$bsn_id = $bsnData['bsn_id'];

			//get and add hia_value and ppd_value
			$sqlSum = "SELECT SUM( CASE WHEN TRIM(ppd_hia_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_hia, SUM( CASE WHEN TRIM(ppd_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_ppd FROM progress_payment_detail WHERE ppd_bsn_id =" . $bsn_id;
			$sumRow = $fwDb->queryOne($sqlSum);

			//$sumRow = $fwDb->queryOne($sqlSum, [$bsn_id]);

			$total_hia = isset($sumRow['total_hia']) ? (float)$sumRow['total_hia'] : 0;
			$total_ppd = isset($sumRow['total_ppd']) ? (float)$sumRow['total_ppd'] : 0;

			// Step 3: Calculate difference
			if ($total_hia > 0) {
				if ($total_ppd > 0) {
					$outstanding = $total_hia - $total_ppd;
				} else {
					$outstanding = $total_hia;
				}
				$setdata2[$k]['project_balance'] = ($outstanding < 0 ? "-$" : "$") . number_format(abs($outstanding), 2, '.', ',');
			} else {
				$setdata2[$k]['project_balance'] = '';
			}
		} else {
			$setdata2[$k]['project_balance'] = '';
		}

		if ($bsnData['bsn_id']) {
			$bsn_id = $bsnData['bsn_id'];
			$sql_outstanding_inv = "SELECT bsn_wa_outstanding_payment FROM business where bsn_id = " . $bsn_id;
			$data_outstanding_inv = $fwDb->queryOne($sql_outstanding_inv);
			$setdata2[$k]['outstanding_invoices'] = $data_outstanding_inv['bsn_wa_outstanding_payment'];
		} else {
			$setdata2[$k]['outstanding_invoices'] = '';
		}
	}
	$fwViewData['list'] = $setdata2;
	$fwViewData['title'] = $MODULE_PLURAL;
} else {
	$fwViewData['notfound'] = 'No Open Logs Found. If you think record is found but not showing Please click on CLEAR All SEARCH button<br>If there is a closed log then click on Closed Log Button ';
}

$sqlpr = "SELECT * FROM warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);

$thisTable = new Fw_Db_Table("warranty_log_type");
$fwViewData['typedetail'] = $thisTable->getAllRows();

$areaTable = new Fw_Db_Table("warranty_log_area");
$fwViewData['areadetail'] = $areaTable->getAllRows();

$areaTable = new Fw_Db_Table("warranty_log_cgfb");
$fwViewData['cgfbdetail'] = $areaTable->getAllRows();
$warranty_log_cgfb_array = [];
foreach ($areaTable->getAllRows() as $row) {
	$warranty_log_cgfb_array[$row['wc_id']] = $row['wc_cgfb_option'];
}

$actionTable = new Fw_Db_Table("warranty_log_escalation_actions");
$fwViewData['escalationActions'] = $actionTable->getAllRows();
$warranty_log_escalation_actions_array = [];
foreach ($actionTable->getAllRows() as $row) {
	$warranty_log_escalation_actions_array[$row['wlea_id']] = $row['wlea_option'];
}

$whynotTable = new Fw_Db_Table("warranty_log_why_not");
$fwViewData['whynotdetail'] = $whynotTable->getAllRows();

$thisLT = new Fw_Db_Table("warranty_log_liability");
$fwViewData['liadetail'] = $thisLT->getAllRows();


$sqlRe = "SELECT DISTINCT cs_position FROM contacts WHERE cs_position <> ''";
$fwViewData['rsdetail'] = $fwDb->query($sqlRe);

$sql_pro = "SELECT DISTINCT wa_project FROM warranty_log";
$fwViewData['project_data'] = $fwDb->query($sql_pro);


$query = 'SELECT SUM(DATEDIFF(wa_escalation_required_no_at, wa_escalation_required_yes_at)) / COUNT(*) AS average FROM `warranty_log` WHERE DATEDIFF(wa_escalation_required_no_at, wa_escalation_required_yes_at) > 0 AND wa_escalation_required_no_at > wa_escalation_required_yes_at AND (wa_status = "Open" OR wa_status = "Pending");';
$result = $fwDb->queryOne($query);
$average_time_added_minus_removed = $result['average'];

$query = "SELECT * FROM $TABLE WHERE warranty_log.wa_flag = 'Yes' AND (wa_status = 'Open' OR wa_status = 'Pending')";
$result = $fwDb->query($query);
$total_escalation_logs = count($result);
$total_escalation_logs_sum = 0;
$total_escalation_logs_average = 0;
$total_last_7_days_escalation_logs = 0;
$total_more_than_30_days_escalation_logs = 0;
foreach ($result as $row) {
	$escalation_days_count = 0;
	$wa_flag_date = $row['wa_flag_date'];
	if (strtotime($wa_flag_date) > 0) {
		$wa_flag_date = date('Y-m-d', strtotime($wa_flag_date));
		$curdate_y_m_d = date('Y-m-d');
		$escalation_days_count = daysDifference($curdate_y_m_d, $wa_flag_date);
	}
	$total_escalation_logs_sum += $escalation_days_count;
	if ($escalation_days_count <= 7) {
		$total_last_7_days_escalation_logs++;
	}
	if ($escalation_days_count > 30) {
		$total_more_than_30_days_escalation_logs++;
	}
}
if ($total_escalation_logs > 0) {
	$total_escalation_logs_average = $total_escalation_logs_sum / $total_escalation_logs;
}

$escalation_data_table = [
	'Number of logs currently in the Escalation Report' => $total_escalation_logs,
	'Number of logs added in the last 7 days' => $total_last_7_days_escalation_logs,
	'Average escalation days count' => round($total_escalation_logs_average, 2),
	'Average time from when a log was added to escalation to when it was removed' => round($average_time_added_minus_removed, 2),
	'Logs in Escalation for More Than 30 Days' => $total_more_than_30_days_escalation_logs,
];
$fwViewData['escalation_data_table'] = $escalation_data_table;


$export = $fwRequest->getParam('export', 0);

if ($export > 0) {

	require BASE_DIR . "PHPExcel/Classes/PHPExcel.php";
	$objPHPExcel = new PHPExcel();

	$objPHPExcel->getProperties()->setCreator("Deckquotes")
		->setLastModifiedBy("Nick C")
		->setTitle("Office 2007 XLSX Warranty Escalation Report")
		->setSubject("Office 2007 XLSX Warranty Escalation Report")
		->setDescription("Warranty Escalation Report List exported to Office 2007 XLSX.")
		->setKeywords("office 2007 openxml php")
		->setCategory("Warranty Escalation Report file");

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

	// Add some data
	$objPHPExcel->setActiveSheetIndex(0)
		->setCellValue('A1', 'Rec. No.')
		->setCellValue('B1', 'Total Open')
		->setCellValue('C1', 'Problem')
		->setCellValue('D1', 'Project')
		->setCellValue('E1', 'Type')
		->setCellValue('F1', 'CGFB Responsible')
		->setCellValue('G1', 'Days Count')
		->setCellValue('H1', 'Escalation Days Count')
		->setCellValue('I1', 'Notes')
		->setCellValue('J1', 'Action')
	;

	$from = "A1"; // or any value
	$to = "J1"; // or any value
	$objPHPExcel->getActiveSheet()->getStyle("$from:$to")->getFont()->setBold(true);

	$row = 2;
	if (!empty($setdata2)) {
		foreach ($setdata2 as $k => $v) {
			$objPHPExcel->getActiveSheet()
				->setCellValue('A' . $row, $v['wa_id'])
				->setCellValue('B' . $row, $v['total_open_logs'])
				->setCellValue('C' . $row, stripslashes($v['wa_problem']))
				->setCellValue('D' . $row, $v['wa_project'])
				->setCellValue('E' . $row, $v['wa_type'])
				->setCellValue('F' . $row, $warranty_log_cgfb_array[$v['wa_cgfb_resp']])
				->setCellValue('G' . $row, $v['dayscount'])
				->setCellValue('H' . $row, $v['escalation_days_count'])
				->setCellValue('I' . $row, $v['notes_text'])
				->setCellValue('J' . $row, $warranty_log_escalation_actions_array[$v['wa_wlea_id']])
			;
			$row++;
		}
	}

	$objPHPExcel->getActiveSheet()->setTitle('Warranty Escalation Report');
	$objPHPExcel->setActiveSheetIndex(0);

	// Redirect output to a client’s web browser (Excel5)
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="warranty_escalation_report_' . time() . '.xls"');
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
