<?php
$fwAuthGroup->forceLogin();
$dt = date('d-m-Y');


$subject = "Support Productivity Report -".$dt;
$sql = "SELECT * from frank_staff";
$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<p>Hi Frank,<p>";
$message .= "<p>Please have a look on Today's Support Productivity Report :".$dt." <p>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>SrNo</td><td>Name</td><td>Position Responsible</td><td>Email Responsible</td><td>What They Do</td>
             <td> Workload Capacity </td><td>Report To</td><td>Where the DSR goes</td><td>Work With</td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
							
		     								
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['f_name']."</td>";
				$message .= "<td>".$v['f_position']. "</td>";
				$message .= "<td>".$v['f_email']."</td>";
				$message .= "<td>".$v['f_what_do']."</td>";
				$message .= "<td>".$v['f_work_load']."</td>";
				$message .= "<td>".$v['f_report_to']."</td>";
				$message .= "<td>".$v['f_where_dsr']."</td>";
				$message .= "<td>".$v['f_work_with']."</td>";
				
				$message .= "</tr>";
				$srno++;
   }

$message .= "</table></body></html><br><br>";
//$message .= "Thanks & Regards,<br>
//Ashish <br>
//General Manager<br>
//Ephpsolutions Company<br>
//www.ephpsolutions.com<br>";
//$message .= "<img src='https://www.deckquotes.com.au/images/sign.jpg'>";

//send_email('Saurabh', 'manojsoniephp@gmail.com', 'Ashish Thumbe', 'ashisht@ephpsolutions.com', $subject, $message, $attachment='');	

		
//send_email('Frank Walmsley', 'clientservices@cgfb.com.au', 'Ashish Thumbe', 'ashisht@ephpsolutions.com', $subject, $message, $attachment='');	
send_email('Dipali', 'supportmanager@cgfb.com.au', 'Dipali', 'supportmanager@cgfb.com.au', $subject, $message, $attachment='');	
//send_email('Jason', 'proposalcoordinator@cgfb.com.au, ', 'Ashish Thumbe', 'ashisht@ephpsolutions.com', $subject, $message, $attachment='');	
//send_email('Simon', 'resourcemanager@cgfb.com.au , ', 'Ashish Thumbe', 'ashisht@ephpsolutions.com',$subject, $message, $attachment='');	
//send_email('Vikas', 'vikas@ephpsolutions.com', 'Ashish Thumbe', 'ashisht@ephpsolutions.com', $subject, $message, $attachment='');	
//send_email('Saurabh', 'saurabhv@ephpsolutions.com', 'Ashish Thumbe', 'ashisht@ephpsolutions.com', $subject, $message, $attachment='');	

db($message);
		
exit;