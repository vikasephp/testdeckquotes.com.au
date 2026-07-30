<?php

$sql = "SELECT bsn_id, bsn_name, bsn_status from business ";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3> Daily Business Status Email</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>Project Address</td><td>Link</td><td>Status</td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;	
				
				$status_string = "'".$v['bsn_status']."'";
				$status='';
		
				if(strpos($status_string, '|1|') > 0) { $status .= "Convert<br>" ; }
				if(strpos($status_string, '|2|') > 0) { $status .= "Planning Approvals<br>" ; }	
				if(strpos($status_string, '|3|') > 0) { $status .= "Construction<br>" ; }
				if(strpos($status_string, '|4|') > 0) { $status .= "Complete<br>" ; }
				if(strpos($status_string, '|5|') > 0) { $status .= "Inclusions<br>" ; }
				if(strpos($status_string, '|6|') > 0) { $status .= "Pre-construction<br>" ; }
				if(strpos($status_string, '|12|') > 0) { $status .= "Design Phase<br>" ; }
				if(strpos($status_string, '|15|') > 0) { $status .= "Lost" ; }
						
		     								
				$message .= "<tr>";
				
				$message .= "<td>".$v['bsn_name']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
				$message .= "<td>".$status."</td>";
				$message .= "</tr>";
				$srno++;
   }

$message .= "</table></body></html>";


	send_email('coo', 'coo@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Daily Business Status Email', $message, $attachment='');	
		
	

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Project Question Answer Report', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Project Question Answer Report', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Daily Business Status Email', $message, $attachment='');

exit;