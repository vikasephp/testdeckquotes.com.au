<?php

$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname, positions.p_name, positions.p_email,
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
		Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
		Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
		Left Join positions ON business_qa.bqa_who = positions.p_id
		where length(trim(business_qa.bqa_ans_plain)) = 0 and business_qa.bqa_created_date >= '2025-01-01' ";

$paData = $fwDb->query($sql);


$sqlpos = "select p_id, p_name, p_email from positions where length(p_email) > 0";
$posData = $fwDb->query($sqlpos);




foreach($posData as $pk => $pv) 
{
	$message = "<html> <body>";
	$message .= "<p>Hello ".$pv['p_name']."</p>";
	
	$message .= "<p>Please provide Answers to Unanswered Questions provided below.</p>";
	$message .= "<p>If there is no Answer for a Question then use the below bold text as Answer:</p>";
	$message .= '<p><strong>"This question was answered directly via email or in a meeting. If you require further information, please let us know, and we will reconfirm the answer in writing."</strong></p><br>';
	$message .= "<h3>Project Question Answer Report</h3><br>";
	$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
	$message .= "<tr><td>PQAID</td><td>Project Address</td><td>Question Link</td><td>Customer</td><td>Question</td><td> Create Date </td>
			<td>Count</td> <td>Business Stream</td><td>Who to Answer</td><td>Status</td></tr>";
	$srno=1;
	foreach($paData as $k => $v)
	{
		
		if($pv['p_id'] == $v['bqa_who']) 
		{
		
				$bsn_id =  $v['bsn_id'];
		
				$Statusdate = changedate_y_m_d($v['bqa_created_date']);
				$curdate_y_m_d = date('Y-m-d');
				$days_at_status = daysDifference($curdate_y_m_d, $Statusdate);
					
				$projlink = "http://www.deckquotes.com.au/business.detail/bsn_id/".$bsn_id;	
				$link = "http://www.deckquotes.com.au/site.answer/bqa_id/".$v['bqa_id'];		
		     								
				$message .= "<tr>";
				$message .= "<td>".$v['bqa_unique_id']."</td>";
				$message .= "<td><a href =".$projlink." target='_blank'>".$v['bsn_name']."</a></td>";
				$message .= "<td> <a href =".$link." target='_blank'>Click To Answer</a></td>";
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
   }

	$message .= "</table></body></html>";
	//db($pv['p_email']);
	if($srno>1) {
		//db($pv['p_email']);
	//db($message);
	  send_email($pv['p_name'], $pv['p_email'], 'CGFB', 'info@cgfb.com.au', 'Project Unanswered Question Answer Report', $message, $attachment='');
		
	}
	
}

exit;
