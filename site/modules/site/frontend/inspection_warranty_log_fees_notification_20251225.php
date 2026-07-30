<?php

require_once LIB_DIR . 'EmailClass.php';
require_once(MODULES_DIR . 'inspection_warranty_log/frontend/ServiceClass.php');

$serviceObj = new ServiceClass;

$query = $serviceObj->getInspectionFeeNotAcceptedRecords();
// db($query);
$result = $fwDb->query($query);

$records = [];
foreach($result as $row) {
    if(!isset($records[$row['bsn_id']])) {
        $records[$row['bsn_id']] = [];
    }
    $records[$row['bsn_id']][] = $row;
}

$emailErrorLog = $msgErrorLog = [];
foreach ($records as $bsn_id => $logs) {
    $row = $logs[0];
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];
    echo $customerName . ' | ' . $customerEmail . ' | ' . $customerMobile . '<br>';
    $subject = '';
    $html = '';
    $html .= '<p><strong>Hi ' . $customerName . '</strong>,</p>';
    $html .= '<p>You have <strong>outstanding action items</strong> in your Warranty Portal that must be completed before we can progress your warranty request.</p>';
    $html .= '<p>Below is a summary of your current action items:</p>';
    $html .= '<p><strong>Your Pending Actions</strong></p>';
    $html .= '<table>';
        $html .= '<thead>';
            $html .= '<tr>';
                $html .= '<td>Log Number</td>';
                $html .= '<td>Item / Issue</td>';
                $html .= '<td>Link</td>';
            $html .= '</tr>';            
        $html .= '</thead>';
        $html .= '<tbody>';
    foreach($logs as $log) {
        echo $log['wa_id'] . ' | ' . $log['wa_project'] . ' | ' . $log['wa_is_inspection_fee_required'] . ' | ' . $log['wa_is_inspection_fee_required_accepted'] . '<br>';
            $html .= '<tr>';
                $html .= '<td>' . $log['wa_id'] . '</td>';
                $html .= '<td>' . $log['wa_problem'] . '</td>';
                $html .= '<td>Link</td>';
            $html .= '</tr>';   
    }
    echo '<hr>';
        $html .= '</tbody>';
    $html .= '</table>';    
    $html .= '<p>Complete your actions here:</p>';
    $html .= '<p><a href="https://warrantyreport.com.au" target="_blank">Log In</a> to Your Warranty Portal</p>';
    $html .= '<p><strong>Why you need to complete these items</strong></p>';
    $html .= '<p>Completing these actions allows us to:</p>';
    $html .= '<ul>';
        $html .= '<li>Confirm inspection times</li>';
        $html .= '<li>Review your warranty request</li>';
        $html .= '<li>Progress your resolution quickly</li>';
    $html .= '</ul>';
    $html .= '<p>The <strong>$75 inspection fee</strong> only applies if the issue is <strong>not</strong> our responsibility under warranty. Otherwise, there is <strong>no cost</strong>.</p>';
    $html .= '<p>If you believe you\'ve already completed these actions, you can ignore this email. Reminders stop automatically once everything is completed.</p>';
    $html .= '<p>Kind regards,<br><strong>CGFB Warranty Team</strong></p>';
    
    if(!empty($customerEmail)) {
        // db($html);
        $emailObj = new EmailClass;
        $emailObj->subject = $subject;
        $emailObj->message = $html;
        $emailObj->addFrom('warranty@cgfb.com.au', 'WARRANTY TEAM');
        // $emailObj->addTo($row['bcust_misc_email1'], $customerName);
        $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        $emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
        $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
        $emailObj->attachments = [];
        $response = $emailObj->sendEmail();
        $emailObj->logSendEmail($response, [
            'module_name' => 'inspection_warranty_log.home',
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
    }
    if (!empty($customerMobile)) {
        $username = "manojsoniephp";
        $password = "jaimatadi108";
        $message = 'Your warranty request can\'t progress until you complete your action items. Please log in to agree to the inspection or set a time. <a href="https://warrantyreport.com.au">Warranty Report</a>';
        $type     = "1-way";
        $senderid = "CGFB";
        $to = $customerMobile;
        $url = "http://api.directsms.com.au/s3/http/send_message?" .
            "username=" . $username . "&" .
            "password=" . $password . "&" .
            "message="  . urlencode($message) . "&" .
            "type="     . $type . "&" .
            "senderid=" . urlencode($senderid) . "&" .
            "to="       . $to;

        // $output = file($url);
        // $result = explode(":", $output[0]);
        // if ($result[0] != "id") {
        //     $msgErrorLog[] = [
        //         'to' => $to,
        //         'subject' => $emailObj->subject,
        //         'error' => $result[1] ?? 'SMS Error',
        //     ];
        // }
    }
}

if (empty($emailErrorLog)) {
    db('No Email Error');
} else {
    db($emailErrorLog);
}
if (empty($msgErrorLog)) {
    db('No SMS Error');
} else {
    db($msgErrorLog);
}

exit;
