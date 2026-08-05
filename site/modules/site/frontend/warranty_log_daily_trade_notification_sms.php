<?php

/**
 * Send SMS to Trades for Warranty Jobs Scheduled Today
 */

// SMS Credentials
$username = "manojsoniephp";
$password = "jaimatadi108";

$query = "SELECT * FROM warranty_log WHERE STR_TO_DATE(wa_schedule_date, '%d-%m-%Y') = CURDATE()";
$results = $fwDb->query($query);

$sql_bsn_name = "SELECT bsn_name, bsn_address FROM business";
$data_bsn_name = $fwDb->query($sql_bsn_name);

$businessMap = [];
foreach ($data_bsn_name as $bsn_name) {
    $businessMap[$bsn_name['bsn_name']] = $bsn_name['bsn_address'];
}

//echo "<pre>"; print_r($results); exit('checking');

$suppliers = [];
foreach ($results as $row) {

	preg_match_all('/co_id\/(\d+)\/wa_id\/(\d+)[^>]*>([^<]+)<\/a>/i', $row['wa_include_supplier'], $matches, PREG_SET_ORDER);

    foreach ($matches as $match) {

        $co_id = (int)$match[1];
        $wa_id = (int)$match[2];
        $supplier = trim($match[3]);

        if (!isset($suppliers[$supplier])) {
            $suppliers[$supplier] = [
                'co_id'  => $co_id,
                'wa_ids' => [],
                'jobs'   => []
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
			'wa_id'   => $wa_id,
			'project' => $project
		];
    }
}

//echo "<pre>"; print_r($suppliers); exit();
foreach ($suppliers as $supplier => $data) {

    $jobs = $data['jobs'];
    $co_id = $data['co_id'];
    $wa_ids = implode(',', $data['wa_ids']);
	
	$sql_contact = "SELECT DISTINCT c.cs_first_name, c.cs_surname, c.cs_primary_email, c.cs_mobile FROM contacts c INNER JOIN supplier_email_warranty sew ON sew.se_email = c.cs_primary_email WHERE c.cs_company = {$co_id} AND sew.se_wa_id IN ({$wa_ids})";
	$contacts = $fwDb->query($sql_contact);
	
	//echo "<pre>"; print_r($contacts); exit();

    if (empty($contacts)) {
        continue;
    }

    //$smsMessage = "Good morning {$supplier}.\n\n";
	$smsMessage = "Good morning\n\n";
    $smsMessage .= "You are scheduled for the following warranty jobs today:\n\n";

    foreach ($jobs as $job) {
        $smsMessage .= "{$job['project']}\n";
        $smsMessage .= "• Log Number {$job['wa_id']}\n\n";
    }

    $smsMessage .= "Please update each log, regardless of whether:\n";
    $smsMessage .= "- the work was completed\n";
    $smsMessage .= "- the work could not be completed\n";
    $smsMessage .= "- further information is required\n";
    $smsMessage .= "- additional work is required\n";
    $smsMessage .= "- the log was allocated incorrectly\n";
    $smsMessage .= "- the work needs to be rescheduled\n";
    $smsMessage .= "- you have questions regarding the work\n\n";

    $smsMessage .= "Keeping the log updated allows the Warranty Manager to monitor progress and arrange any required follow-up.\n\n";

    $smsMessage .= "Please check your email for more details.\n\n";

    $smsMessage .= "Please use the Warranty Website to update your assigned logs.\n\n";

    $smsMessage .= "Thank you.";
	
	//echo $smsMessage;
	//echo "<pre>"; print_r($contacts); exit();

    foreach ($contacts as $contact) {

        if (empty($contact['cs_mobile'])) {
            continue;
        }

        //$to = preg_replace('/\D/', '', $contact['cs_mobile']);
		$to = "61485982524";
 
        if (strpos($to, '04') === 0) {
            $to = '61' . substr($to, 1);
        }

        $type = "1-way";
        $senderid = "CGFB";

        $url = "http://api.directsms.com.au/s3/http/send_message?" .
            "username=" . urlencode($username) . "&" .
            "password=" . urlencode($password) . "&" .
            "message=" . urlencode($smsMessage) . "&" .
            "type=" . urlencode($type) . "&" .
            "senderid=" . urlencode($senderid) . "&" .
            "to=" . urlencode($to);

        // Send SMS
		$output = file($url);

        //Debug
        echo "<pre>";
        echo $supplier . " -> " . $to . PHP_EOL;
        echo $smsMessage . PHP_EOL;
        echo "<pre>"; 
		print_r($output);
    }
}

exit;