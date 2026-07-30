<?php
$fwMainView = 'file:' . getcwd() . '/view_log_detail.tpl';
$table = new Fw_Db_Table('warranty_log');

$id = $fwRequest->getParam('wa_id', '');

$sql_log = "Select * from warranty_log where wa_id = $id";
$data_log = $fwDb->queryOne($sql_log);

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

	//$fwViewData['dayscount'] = daysDifference($curdate_y_m_d, $Statusdate);
	$fwViewData['dayscount'] = $dayscount;
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

$query = 'SELECT COUNT(*) AS total FROM warranty_log WHERE wa_project = "' . $data_log['wa_project'] . '" AND wa_status IN ("Open", "Pending")';
$result = $fwDb->queryOne($query);
$fwViewData['total_open_logs'] = $result['total'] ?? 0;

//echo "<pre>"; print_r($data_log); exit();
//echo "<pre>"; print_r($data_bsn); exit();