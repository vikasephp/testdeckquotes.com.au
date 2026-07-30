<?php

require_once LIB_DIR . 'EmailClass.php';

$records = [];
$query = "SELECT BQ.*, BC.bcust_id, BC.bcust_fname, BC.bcust_lname, B.bsn_id, B.bsn_name, B.bsn_sub_status, B.bsn_status_sys_date FROM business_qa AS BQ INNER JOIN bus_customers AS BC ON BQ.bqa_cust_id = BC.bcust_id INNER JOIN business AS B ON BQ.bqa_bsn_id = B.bsn_id WHERE length(trim(BQ.bqa_ans_plain)) = 0 AND BQ.bqa_created_date >= '2025-01-01'";
$result = $fwDb->query($query);
foreach ($result as $row) {
	if (!isset($records[$row['bqa_who']])) {
		$records[$row['bqa_who']] = [];
	}
	$records[$row['bqa_who']][] = $row;
}

$bqaWhoIDs = array_keys($records);

$positions = [];
$query = "SELECT p_id, p_name, p_email FROM positions WHERE length(p_email) > 0 AND p_id IN (" . implode(',', $bqaWhoIDs) . ")";
$result = $fwDb->query($query);
foreach ($result as $row) {
	if ($row['p_email'] && $row['p_email'] != '') {
		$positions[$row['p_id']] = $row;
	}
}

foreach ($records as $bqa_who => $questions) {
	if ($positions[$bqa_who]['p_email']) {
		$message = "<html> <body>";
		$message .= "<p>Hello " . $positions[$bqa_who]['p_name'] . "</p>";

		$message .= "<p>Please provide Answers to Unanswered Questions provided below.</p>";
		$message .= "<p>If there is no Answer for a Question then use the below bold text as Answer:</p>";
		$message .= '<p><strong>"This question was answered directly via email or in a meeting. If you require further information, please let us know, and we will reconfirm the answer in writing."</strong></p><br>';
		$message .= "<h3>Project Question Answer Report</h3><br>";
		$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
		$message .= "<tr><td>PQAID</td><td>Project Address</td><td>Question Link</td><td>Customer</td><td>Question</td><td>Create Date</td><td>Count</td><td>Business Stream</td><td>Who to Answer</td><td>Status</td></tr>";
		$bqaIDs = [];

		foreach ($questions as $question) {
			$bqaIDs[] = $question['bqa_id'];
			$bsn_id =  $question['bsn_id'];

			$Statusdate = changedate_y_m_d($question['bqa_created_date']);
			$curdate_y_m_d = date('Y-m-d');
			$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);

			$projlink = "https://www.deckquotes.com.au/business.detail/bsn_id/" . $bsn_id;
			$link = "https://www.deckquotes.com.au/site.answer/bqa_id/" . $question['bqa_id'];

			$message .= "<tr>";
			$message .= "<td>" . $question['bqa_unique_id'] . "</td>";
			$message .= "<td><a href =" . $projlink . " target='_blank'>" . $question['bsn_name'] . "</a></td>";
			$message .= "<td> <a href =" . $link . " target='_blank'>Click To Answer</a></td>";
			$message .= "<td>" . $question['bcust_fname'] . ' ' . $question['bcust_lname'] . "</td>";
			$message .= "<td>" . $question['bqa_que'] . "</td>";
			$message .= "<td>" . $question['bqa_created_date'] . "</td>";
			$message .= "<td>" . $days_at_status . "</td>";
			$message .= "<td>" . $question['bqa_business_stream'] . "</td>";
			$message .= "<td>" . $question['p_name'] . "</td>";
			$message .= "<td> Unanswered</td>";

			$message .= "</tr>";
		}
		$message .= "</table></body></html>";

		$emailObj = new EmailClass;
		$attachments = [];
		$emailObj->subject = 'Project Unanswered Question Answer Report';
		$emailObj->message = $message;
		$emailObj->addFrom('info@cgfb.com.au', 'CGFB');
		// $emailObj->addTo('amans@ephpsolutions.com', 'Aman');
		// $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');

		// db($bqa_who);
		// db($bqaIDs);
		// db($positions[$bqa_who]['p_email']);

		$emailObj->addTo($positions[$bqa_who]['p_email'], $positions[$bqa_who]['p_name']);

		$emailObj->attachments = $attachments;
		$response = $emailObj->sendEmail();
		$emailObj->logSendEmail($response, [
			'module_name' => 'businessqa.list',
			'table_name' => 'business_qa',
			'column_name' => 'bqa_id',
			'column_id' => implode(',', $bqaIDs),
		]);
		if (!$response['success']) {
			$errorLog[] = [
				'to' => $emailObj->to,
				'subject' => $emailObj->subject,
				'error' => $response['message']
			];
		}
	}
}

if (empty($errorLog)) {
	echo 'no error';
} else {
	db($errorLog);
}

exit;
