<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';

require_once LIB_DIR . 'EmailClass.php';

$delete = $fwRequest->getParam('delete', '');
if($delete) {
    $deleteId = (int)$delete;
    if ($deleteId > 0) {
        $query = "DELETE FROM alert_escalation_report_email WHERE aere_id = " . $deleteId;
        $fwDb->queryOne($query);
    }

    Location(BASE_URL . $BASEFOLDER . '.send_email');
	exit;
}

$query = 'SELECT * FROM `contacts` WHERE cs_company = 2 AND cs_primary_email != "" ORDER BY cs_first_name ASC, cs_surname ASC, cs_primary_email ASC';
$result = $fwDb->query($query);
$fwViewData['contacts'] = $result;

$query = 'SELECT 
        COUNT(*) AS total_logs,
		COUNT(
			CASE 
				WHEN STR_TO_DATE(car_escalation_date, "%d-%m-%Y") >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
				THEN 1
			END
		) AS logs_last_7_days,
        COUNT(CASE 
            WHEN STR_TO_DATE(car_escalation_date, "%d-%m-%Y") < DATE_SUB(CURDATE(), INTERVAL 30 DAY) 
            THEN 1 
        END) AS logs_older_than_30_days
    FROM
        construction_alert_report 
    WHERE
        car_add_to_ae = 1';
$result = $fwDb->queryOne($query);
$total_escalation_logs = !empty($result['total_logs']) ? $result['total_logs'] : 0;
$over_30_days_count = !empty($result['logs_older_than_30_days']) ? $result['logs_older_than_30_days'] : 0;
$logs_last_7_days = !empty($result['logs_last_7_days']) ? $result['logs_last_7_days'] : 0;

$current_date = date('d-m-Y');

$email_content = '<p style="margin-bottom: 15px;">Hi Team,</p>';
$email_content .= '<p style="margin-bottom: 15px;">This is a quick update on the Alert Escalation Report.</p>';
$email_content .= '<p style="margin-bottom: 15px;">The Alert Escalation Report tracks Construction Alert logs that have been marked as &ldquo;Require Escalation.&rdquo; These alerts require additional review, guidance, approval, or intervention beyond the standard construction handling process.</p>';
$email_content .= '<p style="margin-bottom: 15px;">Alert Escalation Report: <a href="'.BASE_URL.'alert_escalation_report.home" target="_blank">'.BASE_URL.'alert_escalation_report.home</a></p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Summary as of '.$current_date.':</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
    $email_content .= ('<li>Total escalated logs: ' . $total_escalation_logs . '</li>');
	$email_content .= ('<li>Logs added within the last seven days: ' . $logs_last_7_days. '</li>');
    $email_content .= ('<li>Logs open for more than 30 days: ' . $over_30_days_count . '</li>');
$email_content .= '</ul>';
$email_content .= '<p style="margin-bottom: 15px;">Please let me know if you have any questions or require clarification regarding any specific alerts.</p>';
$email_content .= '<p style="margin-bottom: 10px;">Thanks and Regards,</p>';
$email_content .= '<p style="margin-bottom: 10px; color:rgb(85,142,213);">';
$email_content .= 'Canberra Fixed Price Extensions &amp; Granny Flat Builders<br>';
$email_content .= 'Phone: 1300 979 658 <span style="color:rgb(255,192,0);"><b>|</b></span> Fax: 1300 979 657<br>';
$email_content .= 'Postal: Unit 11/160 Lysaght Street, Mitchell ACT 2911<br>';
$email_content .= 'ACT Building Lic: 2012767';
$email_content .= '</p>';
$email_content .= '<p><img src="' . BASE_URL . 'images/cgfb_sign_footer.png" alt="Canberra Fixed Price Extensions &amp; Granny Flat Builders" style="max-width:420px; height:auto;" /></p>';
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
        $insertData['aere_subject'] = 'Action Required: Alert Escalation Report';
        $insertData['aere_body'] = $email_content;
        $toList = array_map('trim', explode(',', $to));
        $ccList = array_map('trim', explode(',', $cc));

        $emailObj = new EmailClass;
        $emailObj->subject = $insertData['aere_subject'];
        $emailObj->message = $insertData['aere_body'];
        $emailObj->attachments = [];
        $emailObj->addFrom('precon@cgfb.com.au', 'CGFB Precon');
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
        $insertData['aere_to'] = implode('<br>', $toArray);
        $insertData['aere_cc'] = implode('<br>', $ccArray);


        if ($send_now) {
            $insertData['aere_email_type'] = 0;
            $insertData['aere_is_active'] = 0;
        } elseif ($send_later_one_time) {
            if (empty($send_later_one_time_date)) {
                $fwViewData['error'] = 'Please select date.';
                $error = true;
            } elseif (empty($send_later_one_time_time)) {
                $fwViewData['error'] = 'Please select time.';
                $error = true;
            } else {
                $insertData['aere_email_type'] = 1;
                $insertData['aere_is_active'] = 1;
                $insertData['aere_send_date'] = date('Y-m-d', strtotime($send_later_one_time_date));
                $insertData['aere_send_time'] = $send_later_one_time_time;
            }
        } elseif ($send_later_recurring) {
            $insertData['aere_email_type'] = 2;
            $insertData['aere_is_active'] = 1;
            if ($send_later_recurring_type == 'daily') {
                if (empty($send_later_recurring_time)) {
                    $fwViewData['error'] = 'Please select time.';
                    $error = true;
                } else {
                    $insertData['aere_send_type'] = 0;
                    $insertData['aere_send_time'] = $send_later_recurring_time;
                }
            } elseif ($send_later_recurring_type == 'weekly') {
                if (empty($send_later_recurring_day)) {
                    $fwViewData['error'] = 'Please select day.';
                    $error = true;
                } elseif (empty($send_later_recurring_time)) {
                    $fwViewData['error'] = 'Please select time.';
                    $error = true;
                } else {
                    $insertData['aere_send_type'] = 1;
                    $insertData['aere_send_day'] = $send_later_recurring_day;
                    $insertData['aere_send_time'] = $send_later_recurring_time;
                }
            } else {
                $fwViewData['error'] = 'Please select type.';
                $error = true;
            }
        }

        if (!$error) {
            $insertData['aere_added_by'] = $_SESSION['user']['user_id'];
            $alert_escalation_report_email_table = new Fw_Db_Table('alert_escalation_report_email');
            $aere_id = $alert_escalation_report_email_table->insertRow($insertData);
            if ($send_now) {
                $response = $emailObj->sendEmail();
                $emailObj->logSendEmail($response, [
                    'module_name' => 'alert_escalation_report.send_email',
                    'table_name' => 'alert_escalation_report_email',
                    'column_name' => 'aere_id',
                    'column_id' => $aere_id,
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
 * table: alert_escalation_report_email
 * aere_id
 * aere_to
 * aere_cc
 * aere_subject
 * aere_body
 * aere_email_type (now: 0, one_time: 1, recurring: 2)
 * aere_send_type (daily: 0, weekly: 1)
 * aere_send_day
 * aere_send_time
 * aere_send_date
 * aere_added_by
 * aere_added_at
 * aere_is_active
 */

$query = 'SELECT * FROM `alert_escalation_report_email` ORDER BY aere_id DESC';
$result = [];
try {
    $tmp = $fwDb->query($query);
    if (is_array($tmp)) {
        $result = $tmp;
    }
} catch (Exception $e) {
    $result = [];
    $fwViewData['error'] = 'Unable to load email list. Please check alert_escalation_report_email table.';
}
foreach($result as $index => $row) {
    $email_type = '';
    if($row['aere_email_type'] == 0) {
        $email_type = 'Now';
    } elseif($row['aere_email_type'] == 1) {
        $email_type = 'One Time';
    } elseif($row['aere_email_type'] == 2) {
        $email_type = 'Recurring';
    }
    $result[$index]['email_type'] = $email_type;

    $send_type = '';
    if(isset($row['aere_send_type']) && $row['aere_send_type'] !== '' && $row['aere_send_type'] !== null) {
        if($row['aere_send_type'] == 0) {
            $send_type = 'Daily';
        } elseif($row['aere_send_type'] == 1) {
            $send_type = 'Weekly';
        }
    }
    $result[$index]['send_type'] = $send_type;

    $send_date = '';
    // one time
    if($row['aere_email_type'] == 1) {
        $send_date = date('d-M-Y', strtotime($row['aere_send_date']));
        $send_date .= (' ' . date('h:i A', strtotime($row['aere_send_time'])));
    }
    // recurring
    elseif($row['aere_email_type'] == 2) {
        // daily
        if($row['aere_send_type'] == 0) {
            $send_date = date('h:i A', strtotime($row['aere_send_time']));
        }
        // weekly
        elseif($row['aere_send_type'] == 1) {
            $send_date = ucfirst($row['aere_send_day']);
            $send_date .= (' ' . date('h:i A', strtotime($row['aere_send_time'])));
        }
    }
    $result[$index]['send_date'] = $send_date;

}
$fwViewData['emails'] = $result;
