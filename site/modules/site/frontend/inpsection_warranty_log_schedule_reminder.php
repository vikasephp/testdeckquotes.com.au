<?php

/**
 * if the client has not yet confirmed an inspection time but has agreed on the Complimentary or $75 , they will continue to receive weekly reminder emails to schedule the inspection until the client scheduled the inspection.
 * Weekly Reminder Email – Inspection Not Yet Scheduled
 * 
 */

require_once LIB_DIR . 'EmailClass.php';

$query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, WL.wa_is_inspection_fee_required_scheduled, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project LEFT JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id LEFT JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_is_inspection_fee_required = 1 AND WL.wa_status != "Closed" AND WL.wa_is_inspection_fee_required_accepted = 1 AND WL.wa_is_inspection_fee_required_scheduled = 0 GROUP BY WL.wa_id';
$records = $fwDb->query($query);
// db($records);
foreach ($records as $row) {
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];
    echo $row['wa_id'] . ' | ' . $customerName . ' | ' . $customerEmail . ' | ' . $customerMobile . '<br>';

    if (!empty($customerEmail)) {
        $inspectionLink = 'https://warrantyreport.com.au/project/warranty_issue/' . $row['bsn_id'] . '/customer-action';

        $html = '';
        $html .= '<p>Dear ' . $customerName . ',</p>';
        $html .= '<p>We hope you are doing well.</p>';
        $html .= '<p>This is a friendly reminder to <strong>schedule your inspection appointment</strong>, as it has not yet been confirmed. Scheduling the inspection will allow us to proceed with the next steps and complete your request.</p>';
        $html .= '<p>Please use the link below to select a convenient inspection time:<br><a href="' . $inspectionLink . '" target="_blank">Schedule Inspection Link</a></p>';
        $html .= '<p>If you have already scheduled your inspection, please disregard this message. Otherwise, we kindly ask that you complete this step at your earliest convenience.</p>';
        $html .= '<p>If you need assistance, feel free to reach out - we\'re happy to help.</p>';
        $html .= '<p>Kind regards,<br>CGFB Warranty Team</p>';

        $emailObj = new EmailClass;
        $emailObj->subject = 'Weekly Reminder Email - Inspection Not Yet Scheduled';
        $emailObj->message = $html;
        $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
        // $emailObj->addTo($customerEmail, $customerName);
        $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        $emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
        $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
        $emailObj->attachments = [];
        $response = $emailObj->sendEmail();
        $emailObj->logSendEmail($response, [
            'module_name' => 'site.inpsection_warranty_log_schedule_reminder',
            'table_name' => 'warranty_log',
            'column_name' => 'wa_id',
            'column_id' => $row['wa_id'],
        ]);
        if (!$response['success']) {
            $emailErrorLog[] = [
                'to' => $emailObj->to,
                'subject' => $emailObj->subject,
                'error' => $response['message']
            ];
        }
        
        // exit;
        // db($emailObj);
    }
}

exit;
