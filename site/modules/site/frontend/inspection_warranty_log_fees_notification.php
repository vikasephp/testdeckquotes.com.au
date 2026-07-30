<?php

/**
 * will continue to receive weekly reminders until they take action in the Customer Action Required section.
 * Once $75 And complimentary button was clicked
 * 
 */

require_once LIB_DIR . 'EmailClass.php';
require_once(MODULES_DIR . 'warranty_log/frontend/ServiceClass.php');
$serviceClass = new ServiceClass;

$query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, WL.wa_is_inspection_fee_required_cancelled, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project INNER JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id INNER JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_is_inspection_fee_required = 1 AND WL.wa_status != "Closed" AND WL.wa_is_inspection_fee_required_accepted = 0 AND WL.wa_is_inspection_fee_required_cancelled = 0';
$records = $fwDb->query($query);

foreach ($records as $row) {
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];
    echo $row['wa_id'] . ' | ' . $customerName . ' | ' . $customerEmail . ' | ' . $customerMobile . '<br>';
    
    $serviceClass->sendImmediateEmailAndSms($row, $row);
}

exit;
