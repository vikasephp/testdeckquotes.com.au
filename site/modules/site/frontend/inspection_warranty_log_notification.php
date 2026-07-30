<?php

/**
 * Send client a notification email when there is a pending customer action in warranty report website
 */

require_once LIB_DIR . 'EmailClass.php';
require_once LIB_DIR . 'SmsClass.php';

$query = 'SELECT * FROM procedure_panel_warranty WHERE pr_id = 30';
$result = $fwDb->queryOne($query);
$customerWarrantySignedZohoLink = $result['pr_link'];

$query = 'SELECT WL.wa_id, WL.wa_project, WL.wa_problem, WL.wa_is_inspection_fee_required, WL.wa_is_inspection_fee_required_accepted, WL.wa_is_inspection_fee_required_scheduled, WL.wa_is_inspection_fee_required_cancelled, WL.wa_is_inspection_fee_required_inspection_completed, WL.wa_inspection_proposed_fees, WL.wa_is_inspection_fee_required_scheduled_date, WL.wa_is_inspection_fee_required_scheduled_actual_start_time, WL.wa_is_inspection_fee_required_scheduled_actual_end_time, WL.wa_is_inspection_fee_required_scheduled_day, B.bsn_name, B.bsn_id, BC.bcust_fname, BC.bcust_lname, BC.bcust_misc_email1, BC.bcust_misc_moble, (SELECT doc_file_name FROM document_check_list WHERE doc_name_id = 779 AND doc_bsn_id = B.bsn_id LIMIT 1) AS doc_file_name FROM warranty_log AS WL LEFT JOIN business AS B ON B.bsn_name = WL.wa_project LEFT JOIN business_sellers AS BS ON BS.bs_business_id = B.bsn_id LEFT JOIN bus_customers AS BC ON BC.bcust_id = BS.bs_customers_id WHERE WL.wa_status != "Closed" AND WL.wa_is_inspection_fee_required = 1 AND WL.wa_is_inspection_fee_required_cancelled = 0 AND WL.wa_is_inspection_fee_required_inspection_completed = 0 GROUP BY WL.wa_id;';
$result = $fwDb->query($query);
// db($query);

$records = [];
foreach ($result as $row) {
    if (!isset($records[$row['wa_project']])) {
        $records[$row['wa_project']] = [];
    }
    $records[$row['wa_project']][] = $row;
}

$wa_id_array = [];
foreach ($result as $row) {
    $wa_id_array[] = $row['wa_id'];
}
// db($wa_id_array);

$query = 'SELECT * FROM warranty_log_inspection_reschedules WHERE wlir_wa_id IN (' . implode(',', $wa_id_array) . ') AND wlir_status = 0';
$result = $fwDb->query($query);
$warranty_log_inspection_reschedules = [];
foreach($result as $row) {
    $warranty_log_inspection_reschedules[$row['wlir_wa_id']] = $row;
}
// db($warranty_log_inspection_reschedules);

$emailErrorLog = [];
$smsErrorLog = [];
$portalLoginLink = 'https://warrantyreport.com.au';
foreach ($records as $projectName => $rows) {
    $pendingActionCount = 0;
    $row = $rows[0];
    $customerName = $row['bcust_fname'] . ' ' . $row['bcust_lname'];
    $customerEmail = $row['bcust_misc_email1'];
    $customerMobile = $row['bcust_misc_moble'];
    $docFileName = $row['doc_file_name'];
    // echo $row['wa_id'] . ' | ' . $customerName . ' | ' . $customerEmail . ' | ' . $customerMobile . '<br>';

    $emailFlag = false;
    $html = '';
    if (!empty($customerEmail)) {
        $html .= '<p>Dear ' . $customerName . ',</p>';
        $html .= '<p>We hope you are doing well.</p>';
        $html .= '<p>This email is to inform you that there are one or more items currently pending in the <strong>Customer Action Required</strong> section of your warranty account. These items require your attention so we can continue progressing without delays.</p>';
        // $html .= '<hr>';
        $html .= '<h3><strong>Pending Actions Requiring Your Attention</strong></h3>';
        $html .= '<p>Please review and complete the following actions as applicable:</p>';
        if ($docFileName == '' || $docFileName == null) {
            $pendingActionCount++;
            $emailFlag = true;
            $html .= '<p><strong>&bull; Sign the Lifetime Workmanship Guarantee</strong></p>';
            // $html .= '<p>This is a friendly reminder that we have not yet received the signed <strong>Workmanship Guarantee Agreement</strong> for your project. To ensure everything proceeds smoothly and to provide you with full coverage under our workmanship guarantee, we kindly request that you review and sign the agreement at your earliest convenience.</p>';
            // $html .= '<p>You can access and sign the agreement using the link below:<br><a href="' . $customerWarrantySignedZohoLink . '" target="_blank">Agreement Link</a></p>';
            // $html .= '<p>If you have already signed the agreement, please disregard this message. Otherwise, completing this step will help us finalize our records and continue providing you with the best possible service.</p>';
        }
        $pendingInspectionsComplimentary = [];
        $pendingInspectionsPaid = [];
        $acceptedInspections = [];
        $scheduledInspections = [];
        foreach ($rows as $row) {
            if ($row['wa_is_inspection_fee_required'] == 1) {
                if ($row['wa_is_inspection_fee_required_accepted'] == 0 && $row['wa_is_inspection_fee_required_scheduled'] == 0 && $row['wa_is_inspection_fee_required_cancelled'] == 0 && $row['wa_is_inspection_fee_required_inspection_completed'] == 0) {
                    if ($row['wa_inspection_proposed_fees'] == 0) {
                        $pendingInspectionsComplimentary[] = $row;
                    } else {
                        $pendingInspectionsPaid[] = $row;
                    }
                } else if ($row['wa_is_inspection_fee_required_accepted'] == 1 && $row['wa_is_inspection_fee_required_scheduled'] == 0 && $row['wa_is_inspection_fee_required_cancelled'] == 0 && $row['wa_is_inspection_fee_required_inspection_completed'] == 0) {
                    $acceptedInspections[] = $row;
                } else if ($row['wa_is_inspection_fee_required_accepted'] == 1 && $row['wa_is_inspection_fee_required_scheduled'] > 0 && $row['wa_is_inspection_fee_required_cancelled'] == 0 && $row['wa_is_inspection_fee_required_inspection_completed'] == 0) {
                    $scheduledInspections[] = $row;
                }
            }
        }

        if (!empty($pendingInspectionsComplimentary)) {
            $pendingActionCount += count($pendingInspectionsComplimentary);
            $emailFlag = true;
            $html .= '<p><strong>&bull; Confirm acceptance of the Complimentary Inspection</strong></p>';
            // foreach ($pendingInspectionsComplimentary as $row) {
            //     $html .= ('<p>Log #' . $row['wa_id'] . ' - ' . $row['wa_problem'] . '</p>');
            // }
        }

        if (!empty($pendingInspectionsPaid)) {
            $pendingActionCount += count($pendingInspectionsPaid);
            $emailFlag = true;
            $html .= '<p><strong>&bull; Confirm acceptance of the $75 Inspection</strong></p>';
            // foreach ($pendingInspectionsPaid as $row) {
            //     $html .= ('<p>Log #' . $row['wa_id'] . ' - ' . $row['wa_problem'] . '</p>');
            // }
        }

        if (!empty($acceptedInspections)) {
            $pendingActionCount += count($acceptedInspections);
            $emailFlag = true;
            $html .= '<p><strong>&bull; Schedule your inspection</strong></p>';
            // foreach ($acceptedInspections as $row) {
            //     $html .= ('<p>Log #' . $row['wa_id'] . ' - ' . $row['wa_problem'] . '</p>');
            // }
        }

        if (!empty($scheduledInspections)) {
            $pendingActionCount += count($scheduledInspections);
            $emailFlag = true;
            $html .= '<p><strong>&bull; Upcoming Inspection</strong></p>';
            usort($scheduledInspections, function ($a, $b) {
                // Primary sort: scheduled_date
                $dateCmp = strcmp($a['wa_is_inspection_fee_required_scheduled_date'], $b['wa_is_inspection_fee_required_scheduled_date']);
                if ($dateCmp !== 0) return $dateCmp;

                // Secondary sort: actual_start_time
                return strcmp($a['wa_is_inspection_fee_required_scheduled_actual_start_time'], $b['wa_is_inspection_fee_required_scheduled_actual_start_time']);
            });

            $dateWiseLogs = [];
            foreach ($scheduledInspections as $row) {
                $key = sprintf(
                    '%s|%s|%s',
                    $row['wa_is_inspection_fee_required_scheduled_date'],
                    $row['wa_is_inspection_fee_required_scheduled_actual_start_time'],
                    $row['wa_is_inspection_fee_required_scheduled_actual_end_time']
                );
                if (!isset($dateWiseLogs[$key])) {
                    $dateWiseLogs[$key] = [];
                }
                $dateWiseLogs[$key][] = $row;
            }
            // $upcomingInspectionCount = count($dateWiseLogs);
            // $counter = 1;
            foreach ($dateWiseLogs as $scheduleDateTime => $logs) {
                $html .= ('<p style="margin-left: 20px;"><strong>&bull; Date: </strong>' . date('d F Y', strtotime($logs[0]['wa_is_inspection_fee_required_scheduled_date'])) . '<br><strong>&bull; Time: </strong>' . date('h:i A', strtotime($logs[0]['wa_is_inspection_fee_required_scheduled_actual_start_time'])) . ' - ' . date('h:i A', strtotime($logs[0]['wa_is_inspection_fee_required_scheduled_actual_end_time'])) . '</p>');
                // if($counter < $upcomingInspectionCount) {
                //     $html .= '<br>';
                // }
                // $schedule .= date('d F Y', strtotime($logs[0]['wa_is_inspection_fee_required_scheduled_date']));
                // $schedule .= '<br>';
                // $schedule .= ucfirst($logs[0]['wa_is_inspection_fee_required_scheduled_day']);
                // $schedule .= ', ';
                // $startTime = $logs[0]['wa_is_inspection_fee_required_scheduled_actual_start_time'];
                // $endTime = $logs[0]['wa_is_inspection_fee_required_scheduled_actual_end_time'];
                // $schedule .= date('h:i A', strtotime($startTime));
                // $schedule .= ' - ';
                // $schedule .= date('h:i A', strtotime($endTime));
                // $html .= ('<h4>' . $schedule . '</h4>');
                // foreach ($logs as $log) {
                //     $html .= ('<p>Log #' . $log['wa_id'] . ' - ' . $log['wa_problem'] . '</p>');
                // }
            }
        }

        if (isset($warranty_log_inspection_reschedules[$row['wa_id']])) {
            $pendingActionCount++;
            $emailFlag = true;
            $html .= '<p><strong>&bull; Reschedule</strong></p>';
        }

        // $html .= '<hr>';
        $html .= '<h3><strong>Next Steps</strong></h3>';
        $html .= '<p>Please log in to your warranty portal using the link below to complete the required actions:<br><strong>Portal Login:</strong> <a href="' . $portalLoginLink . '" target="_blank">Warranty Portal</a></p>';
        $html .= '<p>Once the required actions are completed, our team will be able to move forward with the next steps of your warranty process.</p>';
        $html .= '<p>If you have already completed these items, please disregard this message.</p>';
        $html .= '<p>Should you have any questions or need assistance, feel free to reply to this email - we\'re happy to help.</p>';
        $html .= '<p>Thank you for your time and cooperation.</p>';
        $html .= '<p>Best regards,<br>CGFB Warranty Team</p>';
    }
    if ($emailFlag) {
        $emailObj = new EmailClass;
        $emailObj->subject = 'Action Required - Pending Items in Your Warranty Account';
        $emailObj->message = $html;
        $emailObj->attachments = [];
        $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
        $emailObj->addTo($customerEmail, $customerName);
        // $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
        // $emailObj->addTo('designer@ephpsolutions.com', 'Vivek');
        // $emailObj->addTo('coo@cgfb.com.au', 'COO');
        // $emailObj->addTo('amans@ephpsolutions.com', 'Aman');

        $response = $emailObj->sendEmail();
        $emailObj->logSendEmail($response, [
            'module_name' => 'inspection_warranty_log.home',
            'table_name' => 'business',
            'column_name' => 'bsn_id',
            'column_id' => $row['bsn_id'],
        ]);
        if (!$response['success']) {
            $emailErrorLog[] = [
                'to' => $emailObj->to,
                'subject' => $emailObj->subject,
                'error' => $response['message']
            ];
        }
        // db($emailObj);
        echo $html;
        echo '<hr><hr><hr>';

        $metaData = [
            'module_name' => 'inspection_warranty_log.home',
            'table_name' => 'business',
            'column_name' => 'bsn_id',
            'column_id' => $row['bsn_id'],
        ];
        $message = 'CGFB Warranty: You have ' . $pendingActionCount . ' pending warranty action(s) that require your attention. Please log in to complete them: ' . $portalLoginLink . '';
        $to = $customerMobile;
        $smsObj = new SmsClass($to, $message);
        $response = $smsObj->send();
        if (!$response['success']) {
            $smsErrorLog[] = [
                'to' => $to,
                'message' => $message,
                'error' => $response['message']
            ];
        }
        $metaData['to'] = [
            [
                'email' => $to,
                'name' => $customerName,
            ]
        ];
        $smsObj->log($response, $metaData);

        // $to = '+918602488442';
        // $smsObj = new SmsClass($to, $message);
        // $response = $smsObj->send();
        // if (!$response['success']) {
        //     $smsErrorLog[] = [
        //         'to' => $to,
        //         'message' => $message,
        //         'error' => $response['message']
        //     ];
        // }
        // $metaData['to'] = [
        //     [
        //         'email' => $to,
        //         'name' => 'Aman',
        //     ]
        // ];
        // $smsObj->log($response, $metaData);

        // $to = '+919960963552';
        // $smsObj = new SmsClass($to, $message);
        // $response = $smsObj->send();
        // if (!$response['success']) {
        //     $smsErrorLog[] = [
        //         'to' => $to,
        //         'message' => $message,
        //         'error' => $response['message']
        //     ];
        // }
        // $metaData['to'] = [
        //     [
        //         'email' => $to,
        //         'name' => 'Rahul',
        //     ]
        // ];
        // $smsObj->log($response, $metaData);

        // $to = '0485982524';
        // $smsObj = new SmsClass($to, $message);
        // $response = $smsObj->send();
        // if (!$response['success']) {
        //     $smsErrorLog[] = [
        //         'to' => $to,
        //         'message' => $message,
        //         'error' => $response['message']
        //     ];
        // }
        // $metaData['to'] = [
        //     [
        //         'email' => $to,
        //         'name' => 'Test User',
        //     ]
        // ];
        // $smsObj->log($response, $metaData);
    }
}

if (!empty($emailErrorLog)) {
    db($emailErrorLog);
}
echo '<hr><hr><hr>';
if (!empty($smsErrorLog)) {
    db($smsErrorLog);
}

exit;
