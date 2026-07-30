<?php

$sql = "SELECT  business_sellers.bs_business_id, business.bsn_id, business.bsn_name, business.bsn_status, business.bsn_address 
	    from business_sellers 		
	    Inner Join bus_customers ON business_sellers.bs_customers_id = bus_customers.bcust_id 
	    Inner Join business ON business_sellers.bs_business_id = business.bsn_id 
	    And   business.bsn_status like '%|3|%' 
	    Group By business.bsn_id  order by business_sellers.bs_cou_sub_status DESC ";



$paData = $fwDb->query($sql);

 
foreach($paData as $k => $v)
{

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
		$paData[$k]['status'] = $status;
		
}

$message = "<html> <body>";
$message .= "<h3> COO Component Document Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>Project Address</td><td>Link</td><td>Status</td></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bqa_created_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
					
				$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;			
		     								
				$message .= "<tr>";
				$message .= "<td>".$v['bsn_name']."</td>";
				$message .= "<td> <a href =".$link.">Link</a></td>";
				$message .= "<td>".$v['status']."</td>";
				$message .= "</tr>";
				$srno++;
   }

$message .= "</table></body>";
$message .= "<br>Regards,<br>CGFB Operation Team";
$message .= "</html>";

		

send_email('COO Manager', 'coo@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'COU Component Document Report', $message, $attachment='');
send_email('COO Manager', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'COU Component Document Report', $message, $attachment='');

exit;