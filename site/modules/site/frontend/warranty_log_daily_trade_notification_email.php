<?php

/**
 * Send Email to customers for Warranty Log Action Required 
 */

require_once LIB_DIR . 'EmailClass.php';

$query = "SELECT * FROM warranty_log WHERE STR_TO_DATE(wa_schedule_date, '%d-%m-%Y') = CURDATE()";
$results = $fwDb->query($query);

//echo "<pre>"; print_r($results); exit('Checking');

$suppliers = [];
foreach ($results as $row) {
	
    $supplierText = preg_replace('/<br\s*\/?>/i', "\n", $row['wa_include_supplier']);
    $supplierText = strip_tags($supplierText);
    $supplierList = array_filter(array_map('trim', explode("\n", $supplierText)));
	
    foreach ($supplierList as $supplier) {
        $suppliers[$supplier][] = [
            'project' => $row['wa_project'],
            'problem' => $row['wa_problem']
        ];
    }
}


foreach ($suppliers as $supplier => $jobs) {

    $message = "
	Good morning <strong>{$supplier}</strong>.<br><br>

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

	Keeping the log updated allows the Warranty Manager to monitor progress and arrange any required follow-up.

	<p style='font-size:18px;color:red;font-weight:bold;'>
	Please do check the email for more details.
	</p>

	Please use the Warranty Website to update your assigned logs.<br><br>

	<a href='https://warrantyreport.com.au/supplier/login'>
	Click here to Update
	</a>

	<br><br>Thank you.";	

    // Send email here
	echo $message; 
	//exit('Checking');

	$emailObj = new EmailClass;
	$emailObj->addFrom('warranty@cgfb.com.au', 'CGFB Warranty');
	
	$emailObj->subject = "Trade Notification - Warranty Work Scheduled For Today";
	$emailObj->message = $message;
	
	//$emailObj->addTo($customerEmail, $customerName);
	//$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
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