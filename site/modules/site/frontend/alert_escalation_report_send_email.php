<?php

/**
 * Send email for alert escalation report (cron)
 * Mirror of warranty_escalation_report_send_email.php
 *
 * Upload to: site/modules/site/frontend/alert_escalation_report_send_email.php
 * Cron URL: https://www.deckquotes.com.au/site.alert_escalation_report_send_email
 */

require_once LIB_DIR . 'EmailClass.php';

$date_now = date('Y-m-d H:i:00');
// $date_now = date('2026-01-15 23:23:00');
echo 'Date Now: ' . $date_now . '<br>';
echo 'Day: ' . date('l') . '<hr>';

$current_date = date('d-m-Y');

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
        END) AS logs_older_than_30_days,
		COUNT(CASE
            WHEN car_esc_reason IS NULL OR TRIM(car_esc_reason) = ""
            THEN 1
        END) AS log_with_no_reason
    FROM
        construction_alert_report 
    WHERE
        car_add_to_ae = 1 and car_status <> "Closed" ';
$result = $fwDb->queryOne($query);
$total_escalation_logs = $result['total_logs'];
$logs_last_7_days = $result['logs_last_7_days'];
$over_30_days_count = $result['logs_older_than_30_days'];

$email_content = '<p style="margin-bottom: 15px;">Hi Team,</p>';
$email_content .= '<p style="margin-bottom: 15px;">This is a quick update on the Alert Escalation Report.</p>';
$email_content .= '<p style="margin-bottom: 15px;">The Alert Escalation Report tracks Construction Alert logs that have been marked as &ldquo;Require Escalation.&rdquo; These alerts require additional review, guidance, approval, or intervention beyond the standard construction handling process.</p>';
$email_content .= '<p style="margin-bottom: 15px;">Alert Escalation Report: <a href="'.BASE_URL.'alert_escalation_report.home" target="_blank">'.BASE_URL.'alert_escalation_report.home</a></p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Summary as of '.$current_date.':</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
    $email_content .= ('<li>Total escalated logs: ' . $total_escalation_logs . '</li>');
	$email_content .= ('<li>Escalated alerts with no response: ' . $log_with_no_reason . '</li>');
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

function sendCondition($timeDIff)
{
    if ($timeDIff < 60 && $timeDIff > -60) {
        return true;
    }
    return false;
}

$query = 'SELECT * FROM ( SELECT *, ROW_NUMBER() OVER ( PARTITION BY column_id, column_name, table_name, module_name ORDER BY created_at DESC ) as row_num FROM email_log_new WHERE table_name = "alert_escalation_report_email" AND module_name = "alert_escalation_report.send_email" ) AS ranked_logs WHERE row_num = 1;';
$result = $fwDb->query($query);
$email_log_new = [];
foreach ($result as $row) {
    $created_at = $row['created_at'];
    $email_log_new[$row['column_id']] = [
        'send_date' => $created_at,
    ];
}

$alert_escalation_report_email_table = new Fw_Db_Table('alert_escalation_report_email');
$alert_escalation_report_email_table->setWhere('aere_is_active = 1 AND aere_email_type != 0');
$errorLog = [];
if ($alert_escalation_report_email_table->rowExists()) {
    $records = $alert_escalation_report_email_table->getRows();
    foreach ($records as $row) {
        $emailObj = new EmailClass;
        $emailObj->subject = $row['aere_subject'];
        $emailObj->message = $email_content;
        $emailObj->attachments = [];
        $emailObj->addFrom('precon@cgfb.com.au', 'CGFB Precon');
        $toList = explode('<br>', $row['aere_to']);
        foreach ($toList as $email) {
            if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emailObj->addTo($email, 'User');
            }
        }
        $ccList = explode('<br>', $row['aere_cc']);
        foreach ($ccList as $email) {
            if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emailObj->addCc($email, 'User');
            }
        }
        $send_flag = false;
        echo 'ID: ' . $row['aere_id'] . '<br>';
        // check record is one time email
        if ($row['aere_email_type'] == 1) {
            $send_date = $row['aere_send_date'];
            $send_time = $row['aere_send_time'];

            echo 'One time email<br>';
            echo 'Send Date: ' . $send_date . '<br>Send Time: ' . $send_time . '<br>';
            $timeDiff = strtotime($send_date . ' ' . $send_time) - strtotime($date_now);
            echo 'Time Diff: ' . $timeDiff . ' seconds<br>';
            if($timeDiff < 0 && !isset($email_log_new[$row['aere_id']])) {
                $send_flag = true;
                $query = 'UPDATE alert_escalation_report_email SET aere_is_active = 0 WHERE aere_id = ' . $row['aere_id'] . ';';
                $fwDb->queryOne($query);
            }
        }

        // check record is recurring email
        elseif ($row['aere_email_type'] == 2) {
            // send daily
            if ($row['aere_send_type'] == 0) {
                $send_time = $row['aere_send_time'];
                $schedule_date = date('Y-m-d' . ' ' . $send_time);
                echo 'Recurring daily<br>';
                echo 'Schedule Datetime: ' . $schedule_date . '<br>';
                $timeDiff = strtotime($schedule_date) - strtotime($date_now);
                echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
                // condition for first time send
                $recurringDailyCondition = $timeDiff < 0 && !isset($email_log_new[$row['aere_id']]);
                if(isset($email_log_new[$row['aere_id']]) && $last_send_date = $email_log_new[$row['aere_id']]['send_date']) {
                    echo 'Last Send Datetime: ' . $last_send_date . '<br>';
                    $sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
                    echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
                    $recurringDailyCondition = $timeDiff < 0 && $sendTimeDiff >= (24*60*60);
                }
                if ($timeDiff == 0 || $recurringDailyCondition) {
                    $send_flag = true;
                }
            }
            // send weekly
            elseif ($row['aere_send_type'] == 1) {
                $send_time = $row['aere_send_time'];
                $send_day = $row['aere_send_day'];
                $schedule_date = date('Y-m-d' . ' ' . $send_time, strtotime('this week ' . $send_day));
                echo 'Recurring weekly<br>';
                echo 'Schedule Datetime: ' . $schedule_date . '<br>';
                echo 'Send Day: ' . $send_day . '<br>Send Time: ' . $send_time . '<br>';
                $timeDiff = strtotime($schedule_date) - strtotime($date_now);
                echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
                $recurringWeeklyCondition = $timeDiff < 0 && $send_day == strtolower(date('l')) && !isset($email_log_new[$row['aere_id']]);
                if(isset($email_log_new[$row['aere_id']]) && $last_send_date = $email_log_new[$row['aere_id']]['send_date']) {
                    echo 'Last Send Datetime: ' . $last_send_date . '<br>';
                    $sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
                    echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
                    $recurringWeeklyCondition = $timeDiff < 0 && $sendTimeDiff >= (24*60*60*7);
                }
                if (($timeDiff == 0 && $send_day == strtolower(date('l'))) || $recurringWeeklyCondition) {
                    $send_flag = true;
                }
            }
        }

        if ($send_flag) {
            echo 'Sending email...<br>';
            $response = $emailObj->sendEmail();
            $emailObj->logSendEmail($response, [
                'module_name' => 'alert_escalation_report.send_email',
                'table_name' => 'alert_escalation_report_email',
                'column_name' => 'aere_id',
                'column_id' => $row['aere_id'],
            ]);
            if (!$response['success']) {
                $errorLog[] = [
                    'to' => $emailObj->to,
                    'subject' => $emailObj->subject,
                    'error' => $response['message']
                ];
            }
        }

        echo '<hr>';
    }
}


if (!empty($errorLog)) {
    db($errorLog);
}

exit;
