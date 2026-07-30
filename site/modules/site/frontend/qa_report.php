<?php

$sql = "select customer_qa.* from customer_qa ";

$paData = $fwDb->query($sql);

$message = "<html> <body>";
$message .= "<h3> Customer Questions Answers </h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><th>SrNo</th><th>Customer Name</th><th>Project Name</th>
		    <th width='3%'>Project Status</th><th width='20%'>Question</th><th width='20%'>Answer</th><th>Position Taged </th><th>Email Date</th>
			<th width='5%'>Create Date</th><th width='5%'>User Create</th><th> Who A: </th></tr>";

	$srno=1;
	foreach($paData as $k => $v)
	{
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v['cqa_customer_name']."</td>";
				$message .= "<td>".$v['cqa_project_name']."</td>";
				$message .= "<td>".$v['cqa_project_status']."</td>";
			    $message .= "<td>".$v['cqa_question']."</td>";
				$message .= "<td>".$v['cqa_answer']."</td>";
				$message .= "<td>".$v['cqa_position_taged']."</td>";
				$message .= "<td>".$v['cqa_email_date']."</td>";
				$message .= "<td>".$v['cqa_create_date']."</td>";
				$message .= "<td> ".$v['cqa_user_create']." </td>";
				$message .= "<td> ".$v['cqa_who']." </td>";
				$message .= "</tr>";
				$srno++;
   }

   $message .= "</table></body></html>";

		$sqle = "Select ar_receving_email from automated_reports where ar_id = 6";
		$emaildata = $fwDb->queryOne($sqle);
		
		$emails = explode(",", $emaildata['ar_receving_email']);
		
		if(!empty($emails)) {
			foreach($emails as $ve)
			{
				send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Customer Questions Answers', $message, $attachment='');	
			}
		}

//send_email('Frank Walmsley', 'marketing@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Customer Questions Answers', $message, $attachment='');
//send_email('Frank Walmsley', 'info@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Customer Questions Answers', $message, $attachment='');
send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Customer Questions Answers', $message, $attachment='');

exit;
	