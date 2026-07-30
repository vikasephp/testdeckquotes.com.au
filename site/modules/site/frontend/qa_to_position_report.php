<?php

$positionsql = "select positions.p_id from positions";
$posData = $fwDb->query($positionsql);

$srno=1;
foreach($posData as $k2 => $v2)
{
	$message = "<html> <body>";
	$message .= "<h3> Position Unanswered Question Answer Report</h3><br><br>";
	$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
	$message .= "<tr><td>PQAID</td><td>Project Address</td><td>Link</td><td>Customer</td><td>Question</td><td> Create Date </td>
		     <td>Count</td> <td>Business Stream</td><td>Who to Answer</td><td>Status</td></tr>";
		
	$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname, positions.p_name, positions.p_email,
		business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
		Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
		Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
		Left Join positions ON business_qa.bqa_who = positions.p_id
		where length(trim(business_qa.bqa_ans_plain)) = 0 and business_qa.bqa_who = " .$v2['p_id'];
	
	$paData = $fwDb->query($sql);

	if(!empty($paData))
	{
		foreach($paData as $k => $v)
		{
	
			$Statusdate = changedate_y_m_d($v['bqa_created_date']);
			$curdate_y_m_d = date('Y-m-d');
			$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
				
			$link = "http://www.deckquotes.com.au/business.detail/bsn_id/".$v['bqa_bsn_id'];			
									
			$message .= "<tr>";
			$message .= "<td>".$v['bqa_unique_id']."</td>";
			$message .= "<td>".$v['bsn_name']."</td>";
			$message .= "<td> <a href =".$link.">Link</a></td>";
			$message .= "<td>".$v['bcust_fname'].' '.$v['bcust_lname']."</td>";
			$message .= "<td>".$v['bqa_que']."</td>";
			$message .= "<td>".$v['bqa_created_date']."</td>";
			$message .= "<td>".$days_at_status."</td>";
			$message .= "<td>".$v['bqa_business_stream']."</td>";
			$message .= "<td>".$v['p_name']."</td>";
			$message .= "<td> Unanswered</td>";
			$message .= "</tr>";
			$srno++;
		}
	
	  $message .= "</table></body></html>";
	  
	  $to = $paData[0]['p_email'];
	  $toname = $paData[0]['p_name'];
 	
		db($to);
	
	//send_email($toname, $to, 'CGFB', 'info@cgfb.com.au', 'Position Unanswered Question Answer Report', $message, $attachment='');
	//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Position Unanswered Question Answer Report', $message, $attachment='');
	
	}
}

exit;