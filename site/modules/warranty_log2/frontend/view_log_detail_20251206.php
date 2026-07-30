<?php

$fwMainView = 'file:' . getcwd() . '/view_log_detail.tpl';
$table = new Fw_Db_Table('warranty_log');
$serviceClass = new ServiceClass;

$id = $fwRequest->getParam('wa_id', '');

// UPDATE `warranty_log` SET wa_is_inspection_fee_required = 0, wa_is_inspection_fee_required_by = 0, wa_is_inspection_fee_required_at = null, wa_is_inspection_fee_required_accepted = 0, wa_is_inspection_fee_required_accepted_at = null, wa_is_inspection_fee_required_cancelled = 0, wa_is_inspection_fee_required_cancelled_at = null, wa_is_inspection_fee_required_scheduled = 0, wa_is_inspection_fee_required_scheduled_date = null, wa_is_inspection_fee_required_scheduled_at = null, wa_wlis_id = 0, wa_inspection_proposed_fees = 0, wa_is_inspection_fee_required_scheduled_start_time = null, wa_is_inspection_fee_required_scheduled_end_time  = null, wa_is_inspection_fee_required_scheduled_day = null WHERE `wa_project` LIKE '%Systems Test Project 2%' ORDER BY `wa_is_inspection_fee_required` DESC; 
// Query to reset inspection details

$paid_inspection = $fwRequest->getParam('paid_inspection', []);
$complimentary_inspection = $fwRequest->getParam('complimentary_inspection', []);
if((!empty($paid_inspection) || !empty($complimentary_inspection)) && $id != '') {
	$table->setWhere('wa_id = ' . $id);
	if($table->rowExists()) {
        if(!empty($paid_inspection) && !empty($paid_inspection['insepection_fee'])) {
			$data = $paid_inspection;
		}
		elseif(!empty($complimentary_inspection) && !empty($complimentary_inspection['insepection_fee'])) {
			$data = $complimentary_inspection;
		}
		// db($data);
		// db($paid_inspection);
		// db($complimentary_inspection);
		$wa_wlis_id = $data['wa_wlis_id'];
		$wa_inspection_proposed_fees = $data['wa_inspection_proposed_fees'];
		$wa_is_inspection_fee_required = $data['wa_is_inspection_fee_required'];

		$table->updateRow([
			'wa_is_inspection_fee_required' => $wa_is_inspection_fee_required,
			'wa_is_inspection_fee_required_by' => $_SESSION['user']['user_id'],
			'wa_is_inspection_fee_required_at' => date('Y-m-d'),
            'wa_inspection_proposed_fees' => $wa_inspection_proposed_fees,
            'wa_wlis_id' => $wa_wlis_id,
		]);

		if($wa_is_inspection_fee_required == 1) {
			// send email
			// send sms

			$serviceClass->sendImmediateEmailAndSms($table->getRow());
		}

        $sql = 'INSERT INTO warranty_log_inspection_status_log(wlisl_wa_id,wlisl_wlis_id,wlisl_created_by,wlisl_created_table) VALUES(' . $id . ',' . $wa_wlis_id . ',' . $_SESSION['user']['user_id'] . ', "users")';
        $fwDb->queryOne($sql);
	}
	Location(BASE_URL . 'warranty_log2.view_log_detail/wa_id/' . $id);
	exit;
}


$photos = $serviceClass->setLogPhotosIdWise($id);
$fwViewData['photos'] = $photos;
$videos = $serviceClass->setLogVideosIdWise($id);
$fwViewData['videos'] = $videos;

$query = 'SELECT * FROM users';
$result = $fwDb->query($query);
$users_array = [];
foreach($result as $row) {
    $users_array[$row['user_id']] = $row['user_name'];
}

$sql_log = "Select * from warranty_log where wa_id = $id";
$data_log = $fwDb->queryOne($sql_log);

$wa_is_inspection_fee_required_user = $wa_is_inspection_fee_required_date = '';
if(isset($users_array[$data_log['wa_is_inspection_fee_required_by']])) {
    $wa_is_inspection_fee_required_user = $users_array[$data_log['wa_is_inspection_fee_required_by']];
    $wa_is_inspection_fee_required_date = date('d-M-Y', strtotime($data_log['wa_is_inspection_fee_required_at']));
}
$data_log['wa_is_inspection_fee_required_user'] = $wa_is_inspection_fee_required_user;
$data_log['wa_is_inspection_fee_required_date'] = $wa_is_inspection_fee_required_date;

$wa_is_inspection_fee_required_accepted_date = '';
if($data_log['wa_is_inspection_fee_required_accepted']) {
    $wa_is_inspection_fee_required_accepted_date = date('d-M-Y', strtotime($data_log['wa_is_inspection_fee_required_accepted_at']));
}
$data_log['wa_is_inspection_fee_required_accepted_date'] = $wa_is_inspection_fee_required_accepted_date;


$fwViewData['data_log'] = $data_log;

$sq1_bsn = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, bus_customers.bcust_fname, bus_customers.bcust_lname, bus_customers.bcust_misc_moble from business_sellers 
Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
Inner Join business ON business_sellers.bs_business_id = business.bsn_id where business.bsn_name Like '%" . $data_log['wa_project'] . "%'";
$data_bsn = $fwDb->queryOne($sq1_bsn);
$fwViewData['bs_business_id'] = $data_bsn['bs_business_id'];
$fwViewData['bs_customers_id'] = $data_bsn['bs_customers_id'];

$projectLink = '<a target="_blank" href="' . BASE_URL . 'business.detail/bsn_id/' . $data_bsn['bs_business_id'] . '">' . $data_log['wa_project'] . '</a>';
$fwViewData['projectLink'] = $projectLink;

$contact_info = $data_bsn['bcust_fname'] . "&nbsp;" . $data_bsn['bcust_lname'] . "<br />" . $data_bsn['bcust_misc_moble'];
$fwViewData['contact_info'] = $contact_info;

$sql_walkthrough_date = "Select business_tasks.bt_completed_date from business_tasks where business_tasks.bt_bsn_id = " . $data_bsn['bs_business_id'] . " And business_tasks.bt_task_id = 254 ";
$data_walkthrough_date = $fwDb->queryOne($sql_walkthrough_date);
if ($data_walkthrough_date['bt_completed_date'] == "0000-00-00 00:00:00" || empty($data_walkthrough_date['bt_completed_date'])) {
	$fwViewData['walkthrough_date'] = '';
} else {
	$fwViewData['walkthrough_date'] = $data_walkthrough_date['bt_completed_date'];
}

$sql_491 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 491";
$data_491 = $fwDb->queryOne($sql_491);
$fwViewData['file_491'] = $data_491['doc_file_name'];
$fwViewData['doc_name_491'] = $data_491['admin_doc_name'];

$sql_65 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 65";
$data_65 = $fwDb->queryOne($sql_65);
$fwViewData['file_65'] = $data_65['doc_file_name'];
$fwViewData['doc_name_65'] = $data_65['admin_doc_name'];

$sql_440 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 440";
$data_440 = $fwDb->queryOne($sql_440);
$fwViewData['file_440'] = $data_440['doc_file_name'];
$fwViewData['doc_name_440'] = $data_440['admin_doc_name'];

$sql_142 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 142";
$data_142 = $fwDb->queryOne($sql_142);
$fwViewData['file_142'] = $data_142['doc_file_name'];
$fwViewData['doc_name_142'] = $data_142['admin_doc_name'];

$sql_615 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 615";
$data_615 = $fwDb->queryOne($sql_615);
$fwViewData['file_615'] = $data_615['doc_file_name'];
$fwViewData['doc_name_615'] = $data_615['admin_doc_name'];

$sql_527 = "SELECT dcl.doc_name_id, dcl.doc_file_name, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 527";
$data_527 = $fwDb->queryOne($sql_527);
$fwViewData['file_527'] = $data_527['doc_file_name'];
$fwViewData['doc_name_527'] = $data_527['admin_doc_name'];

$sql_778 = "SELECT dcl.doc_name_id, dcl.doc_live_link, dcl.doc_date_uploaded, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 778";
$data_778 = $fwDb->queryOne($sql_778);
$fwViewData['file_778'] = $data_778['doc_live_link'];
$fwViewData['date_uploaded_778'] = $data_778['doc_date_uploaded'];

$sql_779 = "SELECT dcl.doc_name_id, dcl.doc_file_name, dcl.doc_date_uploaded, adcl.admin_doc_name FROM `document_check_list` as dcl left join admin_document_check_list as adcl on adcl.admin_doc_id = dcl.doc_name_id where dcl.doc_bsn_id = ". $data_bsn['bs_business_id'] ." and dcl.doc_name_id = 779";
$data_779 = $fwDb->queryOne($sql_779);
$fwViewData['file_779'] = $data_779['doc_file_name'];
$fwViewData['date_uploaded_779'] = $data_779['doc_date_uploaded'];

$sqlpr = "Select * from warranty_log_priority";
$fwViewData['prdetail'] = $fwDb->query($sqlpr);

$thisTable = new Fw_Db_Table("warranty_log_type");
$fwViewData['typedetail'] = $thisTable->getAllRows();

$areaTable = new Fw_Db_Table("warranty_log_cgfb");
$fwViewData['cgfbdetail'] = $areaTable->getAllRows();

$whynotTable = new Fw_Db_Table("warranty_log_why_not");
$fwViewData['whynotdetail'] = $whynotTable->getAllRows();

$thisLT = new Fw_Db_Table("warranty_log_liability");
$fwViewData['liadetail'] = $thisLT->getAllRows();

$sqlcc = "select count(*) as tot_chk from warranty_checklist_admin";
$datacc = $fwDb->queryOne($sqlcc);
$fwViewData['tot_chk'] =  $datacc['tot_chk'];

$sql_totcd = "Select count(*) as tot_cd from warranty_checklist where ch_wa_id = $id and ch_status IN ('Complete')";
$cd_data = $fwDb->queryOne($sql_totcd);
$fwViewData['tot_cd'] = $cd_data['tot_cd'];

$sql_su_update = "select count(*) as tot from warranty_supplier_update where ws_wa_id = $id";
$cudata = $fwDb->queryOne($sql_su_update);
if ($cudata['tot'] > 0) {
	$fwViewData['supplier_upadate'] = true;
}

$sql_ud = "Select max(ws_date) as update_date from warranty_supplier_update where ws_wa_id = $id";
$udData = $fwDb->queryOne($sql_ud);
$fwViewData['update_date'] = $udData['update_date'];

$fwViewData['dayscount'] = '';
$ccdate = $data_log['wa_date'];
if (!empty($ccdate)) {
	$Statusdate = changedate_y_m_d($ccdate);
	$curdate_y_m_d = date('Y-m-d');

	$date1 = new DateTime($curdate_y_m_d);
	$date2 = new DateTime($Statusdate);

	$interval = $date1->diff($date2);
	$dayscount = $interval->days - 1;

	$fwViewData['dayscount'] = daysDifference($curdate_y_m_d, $Statusdate);
	//$fwViewData['dayscount'] = $dayscount;
}

$amount_owed = 0;
if ($data_bsn['bs_business_id']) {
	$bsn_id = $data_bsn['bs_business_id'];

	$sqlSum = "SELECT SUM( CASE WHEN TRIM(ppd_hia_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_hia_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_hia, SUM( CASE WHEN TRIM(ppd_value) <> '' THEN CAST(REPLACE(REPLACE(ppd_value, '$', ''), ',', '') AS DECIMAL(10,2)) ELSE 0 END ) AS total_ppd FROM progress_payment_detail WHERE ppd_bsn_id =" . $bsn_id;
	$sumRow = $fwDb->queryOne($sqlSum);

	$total_hia = isset($sumRow['total_hia']) ? (float)$sumRow['total_hia'] : 0;
	$total_ppd = isset($sumRow['total_ppd']) ? (float)$sumRow['total_ppd'] : 0;
	$amount_owed = $total_hia - ($total_ppd);
}
$fwViewData['bsn_id'] = $data_bsn['bs_business_id'];
$fwViewData['amount_owed'] = ($amount_owed >= 0 ? '$' : '-$') . number_format(abs($amount_owed), 2);


$sql_nt = "Select max(STR_TO_DATE(wn_date, '%d-%m-%Y' )) as notes_date from warranty_log_notes where wn_wa_id = $id";
$ntdata = $fwDb->queryOne($sql_nt);

$sql_nt2 = "Select max(ws_date) as notes_date2 from warranty_supplier_update where ws_wa_id = $id";
$ntdata2 = $fwDb->queryOne($sql_nt2);

$lnsql_1 = "select wn_notes from warranty_log_notes where wn_date = '" . changedate_d_m_Y($ntdata['notes_date']) . "' and wn_wa_id = $id";
$nd_1 = $fwDb->queryOne($lnsql_1);

$sql_comch2 = "Select max(ws_date) as ws_date from warranty_supplier_update where ws_wa_id = $id";
$chkcomp2 = $fwDb->queryOne($sql_comch2);

$lnsql_2 = "select ws_update_text from warranty_supplier_update where ws_date = '" . $chkcomp2['ws_date'] . "' and ws_wa_id = $id";
$nd_2 = $fwDb->queryOne($lnsql_2);

if (strtotime($ntdata['notes_date']) > strtotime($ntdata2['notes_date2'])) {
	$ndate =  $ntdata['notes_date'];
	$fwViewData['notes_date'] = changedate_d_m_y($ndate);
	$fwViewData['notes_text'] = $nd_1['wn_notes'];
} else {
	$ndate =  $ntdata2['notes_date2'];
	$fwViewData['notes_date'] = changedate_d_m_y($ndate);
	$fwViewData['notes_text'] = $nd_2['ws_update_text'];
}

$sql100 = "select sa_co_id from supplier_warranty where sa_wa_id = $id";
$data100 = $fwDb->query($sql100);

$red = 0;
foreach ($data100 as $k10 => $v10) {
	$sql101 = "Select se_co_id from supplier_email_warranty where se_co_id = " . $v10['sa_co_id'] . " and se_wa_id = $id";
	$found = $fwDb->query($sql101);
	if (empty($found)) {
		$red = 1;
	}
}
$fwViewData['wa_selected'] = $red;


$sql_11 = "Select  DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) as diff_wn from warranty_log_notes where wn_wa_id = $id and DATEDIFF(STR_TO_date(wn_due_date, '%d-%m-%Y'), CURDATE()) < 0 and wn_resolved = 0 ";
$data11 = $fwDb->query($sql_11);

$sql_22 = "Select DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) as diff_ws from warranty_supplier_update where ws_wa_id = $id and DATEDIFF(STR_TO_date(ws_due_date, '%d-%m-%Y'), CURDATE()) < 0 and ws_resolved = 0 ";
$data22 = $fwDb->query($sql_22);

if (!empty($data11) || !empty($data22)) {
	$fwViewData['cell_red'] = 1;
} else {
	$fwViewData['cell_red'] = 0;
}

$sqlenq = "Select we_answer from warranty_enquiry where we_wa_id = $id";
$ansdata = $fwDb->query($sqlenq);
$fwViewData['enquiry_pen'] = 0;
foreach ($ansdata as $k4 => $v4) {
	if (strlen(trim($v4['we_answer'])) == 0 || $v4['we_answer'] == NULL) {
		$fwViewData['enquiry_pen'] = 1;
		break;
	}
}

//Count Unanswered
$query_unanswered = "SELECT COUNT(*) AS count_unanswered FROM warranty_enquiry WHERE we_wa_id = $id AND ( we_answer IS NULL OR TRIM(we_answer) = '' )";
$result_unanswered = $fwDb->queryOne($query_unanswered);
$fwViewData['count_unanswered'] = $result_unanswered['count_unanswered'];

$query = 'SELECT COUNT(*) AS total FROM warranty_log WHERE wa_project = "' . $data_log['wa_project'] . '" AND wa_status IN ("Open", "Pending")';
$result = $fwDb->queryOne($query);
$fwViewData['total_open_logs'] = $result['total'] ?? 0;

//echo "<pre>"; print_r($data_log); exit();
//echo "<pre>"; print_r($data_bsn); exit();

$query = 'SELECT * FROM `warranty_log_workmanship_defect` ORDER BY wlwd_name ASC';
$result = $fwDb->query($query);
$fwViewData['warranty_log_workmanship_defect'] = $result;

$query = 'SELECT * FROM procedure_panel_warranty WHERE pr_id = 30';
$result = $fwDb->queryOne($query);
$fwViewData['zoho_link'] = isset($result['pr_link']) ? $result['pr_link'] : '';

$sql_review = "Select bsn_google_review from business where bsn_id = ". $data_bsn['bs_business_id'];
$result_review = $fwDb->queryOne($sql_review);
$fwViewData['google_review'] = $result_review['bsn_google_review'];
