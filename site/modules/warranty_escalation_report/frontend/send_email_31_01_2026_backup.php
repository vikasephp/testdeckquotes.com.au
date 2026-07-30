<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';

require_once LIB_DIR . 'EmailClass.php';

$delete = $fwRequest->getParam('delete', '');
if($delete) {
    $query = "UPDATE warranty_escalation_report_email SET were_is_active = 0 WHERE were_id = $delete";
    $fwDb->queryOne($query);

    Location(BASE_URL . $BASEFOLDER . '.send_email');
	exit;
}

$query = 'SELECT * FROM `contacts` WHERE cs_company = 2 AND cs_primary_email != "" ORDER BY cs_first_name ASC, cs_surname ASC, cs_primary_email ASC';
$result = $fwDb->query($query);
$fwViewData['contacts'] = $result;

$query = 'SELECT 
        COUNT(*) AS total_logs,
        COUNT(CASE 
            WHEN STR_TO_DATE(wa_flag_date, "%d-%m-%Y") < DATE_SUB(CURDATE(), INTERVAL 30 DAY) 
            THEN 1 
        END) AS logs_older_than_30_days
    FROM
        warranty_log 
    WHERE
        (wa_status = "Open" OR wa_status = "Pending") 
        AND wa_flag = "Yes";';
$result = $fwDb->queryOne($query);
$total_escalation_logs = $result['total_logs'];
$over_30_days_count = $result['logs_older_than_30_days'];

$email_content = '<p style="margin-bottom: 15px;">Hi team,</p>';
$email_content .= '<p style="margin-bottom: 15px;">The <strong>Warranty Escalation Report</strong> tracks warranty logs that require additional support or decisions and are currently escalated for review.</p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Current summary:</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
    $email_content .= ('<li>Total escalated logs: ' . $total_escalation_logs . '</li>');
    $email_content .= ('<li>Logs over 30 days: ' . $over_30_days_count . '</li>');
$email_content .= '</ul>';
$email_content .= '<p style="margin-bottom: 15px;">Please review and action where required, especially older escalations.</p>';
$email_content .= '<p>Thanks,<br>Warranty Manager </p>';
$fwViewData['email_content'] = $email_content;

$to = $fwRequest->getParam('to', '');
$cc = $fwRequest->getParam('cc', '');
$send_now = $fwRequest->getParam('send_now', '');
$send_later_one_time = $fwRequest->getParam('send_later_one_time', '');
$send_later_one_time_date = $fwRequest->getParam('send_later_one_time_date', '');
$send_later_one_time_time = $fwRequest->getParam('send_later_one_time_time', '');
$send_later_recurring = $fwRequest->getParam('send_later_recurring', '');
$send_later_recurring_type = $fwRequest->getParam('send_later_recurring_type', '');
$send_later_recurring_day = $fwRequest->getParam('send_later_recurring_day', '');
$send_later_recurring_time = $fwRequest->getParam('send_later_recurring_time', '');
$error = false;
if ($send_now || $send_later_one_time || $send_later_recurring) {
    $insertData = [];
    if (empty($to)) {
        $fwViewData['error'] = 'Please select at least one recipient.';
        $error = true;
    } else {        
        $insertData['were_subject'] = 'Action Required: Warranty Escalation Report';
        $insertData['were_body'] = $email_content;
        $toList = array_map('trim', explode(',', $to));
        $ccList = array_map('trim', explode(',', $cc));

        $emailObj = new EmailClass;
        $emailObj->subject = $insertData['were_subject'];
        $emailObj->message = $insertData['were_body'];
        $emailObj->attachments = [];
        $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
        $toArray = [];
        foreach($toList as $email) {
            $email = trim($email);
            if(!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $toArray[] = $email;
                $emailObj->addTo($email, 'User');
            }
            elseif($email) {
                $fwViewData['error'] = ($email . ' is an invalid email address');
                $error = true;
                break;
            }
        }
        $ccArray = [];
        foreach($ccList as $email) {
            $email = trim($email);
            if(!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $ccArray[] = $email;
                $emailObj->addCc($email, 'User');
            }
            elseif($email) {
                $fwViewData['error'] = ($email . ' is an invalid email address');
                $error = true;
                break;
            }
        }
        $insertData['were_to'] = implode('<br>', $toArray);
        $insertData['were_cc'] = implode('<br>', $ccArray);


        if ($send_now) {
            $insertData['were_email_type'] = 0;
            $insertData['were_is_active'] = 0;
        } elseif ($send_later_one_time) {
            if (empty($send_later_one_time_date)) {
                $fwViewData['error'] = 'Please select date.';
                $error = true;
            } elseif (empty($send_later_one_time_time)) {
                $fwViewData['error'] = 'Please select time.';
                $error = true;
            } else {
                $insertData['were_email_type'] = 1;
                $insertData['were_send_date'] = date('Y-m-d', strtotime($send_later_one_time_date));
                $insertData['were_send_time'] = $send_later_one_time_time;
            }
        } elseif ($send_later_recurring) {
            $insertData['were_email_type'] = 2;
            if ($send_later_recurring_type == 'daily') {
                if (empty($send_later_recurring_time)) {
                    $fwViewData['error'] = 'Please select time.';
                    $error = true;
                } else {
                    $insertData['were_send_type'] = 0;
                    $insertData['were_send_time'] = $send_later_recurring_time;
                }
            } elseif ($send_later_recurring_type == 'weekly') {
                if (empty($send_later_recurring_day)) {
                    $fwViewData['error'] = 'Please select day.';
                    $error = true;
                } elseif (empty($send_later_recurring_time)) {
                    $fwViewData['error'] = 'Please select time.';
                    $error = true;
                } else {
                    $insertData['were_send_type'] = 1;
                    $insertData['were_send_day'] = $send_later_recurring_day;
                    $insertData['were_send_time'] = $send_later_recurring_time;
                }
            } else {
                $fwViewData['error'] = 'Please select type.';
                $error = true;
            }
        }

        if (!$error) {
            $insertData['were_added_by'] = $_SESSION['user']['user_id'];
            // db($insertData);
            $warranty_escalation_report_email_table = new Fw_Db_Table('warranty_escalation_report_email');
            $were_id = $warranty_escalation_report_email_table->insertRow($insertData);
            if ($send_now) {
                $response = $emailObj->sendEmail();
                $emailObj->logSendEmail($response, [
                    'module_name' => 'warranty_escalation_report.send_email',
                    'table_name' => 'warranty_escalation_report_email',
                    'column_name' => 'were_id',
                    'column_id' => $were_id,
                ]);
                $fwViewData['success'] = 'Email sent successfully.';
            }
            elseif ($send_later_one_time) {
                $fwViewData['success'] = 'Email scheduled successfully.';
            }
            elseif ($send_later_recurring) {
                $fwViewData['success'] = 'Email scheduled successfully.';
            }
        }
    }
}


$fwViewData['page_title'] = 'Send Email';

/**
 * table: warranty_escalation_report_email
 * were_id
 * were_to
 * were_cc
 * were_subject
 * were_body
 * were_email_type (now: 0, one_time: 1, recurring: 2)
 * were_send_type (daily: 0, weekly: 1)
 * were_send_day
 * were_send_time
 * were_send_date
 * were_added_by
 * were_added_at
 */

// db(date('D I l'));

$query = 'SELECT * FROM `warranty_escalation_report_email` WHERE were_is_active = 1';
$result = $fwDb->query($query);
foreach($result as $index => $row) {
    $email_type = '';
    if($row['were_email_type'] == 0) {
        $email_type = 'Now';
    } elseif($row['were_email_type'] == 1) {
        $email_type = 'One Time';
    } elseif($row['were_email_type'] == 2) {
        $email_type = 'Recurring';
    }
    $result[$index]['email_type'] = $email_type;

    $send_type = '';
    if($row['were_send_type'] == 0) {
        $send_type = 'Daily';
    } elseif($row['were_send_type'] == 1) {
        $send_type = 'Weekly';
    }
    $result[$index]['send_type'] = $send_type;

    $send_date = '';
    // one time
    if($row['were_email_type'] == 1) {
        $send_date = date('d-M-Y', strtotime($row['were_send_date']));
        $send_date .= (' ' . date('h:i A', strtotime($row['were_send_time'])));
    }
    // recurring
    elseif($row['were_email_type'] == 2) {
        // daily
        if($row['were_send_type'] == 0) {
            $send_date = date('h:i A', strtotime($row['were_send_time']));
        }
        // weekly
        elseif($row['were_send_type'] == 1) {
            $send_date = ucfirst($row['were_send_day']);
            $send_date .= (' ' . date('h:i A', strtotime($row['were_send_time'])));
        }
    }
    $result[$index]['send_date'] = $send_date;

}
$fwViewData['emails'] = $result;
