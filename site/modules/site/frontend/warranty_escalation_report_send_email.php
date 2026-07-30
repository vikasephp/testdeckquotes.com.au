<?php

/**
 * Send email for warranty escalation report
 */

require_once LIB_DIR . 'EmailClass.php';

$date_now = date('Y-m-d H:i:00');
// $date_now = date('2026-01-15 23:23:00');
echo 'Date Now: ' . $date_now . '<br>';
echo 'Day: ' . date('l') . '<hr>';

$query = 'SELECT 
        COUNT(*) AS total_logs,
        COUNT(
			CASE 
				WHEN STR_TO_DATE(wa_flag_date, "%d-%m-%Y") >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
				THEN 1
			END
		) AS logs_last_7_days,
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
$logs_last_7_days = $result['logs_last_7_days'];
$over_30_days_count = $result['logs_older_than_30_days'];

$sql_action_count = "SELECT SUM(CASE WHEN wl.wa_wlea_id = 1 THEN 1 ELSE 0 END) AS count_90_days, SUM(CASE WHEN wl.wa_wlea_id = 2 THEN 1 ELSE 0 END) AS count_approval, SUM(CASE WHEN wl.wa_wlea_id = 5 THEN 1 ELSE 0 END) AS count_failed_attempts, SUM(CASE WHEN wl.wa_wlea_id = 6 THEN 1 ELSE 0 END) AS count_risk, SUM(CASE WHEN wl.wa_wlea_id = 7 THEN 1 ELSE 0 END) AS count_responsibility, SUM(CASE WHEN wl.wa_wlea_id = 8 THEN 1 ELSE 0 END) AS count_goodwill FROM warranty_log wl WHERE (wl.wa_status = 'Open' OR wl.wa_status = 'Pending') AND wl.wa_flag = 'Yes'; ";
$result_action_count = $fwDb->queryOne($sql_action_count);
$count_90_days = $result_action_count['count_90_days'];
$count_approval = $result_action_count['count_approval'];
$count_failed_attempts = $result_action_count['count_failed_attempts'];
$count_risk = $result_action_count['count_risk'];
$count_responsibility = $result_action_count['count_responsibility'];
$count_goodwill = $result_action_count['count_goodwill'];

$email_content = '<p style="margin-bottom: 15px;">Hi team,</p>';
$email_content .= '<p style="margin-bottom: 15px;">This is a quick update on the <strong>Warranty Escalation Report</strong>.</p>';
$email_content .= '<p style="margin-bottom: 15px;">The Escalation Report tracks warranty logs that have been marked as <strong>Require Escalation</strong>, meaning they need additional review, guidance, approval, or intervention beyond standard warranty handling.</p>';
$email_content .= '<p style="margin-bottom: 15px;">Escalation Report link: <a href="'.BASE_URL.'warranty_escalation_report.home" target="_blank">Link</a> </p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Summary (as of '.$current_date.')</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
    $email_content .= ('<li>Total escalated logs: ' . $total_escalation_logs . '</li>');
	$email_content .= ('<li>Logs added in the last 7 days: ' . $logs_last_7_days. '</li>');
    $email_content .= ('<li>Logs over 30 days: ' . $over_30_days_count . '</li>');
$email_content .= '</ul>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Current escalation reasons (Action Types):</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
    $email_content .= ('<li>Over 90 Days - No Meaningful Progress: ' . $count_90_days . '</li>');
	$email_content .= ('<li>Approval Required (Supervisor / Management): ' . $count_approval. '</li>');
    $email_content .= ('<li>Multiple Failed Resolution Attempts: ' . $count_failed_attempts . '</li>');
	$email_content .= ('<li>Reputational or Legal Risk: ' . $count_risk . '</li>');
	$email_content .= ('<li>Responsibility Unclear: ' . $count_responsibility . '</li>');
	$email_content .= ('<li>Outside Warranty Coverage - Goodwill Consideration: ' . $count_goodwill . '</li>');
$email_content .= '</ul>';
$email_content .= '<p style="margin-bottom: 15px;">Please review the escalation report using the link above and prioritise items that are <strong>over 30 days</strong> or require approval or decision-making. </p>';
$email_content .= '<p style="margin-bottom: 15px;">Let me know if you have questions or need clarification on any specific logs.</p>';
$email_content .= '<p>Thanks,<br>Warranty Manager </p>';

function sendCondition($timeDIff)
{
    if ($timeDIff < 60 && $timeDIff > -60) {
        return true;
    }
    return false;
}

$query = 'SELECT * FROM ( SELECT *, ROW_NUMBER() OVER ( PARTITION BY column_id, column_name, table_name, module_name ORDER BY created_at DESC ) as row_num FROM email_log_new WHERE table_name = "warranty_escalation_report_email" AND module_name = "warranty_escalation_report.send_email" ) AS ranked_logs WHERE row_num = 1;';
// $query = 'SELECT * FROM email_log_new WHERE table_name LIKE "warranty_escalation_report_email" AND module_name LIKE "warranty_escalation_report.send_email"';
$result = $fwDb->query($query);
$email_log_new = [];
foreach ($result as $row) {
    // $timeDiff = strtotime($row['created_at']) - strtotime($date_now);
    $created_at = $row['created_at'];
    // if (sendCondition($timeDiff)) {
    //     $email_log_new[$row['column_id']] = true;
    // }
    $email_log_new[$row['column_id']] = [
        'send_date' => $created_at,
    ];
}

$warranty_escalation_report_email_table = new Fw_Db_Table('warranty_escalation_report_email');
$warranty_escalation_report_email_table->setWhere('were_is_active = 1 AND were_email_type != 0');
$errorLog = [];
if ($warranty_escalation_report_email_table->rowExists()) {
    $records = $warranty_escalation_report_email_table->getRows();
    foreach ($records as $row) {
        $emailObj = new EmailClass;
        $emailObj->subject = $row['were_subject'];
        $emailObj->message = $email_content;
        $emailObj->attachments = [];
        $emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
        $toList = explode('<br>', $row['were_to']);
        foreach ($toList as $email) {
            if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emailObj->addTo($email, 'User');
            }
        }
        $ccList = explode('<br>', $row['were_cc']);
        foreach ($ccList as $email) {
            if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $emailObj->addCc($email, 'User');
            }
        }
        $send_flag = false;
        echo 'ID: ' . $row['were_id'] . '<br>';
        // check record is one time email
        if ($row['were_email_type'] == 1) {
            $send_date = $row['were_send_date'];
            $send_time = $row['were_send_time'];

            echo 'One time email<br>';
            echo 'Send Date: ' . $send_date . '<br>Send Time: ' . $send_time . '<br>';
            $timeDiff = strtotime($send_date . ' ' . $send_time) - strtotime($date_now);
            echo 'Time Diff: ' . $timeDiff . ' seconds<br>';
            if($timeDiff < 0 && !isset($email_log_new[$row['were_id']])) {
                $send_flag = true;
                $query = 'UPDATE warranty_escalation_report_email SET were_is_active = 0 WHERE were_id = ' . $row['were_id'] . ';';
                $fwDb->queryOne($query);
            }
            // if (sendCondition($timeDiff) && !isset($email_log_new[$row['were_id']])) {
            //     $send_flag = true;
            // }
            // update were_is_active = 0
        }

        // check record is recurring email
        elseif ($row['were_email_type'] == 2) {
            // send daily
            if ($row['were_send_type'] == 0) {
                $send_time = $row['were_send_time'];
                $schedule_date = date('Y-m-d' . ' ' . $send_time);
                echo 'Recurring daily<br>';
                echo 'Schedule Datetime: ' . $schedule_date . '<br>';
                $timeDiff = strtotime($schedule_date) - strtotime($date_now);
                echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
                // condition for first time send
                $recurringDailyCondition = $timeDiff < 0 && !isset($email_log_new[$row['were_id']]);
                if(isset($email_log_new[$row['were_id']]) && $last_send_date = $email_log_new[$row['were_id']]['send_date']) {
                    // $yesterday = date('Y-m-d H:i:s', strtotime('-1 day', strtotime($schedule_date)));
                    // echo 'Last Schedule Datetime: ' . $yesterday . '<br>';
                    echo 'Last Send Datetime: ' . $last_send_date . '<br>';
                    $sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
                    echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
                    // db($yesterday);
                    // get one day before schedule datetime and compare with last send datetime
                    $recurringDailyCondition = $timeDiff < 0 && $sendTimeDiff >= (24*60*60);
                }
                if ($timeDiff == 0 || $recurringDailyCondition) {
                    $send_flag = true;
                }
            }
            // send weekly
            elseif ($row['were_send_type'] == 1) {
                $send_time = $row['were_send_time'];
                $send_day = $row['were_send_day'];
                $schedule_date = date('Y-m-d' . ' ' . $send_time, strtotime('this week ' . $send_day));
                echo 'Recurring weekly<br>';
                echo 'Schedule Datetime: ' . $schedule_date . '<br>';
                echo 'Send Day: ' . $send_day . '<br>Send Time: ' . $send_time . '<br>';
                $timeDiff = strtotime($schedule_date) - strtotime($date_now);
                echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
                $recurringWeeklyCondition = $timeDiff < 0 && $send_day == strtolower(date('l')) && !isset($email_log_new[$row['were_id']]);
                if(isset($email_log_new[$row['were_id']]) && $last_send_date = $email_log_new[$row['were_id']]['send_date']) {
                    echo 'Last Send Datetime: ' . $last_send_date . '<br>';
                    $sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
                    echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
                    $recurringWeeklyCondition = $timeDiff < 0 && $sendTimeDiff >= (24*60*60*7);
                }
                if (($timeDiff == 0 && $send_day == strtolower(date('l'))) || $recurringWeeklyCondition /* sendCondition($timeDiff) && !isset($email_log_new[$row['were_id']]) */) {
                    $send_flag = true;
                }
            }
        }

        if ($send_flag) {
            echo 'Sending email...<br>';
            $response = $emailObj->sendEmail();
            $emailObj->logSendEmail($response, [
                'module_name' => 'warranty_escalation_report.send_email',
                'table_name' => 'warranty_escalation_report_email',
                'column_name' => 'were_id',
                'column_id' => $row['were_id'],
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
