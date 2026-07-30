<?php
$fwMainView = 'file:' . getcwd() . '/user_logon_home.tpl';

$bsn_id = $fwRequest->getParam('bsn_id', 0);

$query = 'SELECT BC.bcust_id, BS.bs_id, B.bsn_id, B.bsn_status, BS.bs_planning_last_login_date, BS.bs_warranty_last_login_date, BS.bs_calendar_last_login_date, BS.bs_alert_last_login_date, BC.bcust_misc_email1, BC.bcust_misc_moble, BS.bs_planning_login_flag, BS.bs_warranty_login_flag, BS.bs_calendar_login_flag, BS.bs_alert_login_flag, BS.bs_comments FROM business B INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers BC ON BC.bcust_id = BS.bs_customers_id WHERE B.bsn_id = ' . $bsn_id;
$result = $fwDb->queryOne($query);

$bs_comments = $result['bs_comments'] ?? '';
$cgdb_login = explode(':', $bs_comments);
$cgdb_username = '';
$cgdb_password = '';
if(!empty($cgdb_login)) {
    if(isset($cgdb_login[1])) {
        $cgdb_username = $cgdb_login[1];
        $cgdb_username = str_replace(' ', '', $cgdb_username);
        $cgdb_username = str_ireplace("Password", "", $cgdb_username);
        $cgdb_username = trim($cgdb_username);
    }
    $cgdb_password = trim($cgdb_login[2] ?? '');
}

$fwViewData['bcust_id'] = $result['bcust_id'] ?? 0;
$fwViewData['bs_id'] = $result['bs_id'] ?? 0;
$fwViewData['bs_id'] = $result['bs_id'] ?? 0;
$fwViewData['cgdb_username'] = $cgdb_username;
$fwViewData['cgdb_password'] = $cgdb_password;
$fwViewData['bs_planning_login_flag'] = $result['bs_planning_login_flag'] ?? 0;
$fwViewData['bs_warranty_login_flag'] = $result['bs_warranty_login_flag'] ?? 0;
$fwViewData['bs_calendar_login_flag'] = $result['bs_calendar_login_flag'] ?? 0;
$fwViewData['bs_alert_login_flag'] = $result['bs_alert_login_flag'] ?? 0;
$fwViewData['sister_username'] = trim($result['bcust_misc_email1'] ?? '');
$fwViewData['sister_password'] = trim($result['bcust_misc_moble'] ?? '');
$fwViewData['planning_latest_activity'] = (isset($result['bs_planning_last_login_date']) && strtotime($result['bs_planning_last_login_date']) > 0) ? date('d-M-Y H:i:s A', strtotime($result['bs_planning_last_login_date'])) : '';
$fwViewData['warranty_latest_activity'] = (isset($result['bs_warranty_last_login_date']) && strtotime($result['bs_warranty_last_login_date']) > 0) ? date('d-M-Y H:i:s A', strtotime($result['bs_warranty_last_login_date'])) : '';
$fwViewData['calendar_latest_activity'] = (isset($result['bs_calendar_last_login_date']) && strtotime($result['bs_calendar_last_login_date']) > 0) ? date('d-M-Y H:i:s A', strtotime($result['bs_calendar_last_login_date'])) : '';
$fwViewData['alert_latest_activity'] = (isset($result['bs_alert_last_login_date']) && strtotime($result['bs_alert_last_login_date']) > 0) ? date('d-M-Y H:i:s A', strtotime($result['bs_alert_last_login_date'])) : '';

// $fwViewData['planning_link'] = (stripos($result['bsn_status'], '|1|') !== false) ? '/sales_phase_logon.home' : '/design_phase_customer_report.home';
$fwViewData['planning_link'] = '/business.user_logon_planning_control/bsn_id/' . $result['bsn_id'];