<?php

$sql = "SELECT business.bsn_id, business.bsn_name, business_alert.*, users.user_name from business_alert 		
		Inner Join business ON business_alert.be_business_id  = business.bsn_id	 
		Inner Join users ON business_alert.be_user = users.user_id where business_alert.be_alert_active = 'Yes'
		Order by  business_alert.be_id DESC";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3>Alert Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='5' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Project</td><td>Link</td><td>What is the Alert</td><td>Who Created</td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
			$bsn_id =  $v['bsn_id'];

			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;	
				
			$message .= "<tr>";
			$message .= "<td>".$srno."</td>";
			$message .= "<td>".$v['bsn_name']."</td>";
			$message .= "<td> <a href =".$link.">Link</a></td>";
			$message .= "<td>".$v['be_alert_text']."</td>";
			$message .= "<td>".$v['user_name']."</td>";

			$message .= "</tr>";
			$srno++;
  }

$message .= "</table></body></html>";

		$sqle = "Select ar_receving_email from automated_reports where ar_id = 4";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) {
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Alert Report', $message, $attachment='');	
			}
		}

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Alert Report', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Alert Report', $message, $attachment='');
//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Alert Report', $message, $attachment='');

exit;