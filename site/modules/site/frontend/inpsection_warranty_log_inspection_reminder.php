<?php

/**
 * the client will receive a weekly reminder email sent one day prior to the confirmed inspection date to notify them about the upcoming inspection
 * Upcoming Inspection Reminder Email
 * 
 */

require_once LIB_DIR . 'EmailClass.php';

$query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, WL.wa_is_inspection_fee_required_scheduled, WL.wa_is_inspection_fee_required_scheduled_date, WL.wa_is_inspection_fee_required_scheduled_actual_start_time, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble, DATEDIFF(WL.wa_is_inspection_fee_required_scheduled_date, "' . date('Y-m-d') . '") AS day_diff FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project LEFT JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id LEFT JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_is_inspection_fee_required = 1 AND WL.wa_status != "Closed" AND WL.wa_is_inspection_fee_required_accepted = 1 AND WL.wa_is_inspection_fee_required_scheduled > 0 AND WL.wa_is_inspection_fee_required_inspection_completed = 0 GROUP BY WL.wa_project HAVING day_diff = 1;';
$records = $fwDb->query($query);
// db($records); die();
foreach ($records as $row) {
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];
    echo $row['wa_id'] . ' | ' . $customerName . ' | ' . $customerEmail . ' | ' . $customerMobile . '<br>';

    if (!empty($customerEmail)) {
        $inspectionLink = 'https://warrantyreport.com.au/project/warranty_issue/' . $row['bsn_id'] . '/customer-action';

        $html = '';
        $html .= '<p>Dear ' . $customerName . ',</p>';
        $html .= '<p>This is a friendly reminder that your <strong>inspection is scheduled for tomorrow</strong>.</p>';
        $html .= '<p><strong>Inspection Date:</strong> ' . date('l d F Y', strtotime($row['wa_is_inspection_fee_required_scheduled_date'])) . '<br><strong>Inspection Time:</strong> ' . date('h:i A', strtotime($row['wa_is_inspection_fee_required_scheduled_actual_start_time'])) . '<br><strong>Inspection Location:</strong> ' . $row['wa_project'] . '</p>';
        $html .= '<p>Please ensure that the property is accessible at the scheduled time so the inspection can be completed without delay.</p>';
        $html .= '<p>If you have any questions or need assistance, feel free to contact us.</p>';
        $html .= '<p>Thank you, and we look forward to completing your inspection.</p>';
        $html .= '<p>Best regards,<br>CGFB Warranty Team</p>';

        $emailObj = new EmailClass;
        $emailObj->subject = 'Upcoming Inspection Reminder Email';
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