<?php

/**
 * Send email for COU Component Escalation Report (cron)
 * Mirror of warranty_escalation_report_send_email.php
 *
 * Upload to: site/modules/site/frontend/cou_component_escalation_report_send_email.php
 * Cron URL: https://www.deckquotes.com.au/site.cou_component_escalation_report_send_email
 */

require_once LIB_DIR . 'EmailClass.php';

$date_now = date('Y-m-d H:i:00');
// $date_now = date('2026-01-15 23:23:00');
echo 'Date Now: ' . $date_now . '<br>';
echo 'Day: ' . date('l') . '<hr>';

$current_date = date('d-m-Y');

$query = 'SELECT
		COUNT(*) AS total_logs,
		COUNT(CASE
			WHEN DATE(bsn_cou_escalation_yes_at) >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
			THEN 1
		END) AS logs_last_7_days,
		COUNT(CASE
			WHEN DATE(bsn_cou_escalation_yes_at) < DATE_SUB(CURDATE(), INTERVAL 30 DAY)
			THEN 1
		END) AS logs_older_than_30_days
	FROM business
	WHERE bsn_cou_escalation_required = "Yes"';
$result = $fwDb->queryOne($query);
$total_escalation_logs = $result['total_logs'];
$logs_last_7_days = $result['logs_last_7_days'];
$over_30_days_count = $result['logs_older_than_30_days'];

$email_content = '<p style="margin-bottom: 15px;">Hi Team,</p>';
$email_content .= '<p style="margin-bottom: 15px;">This is a quick update on the <strong>COU Escalation Report</strong>.</p>';
$email_content .= '<p style="margin-bottom: 15px;">The Escalation Report tracks projects within the COU Report that have been marked as <strong>Require Escalation</strong>, meaning they require additional review, guidance, approval, or intervention beyond the standard COU process.</p>';
$email_content .= '<p style="margin-bottom: 15px;">COU Escalation Report: <a href="' . BASE_URL . 'cou_component_escalation_report.home" target="_blank">Link</a></p>';
$email_content .= '<p style="margin-bottom: 15px;"><strong>Summary (as of ' . $current_date . ')</strong></p>';
$email_content .= '<ul style="margin-bottom: 15px;">';
$email_content .= ('<li>Total escalated logs: ' . $total_escalation_logs . '</li>');
$email_content .= ('<li>Logs added in the last 7 days: ' . $logs_last_7_days . '</li>');
$email_content .= ('<li>Logs over 30 days: ' . $over_30_days_count . '</li>');
$email_content .= '</ul>';
$email_content .= '<p style="margin-bottom: 15px;">Please review the Escalation Report using the link above and prioritise the relevant projects accordingly, particularly those requiring further action, approval, or decision-making.</p>';
$email_content .= '<p style="margin-bottom: 15px;">If you have any questions or require clarification on any specific entry, please let me know.</p>';
$email_content .= '<p style="margin-bottom: 10px;">Thanks,</p>';
$email_content .= '<p style="margin-bottom: 10px;">COU Coordinator</p>';
$email_content .= '<p style="margin-bottom: 10px; color:rgb(85,142,213);">';
$email_content .= 'Canberra Fixed Price Extensions &amp; Granny Flat Builders<br>';
$email_content .= 'Phone: 1300 979 658 <span style="color:rgb(255,192,0);"><b>|</b></span> Fax: 1300 979 657<br>';
$email_content .= 'Postal: GPO Box 2265 Canberra City 2602<br>';
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

$query = 'SELECT * FROM ( SELECT *, ROW_NUMBER() OVER ( PARTITION BY column_id, column_name, table_name, module_name ORDER BY created_at DESC ) as row_num FROM email_log_new WHERE table_name = "cou_component_escalation_report_email" AND module_name = "cou_component_escalation_report.send_email" ) AS ranked_logs WHERE row_num = 1;';
$result = $fwDb->query($query);
$email_log_new = [];
foreach ($result as $row) {
	$created_at = $row['created_at'];
	$email_log_new[$row['column_id']] = [
		'send_date' => $created_at,
	];
}

$cou_component_escalation_report_email_table = new Fw_Db_Table('cou_component_escalation_report_email');
$cou_component_escalation_report_email_table->setWhere('ccer_is_active = 1 AND ccer_email_type != 0');
$errorLog = [];
if ($cou_component_escalation_report_email_table->rowExists()) {
	$records = $cou_component_escalation_report_email_table->getRows();
	foreach ($records as $row) {
		$emailObj = new EmailClass;
		$emailObj->subject = $row['ccer_subject'];
		$emailObj->message = $email_content;
		$emailObj->attachments = [];
		$emailObj->addFrom('coo@cgfb.com.au', 'CGFB COU Coordinator');
		$toList = explode('<br>', $row['ccer_to']);
		foreach ($toList as $email) {
			if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$emailObj->addTo($email, 'User');
			}
		}
		$ccList = explode('<br>', $row['ccer_cc']);
		foreach ($ccList as $email) {
			if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$emailObj->addCc($email, 'User');
			}
		}
		$send_flag = false;
		echo 'ID: ' . $row['ccer_id'] . '<br>';
		// check record is one time email
		if ($row['ccer_email_type'] == 1) {
			$send_date = $row['ccer_send_date'];
			$send_time = $row['ccer_send_time'];

			echo 'One time email<br>';
			echo 'Send Date: ' . $send_date . '<br>Send Time: ' . $send_time . '<br>';
			$timeDiff = strtotime($send_date . ' ' . $send_time) - strtotime($date_now);
			echo 'Time Diff: ' . $timeDiff . ' seconds<br>';
			if ($timeDiff < 0 && !isset($email_log_new[$row['ccer_id']])) {
				$send_flag = true;
				$query = 'UPDATE cou_component_escalation_report_email SET ccer_is_active = 0 WHERE ccer_id = ' . $row['ccer_id'] . ';';
				$fwDb->queryOne($query);
			}
		}

		// check record is recurring email
		elseif ($row['ccer_email_type'] == 2) {
			// send daily
			if ($row['ccer_send_type'] == 0) {
				$send_time = $row['ccer_send_time'];
				$schedule_date = date('Y-m-d' . ' ' . $send_time);
				echo 'Recurring daily<br>';
				echo 'Schedule Datetime: ' . $schedule_date . '<br>';
				$timeDiff = strtotime($schedule_date) - strtotime($date_now);
				echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
				$recurringDailyCondition = $timeDiff < 0 && !isset($email_log_new[$row['ccer_id']]);
				if (isset($email_log_new[$row['ccer_id']]) && $last_send_date = $email_log_new[$row['ccer_id']]['send_date']) {
					echo 'Last Send Datetime: ' . $last_send_date . '<br>';
					$sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
					echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
					$recurringDailyCondition = $timeDiff < 0 && $sendTimeDiff >= (24 * 60 * 60);
				}
				if ($timeDiff == 0 || $recurringDailyCondition) {
					$send_flag = true;
				}
			}
			// send weekly
			elseif ($row['ccer_send_type'] == 1) {
				$send_time = $row['ccer_send_time'];
				$send_day = $row['ccer_send_day'];
				$schedule_date = date('Y-m-d' . ' ' . $send_time, strtotime('this week ' . $send_day));
				echo 'Recurring weekly<br>';
				echo 'Schedule Datetime: ' . $schedule_date . '<br>';
				echo 'Send Day: ' . $send_day . '<br>Send Time: ' . $send_time . '<br>';
				$timeDiff = strtotime($schedule_date) - strtotime($date_now);
				echo 'Now Time Diff: ' . $timeDiff . ' seconds<br>';
				$recurringWeeklyCondition = $timeDiff < 0 && $send_day == strtolower(date('l')) && !isset($email_log_new[$row['ccer_id']]);
				if (isset($email_log_new[$row['ccer_id']]) && $last_send_date = $email_log_new[$row['ccer_id']]['send_date']) {
					echo 'Last Send Datetime: ' . $last_send_date . '<br>';
					$sendTimeDiff = strtotime(date('Y-m-d', strtotime($schedule_date))) - strtotime(date('Y-m-d', strtotime($last_send_date)));
					echo 'Last Send Date Diff with Schedule: ' . $sendTimeDiff . ' seconds<br>';
					$recurringWeeklyCondition = $timeDiff < 0 && $sendTimeDiff >= (24 * 60 * 60 * 7);
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
				'module_name' => 'cou_component_escalation_report.send_email',
				'table_name' => 'cou_component_escalation_report_email',
				'column_name' => 'ccer_id',
				'column_id' => $row['ccer_id'],
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
