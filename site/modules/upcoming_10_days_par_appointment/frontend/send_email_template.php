<?php
$fwMainView = 'file:' . getcwd() . '/send_email_template.tpl';

$email_sql = "SELECT business_sellers.bs_business_id, business_sellers.bs_customers_id, business_sellers.bs_paqr_alertoption, business_sellers.bs_paqr_alertoption_at, business_sellers.bs_paqr_alertoption_by, bus_customers.bcust_fname, bus_customers.bcust_lname, business.bsn_id, business.bsn_name, business.bsn_sub_status, business.bsn_status, business.bsn_address, business.bsn_type, bus_customers.bcust_id, bus_customers.bcust_user_id, business_sellers.bs_sales_phase_hide, business.bsn_planning_last_login_date, business.bsn_sales_next_meeting_date, business.bsn_sales_next_meeting_time, business.bsn_sales_next_meeting_location, business.bsn_sales_next_meeting_zoom_link, business.bsn_sales_next_meeting_zoom_id, business.bsn_sales_next_meeting_where, business.bsn_splat_id FROM business_sellers INNER JOIN bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id  INNER JOIN business ON business_sellers.bs_business_id = business.bsn_id WHERE business_sellers.bs_sales_phase_hide = 0 AND business.bsn_status LIKE '%|1|%' AND business.bsn_sales_next_meeting_date IS NOT NULL AND business.bsn_sales_next_meeting_date BETWEEN CURDATE() + INTERVAL 1 DAY AND CURDATE() + INTERVAL 10 DAY ORDER BY business.bsn_sales_next_meeting_date ASC, STR_TO_DATE(business.bsn_sales_next_meeting_time, '%h:%i %p') ASC";

if ($email_sql) {
	$email_res_data = $fwDb->query($email_sql);
	//echo "<pre>"; print_r($email_data); exit("Checking");
	//$fwViewData['email_data'] = $email_res_data;
	
	foreach ($email_res_data as $list):
		$listsnew[] = $list;
	endforeach;
}

if (!empty($email_res_data)) {
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

$fwViewData['email_data'] = $listsnew;

//Appointment Type
$sqlAppointmentType = "Select * from sales_phase_logon_appointment_type";
$fwViewData['appointmentType'] = $fwDb->query($sqlAppointmentType);

//Alert Data
$sqlAlert = "Select * from paqr_alert_admin";
$fwViewData['alertdata'] = $fwDb->query($sqlAlert);

//Get Dates Current and After 10 days
$sqlDate = "SELECT CURDATE() AS today, CURDATE() + INTERVAL 1 DAY AS start_date, CURDATE() + INTERVAL 10 DAY AS end_date";
$resDate = $fwDb->queryOne($sqlDate);
$fwViewData['curDate'] = $resDate['start_date'];
$fwViewData['endDate'] = $resDate['end_date'];