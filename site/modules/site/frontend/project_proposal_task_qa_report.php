<?php

$sql = "SELECT  business_qa.*, bus_customers.bcust_fname, bus_customers.bcust_lname, positions.p_name, 
        business.bsn_id, business.bsn_name,business.bsn_sub_status, business.bsn_status_sys_date from business_qa 		
		Inner Join bus_customers ON business_qa.bqa_cust_id = bus_customers.bcust_id 
		Inner Join business ON business_qa.bqa_bsn_id = business.bsn_id 
		Left Join positions ON business_qa.bqa_who = positions.p_id
		where length(trim(business_qa.bqa_ans_plain)) = 0 ";


//$sql1 ="SELECT * FROM ps_que_ans where length(trim(ps_answer))  = 0 ";
//$sql2 = "SELECT * FROM proposal_que_ans where length(trim(ps_answer))  = 0" ;


$sql1 = "SELECT ps_que_ans.* , busness_status_task.bst_task_name
FROM ps_que_ans
LEFT JOIN busness_status_task ON ps_que_ans.ps_task_id = busness_status_task.bst_task_id
WHERE LENGTH( TRIM( ps_answer ) ) =0";

$sql2 = "SELECT proposal_que_ans . * , proposal_task_list.bst_task_name
FROM proposal_que_ans
LEFT JOIN proposal_task_list ON proposal_que_ans.ps_task_id = proposal_task_list.bst_task_id
WHERE LENGTH( TRIM( ps_answer ) ) =0";

$qaData1 = $fwDb->query($sql1);
$qaData2 = $fwDb->query($sql2);

$message = "<html> <body>";
$message .= "<h3> Project Status And Proposal Status Task Unanswerd Question Report</h3><br><br>";
$message .= "<table border ='1' cellpadding='3' cellspacing='0' style='border-collapse:collapse'>";
$message .= "<tr><td>Srno</td><td>Task Id </td><td>Task Type </td><td>Task Name</td><td>Link</td><td>Question</td></tr>";


	$srno=1;
	foreach($qaData1 as $k1 => $v1)
	{
				$link1 = "http://www.deckquotes.com.au/business_status_taskAdmin.detail/bst_id/".$v1['ps_task_id'];
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v1['ps_task_id']."</td>";
				$message .= "<td>Project</td>";
				$message .= "<td>".$v1['bst_task_name']."</td>";
				$message .= "<td> <a href =".$link1.">Link</a></td>";
    				$message .= "<td>".$v1['ps_question']."</td>";
			
				$message .= "</tr>";
				$srno++;
   }

	foreach($qaData2 as $k2 => $v2)
	{
				$link2 = "http://www.deckquotes.com.au/business_status_taskAdmin.detail/bst_id/".$v2['ps_task_id'];
				$message .= "<tr>";
				$message .= "<td>".$srno."</td>";
				$message .= "<td>".$v2['ps_task_id']."</td>";
				$message .= "<td> Proposal</td>";
				$message .= "<td>".$v2['bst_task_name']."</td>";
				$message .= "<td> <a href =".$link2.">Link</a></td>";
    				$message .= "<td>".$v2['ps_question']."</td>";
			
				$message .= "</tr>";
				$srno++;
   }

   $message .= "</table></body></html>";
	
 	
	$sqle = "Select ar_receving_email from automated_reports where ar_id = 9";
	$emaildata = $fwDb->queryOne($sqle);
	
	$emails = explode(",", $emaildata['ar_receving_email']);
	
	if(!empty($emails)) {
		foreach($emails as $ve)
		{
			send_email('Frank Walmsley', trim($ve), 'CGFB', 'info@cgfb.com.au', 'Project Status And Proposal Status Task Unanswerd Question Report', $message, $attachment='');	
		}
	}

//send_email('Manoj Soni', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', 'Project Status And Proposal Status Task Unanswerd Question Report', $message, $attachment='');

exit;