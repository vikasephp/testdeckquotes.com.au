<?php
$fwMainView = 'file:' . getcwd() . '/send_email.tpl';

require_once LIB_DIR . 'EmailClass.php';

$delete = $fwRequest->getParam('delete', '');
if ($delete) {
	$query = "DELETE FROM cou_component_escalation_report_email WHERE ccer_id = " . (int)$delete;
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
$over_30_days_count = $result['logs_older_than_30_days'];
$logs_last_7_days = $result['logs_last_7_days'];

$current_date = date('d-m-Y');

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
		$insertData['ccer_subject'] = 'Action Required: COU Escalation Report';
		$insertData['ccer_body'] = $email_content;
		$toList = array_map('trim', explode(',', $to));
		$ccList = array_map('trim', explode(',', $cc));

		$emailObj = new EmailClass;
		$emailObj->subject = $insertData['ccer_subject'];
		$emailObj->message = $insertData['ccer_body'];
		$emailObj->attachments = [];
		$emailObj->addFrom('Coo@cgfb.com.au', 'CGFB COU Coordinator');
		$toArray = [];
		foreach ($toList as $email) {
			$email = trim($email);
			if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$toArray[] = $email;
				$emailObj->addTo($email, 'User');
			} elseif ($email) {
				$fwViewData['error'] = ($email . ' is an invalid email address');
				$error = true;
				break;
			}
		}
		$ccArray = [];
		foreach ($ccList as $email) {
			$email = trim($email);
			if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)) {
				$ccArray[] = $email;
				$emailObj->addCc($email, 'User');
			} elseif ($email) {
				$fwViewData['error'] = ($email . ' is an invalid email address');
				$error = true;
				break;
			}
		}
		$insertData['ccer_to'] = implode('<br>', $toArray);
		$insertData['ccer_cc'] = implode('<br>', $ccArray);

		if ($send_now) {
			$insertData['ccer_email_type'] = 0;
			$insertData['ccer_is_active'] = 0;
		} elseif ($send_later_one_time) {
			if (empty($send_later_one_time_date)) {
				$fwViewData['error'] = 'Please select date.';
				$error = true;
			} elseif (empty($send_later_one_time_time)) {
				$fwViewData['error'] = 'Please select time.';
				$error = true;
			} else {
				$insertData['ccer_email_type'] = 1;
				$insertData['ccer_is_active'] = 1;
				$insertData['ccer_send_date'] = date('Y-m-d', strtotime($send_later_one_time_date));
				$insertData['ccer_send_time'] = $send_later_one_time_time;
			}
		} elseif ($send_later_recurring) {
			$insertData['ccer_email_type'] = 2;
			$insertData['ccer_is_active'] = 1;
			if ($send_later_recurring_type == 'daily') {
				if (empty($send_later_recurring_time)) {
					$fwViewData['error'] = 'Please select time.';
					$error = true;
				} else {
					$insertData['ccer_send_type'] = 0;
					$insertData['ccer_send_time'] = $send_later_recurring_time;
				}
			} elseif ($send_later_recurring_type == 'weekly') {
				if (empty($send_later_recurring_day)) {
					$fwViewData['error'] = 'Please select day.';
					$error = true;
				} elseif (empty($send_later_recurring_time)) {
					$fwViewData['error'] = 'Please select time.';
					$error = true;
				} else {
					$insertData['ccer_send_type'] = 1;
					$insertData['ccer_send_day'] = $send_later_recurring_day;
					$insertData['ccer_send_time'] = $send_later_recurring_time;
				}
			} else {
				$fwViewData['error'] = 'Please select type.';
				$error = true;
			}
		}

		if (!$error) {
			$insertData['ccer_added_by'] = $_SESSION['user']['user_id'];
			$emailTable = new Fw_Db_Table('cou_component_escalation_report_email');
			$ccer_id = $emailTable->insertRow($insertData);
			if ($send_now) {
				$response = $emailObj->sendEmail();
				$emailObj->logSendEmail($response, [
					'module_name' => 'cou_component_escalation_report.send_email',
					'table_name' => 'cou_component_escalation_report_email',
					'column_name' => 'ccer_id',
					'column_id' => $ccer_id,
				]);
				$fwViewData['success'] = 'Email sent successfully.';
			} elseif ($send_later_one_time) {
				$fwViewData['success'] = 'Email scheduled successfully.';
			} elseif ($send_later_recurring) {
				$fwViewData['success'] = 'Email scheduled successfully.';
			}
		}
	}
}

$fwViewData['page_title'] = 'Send Email';

$query = 'SELECT * FROM `cou_component_escalation_report_email` ORDER BY ccer_id DESC';
$result = $fwDb->query($query);
foreach ($result as $index => $row) {
	$email_type = '';
	if ($row['ccer_email_type'] == 0) {
		$email_type = 'Now';
	} elseif ($row['ccer_email_type'] == 1) {
		$email_type = 'One Time';
	} elseif ($row['ccer_email_type'] == 2) {
		$email_type = 'Recurring';
	}
	$result[$index]['email_type'] = $email_type;

	$send_type = '';
	if ($row['ccer_send_type'] == 0) {
		$send_type = 'Daily';
	} elseif ($row['ccer_send_type'] == 1) {
		$send_type = 'Weekly';
	}
	$result[$index]['send_type'] = $send_type;

	$send_date = '';
	if ($row['ccer_email_type'] == 1) {
		$send_date = date('d-M-Y', strtotime($row['ccer_send_date']));
		$send_date .= (' ' . date('h:i A', strtotime($row['ccer_send_time'])));
	} elseif ($row['ccer_email_type'] == 2) {
		if ($row['ccer_send_type'] == 0) {
			$send_date = date('h:i A', strtotime($row['ccer_send_time']));
		} elseif ($row['ccer_send_type'] == 1) {
			$send_date = ucfirst($row['ccer_send_day']);
			$send_date .= (' ' . date('h:i A', strtotime($row['ccer_send_time'])));
		}
	}
	$result[$index]['send_date'] = $send_date;
}
$fwViewData['emails'] = $result;
