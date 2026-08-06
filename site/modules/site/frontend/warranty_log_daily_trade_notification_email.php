<?php

/**
 * Send Email to Trades for Warranty Jobs Scheduled Today
 */

require_once LIB_DIR . 'EmailClass.php';

$query = "SELECT * FROM warranty_log WHERE STR_TO_DATE(wa_schedule_date, '%d-%m-%Y') = CURDATE()";
$results = $fwDb->query($query);

$sql_bsn_name = "SELECT bsn_name, bsn_address FROM business";
$data_bsn_name = $fwDb->query($sql_bsn_name);

$businessMap = [];
foreach ($data_bsn_name as $bsn_name) {
    $businessMap[$bsn_name['bsn_name']] = $bsn_name['bsn_address'];
}

//echo "<pre>"; print_r($results); exit('Checking');

$suppliers = [];
foreach ($results as $row) {

    preg_match_all('/co_id\/(\d+)\/wa_id\/(\d+)[^>]*>([^<]+)<\/a>/i', $row['wa_include_supplier'], $matches, PREG_SET_ORDER);

    foreach ($matches as $match) {

        $co_id = (int)$match[1];
        $wa_id = (int)$match[2];
        $supplier = trim($match[3]);

        if (!isset($suppliers[$supplier])) {
            $suppliers[$supplier] = [
                'co_id' => $co_id,
                'wa_ids' => [],
                'jobs' => []
            ];
        }

        $suppliers[$supplier]['wa_ids'][$wa_id] = $wa_id;
		
		$project = $row['wa_project'];
		if (isset($businessMap[$project])) {
			$project = $businessMap[$project];
		}
		
		$lastComma = strrpos($project, ',');
		if ($lastComma !== false) {
			$project = substr($project, 0, $lastComma);
		}
		
        $suppliers[$supplier]['jobs'][] = [
			'project' => $project,
            'problem' => $row['wa_problem']
        ];
    }
}


foreach ($suppliers as $supplier => $data) {

    $jobs = $data['jobs'];
    $co_id = $data['co_id'];
    $wa_ids = implode(',', $data['wa_ids']);

    $message = "
	Good morning<br><br>

	You are scheduled for the following warranty jobs today:<br><br>";

    foreach ($jobs as $job) {
        $message .= "<strong>{$job['project']}</strong><br>";
        $message .= "&#8226; {$job['problem']}<br><br>";
    }

    $message .= "
	Please update each log, regardless of whether:
	<ul>
	<li>the work was completed</li>
	<li>the work could not be completed</li>
	<li>further information is required</li>
	<li>additional work is required</li>
	<li>the log was allocated incorrectly</li>
	<li>the work needs to be rescheduled</li>
	<li>you have questions regarding the work</li>
	</ul>

	Keeping the log updated allows the Warranty Manager to monitor progress and arrange any required follow-up.<br><br>

	Please use the Warranty Website to update your assigned logs.<br><br>

	<a href='https://warrantyreport.com.au/supplier/login'>
	Click here to Update
	</a>

	<br><br>Thank you.<br>";	

    // Send email here
	echo $message; 
	//exit('Checking');
	
	$sql_contact = "SELECT DISTINCT c.cs_first_name, c.cs_surname, c.cs_primary_email, c.cs_mobile FROM contacts c INNER JOIN supplier_email_warranty sew ON sew.se_email = c.cs_primary_email WHERE c.cs_company = {$co_id} AND sew.se_wa_id IN ({$wa_ids})";
	$contacts = $fwDb->query($sql_contact);
	
	if (empty($contacts)) {
		// echo "Skipping {$supplier} - no contacts selected.<br>";
		continue;
	}

	//echo "<pre>"; print_r($contacts);

	$emailObj = new EmailClass;
	$emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
	
	$emailObj->subject = "Trade Notification - Warranty Work Scheduled For Today";
	$emailObj->message = $message;
	
	foreach ($contacts as $contact) {
		/* $emailObj->addTo(
			$contact['cs_primary_email'],
			trim($contact['cs_first_name'] . ' ' . $contact['cs_surname'])
		); */
	}
	//$emailObj->addTo($customerEmail, $customerName);
	$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
	$emailObj->addTo('arun@ephpsolutions.com', 'Tester');
	$emailObj->attachments = [];
	
	$response = $emailObj->sendEmail();
	/* $emailObj->logSendEmail($response, [
		'module_name' => 'inspection_warranty_log.home',
		'table_name' => 'business',
		'column_name' => 'bsn_id',
		'column_id' => $log_bsn,
	]);
	if (!$response['success']) {
		$emailErrorLog[] = [
			'to' => $emailObj->to,
			'subject' => $emailObj->subject,
			'error' => $response['message']
		];
	} */
	// db($emailObj);
	echo $html;
}
 
if (!empty($emailErrorLog)) {
    db($emailErrorLog);
}

exit;