<?php

/**
 * Send Timeline Report Letter assigned in https://www.deckquotes.com.au/timeline_report.home
 */

require_once LIB_DIR . 'EmailClass.php';
$emailObj = new EmailClass;

$errorLog = [];

$query = "SELECT * FROM timeline_center WHERE STR_TO_DATE(tc_letter_email, '%d-%m-%Y') BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND DATE_SUB(CURDATE(), INTERVAL 1 DAY) ORDER BY STR_TO_DATE(tc_letter_email, '%d-%m-%Y') DESC";
$results = $fwDb->query($query);

//echo "<pre>"; print_r($results); exit();

$query_count = "SELECT COUNT( CASE WHEN STR_TO_DATE(tc_letter_email, '%d-%m-%Y') BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() THEN 1 END ) AS total_7_days, COUNT( CASE WHEN STR_TO_DATE(tc_letter_email, '%d-%m-%Y') >= DATE_SUB(CURDATE(), INTERVAL 1 DAY) THEN 1 END ) AS total_24_hours FROM timeline_center";
$data_count = $fwDb->query($query_count);

$total7Days = $data_count[0]['total_7_days'];
$total24Hours = $data_count[0]['total_24_hours'];

$html = '
	<p style="margin-bottom: 1px;">Hi Team,</p>
	<p style="margin-bottom: 5px;">Please find the details below for Time Delay Letters.</p>
	<p style="margin-bottom: 5px;">Total Timeline Delay Letters issued in the last 7 days - '. $total7Days .' </p>
	<p style="margin-bottom: 5px;">Total Timeline Delay Letters issued in the last 24 hours - '. $total24Hours .'</p>
	<p style="margin-bottom: 5px;">Letters emailed in the last 24 hours - '. $total24Hours .'</p><br/>

	<table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse">
		<thead>
			<tr>
				<th>Project Name </th>
				<th>Client Name </th>
				<th>Letter Type </th>
				<th>Days Delayed </th>
				<th>Revised Commencement Date </th>
				<th>Revised Completion Date </th>
				<th>Send Pathway </th>
				<th>Date Letter Uploaded </th>
				<th>Date Letter Emailed </th>
				<th>Team Member who issued the letter </th>
			</tr>
		</thead>
		<tbody>
	';
if (!empty($results)) {
	foreach ($results as $row) {
		
		$projectName = addslashes($row['tc_project']);
		
		$customerQuery = "SELECT CONCAT(bc.bcust_fname, ' ', bc.bcust_lname) AS customer_name FROM `business` b JOIN `business_sellers` bs ON bs.bs_business_id = b.bsn_id JOIN `bus_customers` bc ON bc.bcust_id = bs.bs_customers_id WHERE b.bsn_name = '{$projectName}'";
		$customers = $fwDb->query($customerQuery);
		$customerNames = [];
		if (!empty($customers)) {
			foreach ($customers as $customer) {
				$customerNames[] = $customer['customer_name'];
			}
		}
		$customerNames = implode(', ', $customerNames);
		
		$html .= '
				<tr>
					<td>' . $row['tc_project'] . '</td>
					<td>' . $customerNames . '</td>
					<td>' . $row['tc_letter_code'] . '</td>
					<td>' . $row['tc_days_delay'] . '</td>
					<td>' . $row['tc_rev_comm_date'] . '</td>
					<td>' . $row['tc_rev_comp_date'] . '</td>
					<td>' . $row['tc_send_pathway'] . '</td>
					<td>' . $row['tc_letter_email'] . '</td>
					<td>' . $row['tc_letter_email'] . '</td>
					<td>' . $row['tc_who_req'] . '</td>
				</tr>
		';
	}
} else {
	$html .= '<tr><td colspan="10">No Data</td></tr>';
}

$html .= '
            </tbody>
        </table>
        <p style="margin: 15px 0;">Kind Regards, <br/>CGFB Operation Team</p>';

// db($html);
// die();

//echo $html; exit();

$emailObj->subject = 'Daily Time Delay Letter Report Email';
$emailObj->message = $html;
$emailObj->addFrom('info@cgfb.com.au', 'CGFB Team');
/* $emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
$emailObj->addTo('vsaurabh793@gmail.com', 'Saurabh');
$emailObj->addTo('supportmanager@cgfb.com.au', 'Support Manager'); */
$emailObj->addTo('operations@cgfb.com.au', 'Operations');
$emailObj->addTo('construction@cgfb.com.au', 'Construction');
$emailObj->addTo('clientservices@cgfb.com.au', 'Client Services');
$emailObj->addBCC('emailbackup@cgfb.com.au', 'Email Backup Admin (CGFB)');
$emailObj->attachments = [];
$response = $emailObj->sendEmail();
/*$emailObj->logSendEmail($response, [
	'module_name' => 'designer_tracker.home',
	'table_name' => 'task_designer_tracker',
	'column_name' => 'tdt_id',
	'column_id' => implode(',', $tdtIDs),
]);*/
if (!$response['success']) {
	$errorLog[] = [
		'to' => $emailObj->to,
		'subject' => $emailObj->subject,
		'error' => $response['message']
	];
}

if (empty($errorLog)) {
	//echo 'no error';
} else {
	db($errorLog);
}

exit;