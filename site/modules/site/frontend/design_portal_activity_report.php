<?php	

/**
 * Send Email to Selected Emails regarding Design Portal Activity Report
 */
 
$sql = "SELECT CUST.bcust_fname, CUST.bcust_lname, BUS.bsn_name, logged_users.lu_login_date_time, logged_users.lu_download_docs FROM logged_users 
INNER JOIN business BUS ON BUS.bsn_id = logged_users.lu_bsn_id 
INNER JOIN bus_customers CUST ON CUST.bcust_user_id = logged_users.lu_user_id 
WHERE logged_users.lu_planning_approval = 1 AND lu_bsn_id > 0 AND logged_users.lu_login_date_time >= CURDATE() - INTERVAL 1 DAY
AND logged_users.lu_login_date_time < CURDATE() ORDER BY lu_id DESC";
$data = $fwDb->query($sql);

//echo "<pre>"; print_r($data); //exit('Checking');
if ($data && count($data) > 0) {
	$message = "<html> <body>";
	$message .= "<p>Hi,</p>";
	$message .= "<p>Please see the <strong>Design Portal Activity Report</strong> table.</p><br/>";
	//$message .= "<h3>Design Portal Activity Report</h3><br><br>";
	$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
	$message .= "<tr>";
	$message .= "<td> Sr. No. </td>";
	$message .= "<td> User Name </td>";
	$message .= "<td> Project Address </td>";
	$message .= "<td> Login Time </td>";
	$message .= "<td> Downloaded Document </td>";
	$message .= "</tr>";

	$srno=1;
	foreach($data as $k => $v)
	{							
		$message .= "<tr>";
		$message .= "<td>".$srno."</td>";
		$message .= '<td>'.$v['bcust_fname'].' '.$v['bcust_lname'].'</td>';
		$message .= '<td>'.$v['bsn_name'].'</td>';
		$message .= '<td>'.$v['lu_login_date_time'].'</td>';
		
		$docs = '';
		if (!empty($v['lu_download_docs'])) {
			$docsArray = json_decode($v['lu_download_docs'], true);
			if (is_array($docsArray)) {
				$docs = implode(', ', $docsArray);
			}
		}
		
		$message .= "<td>".$docs."</td>";

		$message .= "</tr>";
		$srno++;
	}

	$message .= "</table><br/>";
	$message .= "<p>Best regards,<br>CGFB Design Team</p>";
	$message .= "</body></html>";
	
} else {
	$message = "<html> <body>";
	$message .= "<p>Hi,</p>";
	$message .= "<p>No activity logs were recorded on the previous day.</p>";
	$message .= "<p>Best regards,<br>CGFB Design Team</p>";
	$message .= "</body></html>";
}

echo $message; //exit('Checking');

$sqle = "Select ar_receving_email from automated_reports where ar_id = 19";
$emaildata = $fwDb->queryOne($sqle);

$emails = explode(",", $emaildata['ar_receving_email']);

if(!empty($emails)) {
	foreach($emails as $ve)
	{
		send_email('', trim($ve), 'CGFB Design Team', 'info@cgfb.com.au', 'Design Portal Activity Report', $message, $attachment='');
		//send_email('Support', 'supportmanager@cgfb.com.au', 'CGFB Design Team', 'info@cgfb.com.au', 'Design Portal Activity Report', $message, $attachment='');
		//send_email('Tester', 'arun@ephpsolutions.com', 'CGFB Design Team', 'info@cgfb.com.au', 'Design Portal Activity Report', $message, $attachment='');
		//send_email('Rahul', 'rahul@ephpsolutions.com', 'CGFB Design Team', 'info@cgfb.com.au', 'Design Portal Activity Report', $message, $attachment='');
	}
}
exit;