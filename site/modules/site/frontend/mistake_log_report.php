<?php

/*
Mistake Log Record
*/

require_once LIB_DIR . 'EmailClass.php';
$emailObj = new EmailClass;

$errorLog = [];

$sql = "SELECT mls.mls_id, mls.mls_option, COUNT( CASE WHEN STR_TO_DATE(ml.ml_date, '%d-%m-%Y') = CURDATE() - INTERVAL 1 DAY THEN 1 END ) AS yesterday_mistakes, COUNT(ml.ml_date) AS total_mistakes FROM mistake_log_stream mls LEFT JOIN mistake_log ml ON ml.ml_stream_option = mls.mls_id GROUP BY mls.mls_id, mls.mls_option ORDER BY mls.mls_id";
$result = $fwDb->query($sql);

//echo "<pre>"; print_r($result); exit("Checking");

if (!empty($result)) {
	
	$sql_count_mistake = "SELECT COUNT(*) AS total FROM mistake_log WHERE STR_TO_DATE(ml_date, '%d-%m-%Y') = CURDATE() - INTERVAL 1 DAY";
	$result_count_mistake = $fwDb->queryOne($sql_count_mistake);
	
	$html = 'Hi,';
	$html .= '<p style="margin: 15px 0;">Please find below the summary of yesterday’s mistake log entries:</p>';
	$html .= 'Date: '.date("d-m-Y", strtotime("yesterday"));
	$html .= '<p style="margin: 15px 0;">Total Logs Added: '.$result_count_mistake['total'].'</p>';
	$html .= '<p style="margin: 15px 0;">Breakdown by Stream:</p>';
    $html .= '
        <table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse">
            <thead>
                <tr>
                    <th>Sr. No.</th>
                    <th>Stream</th>
                    <th>Logs Added Yesterday</th>
					<th>Total Logs</th>
                </tr>
            </thead>
            <tbody>
        ';
	$sr = 1;
    foreach ($result as $row) {
        $html .= '
                <tr>
                    <td>'.$sr.'</td>
                    <td>' . $row['mls_option'] . '</td>
                    <td>' . $row['yesterday_mistakes'] . '</td>
					<td>' . $row['total_mistakes'] . '</td>
                </tr>
        ';
		$sr = $sr+1;
    }
    $html .= '
            </tbody>
        </table>';
		
} else {
	$html = '<p style="margin: 15px 0;">No Log Recorded Yesterday</p>';
}

$html .= '<p style="margin: 15px 0;">This report is generated automatically to provide visibility into daily mistake logging activity.</p>
<p style="margin: 15px 0;">Best Regards,<br>CGFB Design Team</p>';

echo $html; //exit("Checking");

$emailObj->subject = 'Daily Mistake Log Report - Additions Summary';
$emailObj->message = $html;
$emailObj->addFrom('info@cgfb.com.au', 'CGFB');
//$emailObj->addTo('rahul@ephpsolutions.com', 'Rahul');
//$emailObj->addTo('ClientServices@cgfb.com.au', 'Client Services');
$emailObj->addTo('DesignsandPlanning@cgfb.com.au', 'Designs And Planning');
//$emailObj->addTo('Operations@cgfb.com.au', 'Operations CGFB');
$emailObj->attachments = [];
$response = $emailObj->sendEmail();
/* $emailObj->logSendEmail($response, [
	'module_name' => 'designer_tracker.home',
	'table_name' => 'task_designer_tracker',
	'column_name' => 'tdt_id',
]); */
if (!$response['success']) {
	$errorLog[] = [
		'to' => $emailObj->to,
		'subject' => $emailObj->subject,
		'error' => $response['message']
	];
}

if (empty($errorLog)) {
	echo 'no error';
} else {
	db($errorLog);
}

exit;
