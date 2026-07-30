<?php

$sql = "SELECT bt_completed_date, bt_bsn_id  from proposal_tasks where bt_task_id = 26";
$paData = $fwDb->query($sql);

$cdate =  date("d-m-Y");


foreach($paData as $k => $v)
{
	
	$tdate = changedate_d_m_y(date('Y-m-d', strtotime($v['bt_completed_date'] .' 14 day')));
	
	if($cdate == $tdate)
	{
		$sql2 = "Select bsn_name from business where bsn_id = ".$v['bt_bsn_id'];
		$bname = $fwDb->queryOne($sql2);
		
		$subject = "Reminder to send Feature Box 2 - ".$bname['bsn_name'];
		
		$message = "<html> <body>";
		$message .= "<p>Hi Don,</p>";
		$message .= "<p>Just a reminder to send Feature Box 2 for this project today</p>";
		$message .= "<p>Project name - " .$bname['bsn_name']."</p><br>";
		$message .= "<p>Kind Regards,</p>";
		$message .= "<p>CGFB Team</p>";
		$message .= "</body></html>";
		
		//send_email('Design Coordinator', 'designscoordinator@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', $subject , $message, $attachment='');	
	send_email('Design Coordinator', 'manojsoniephp@gmail.com', 'CGFB', 'info@cgfb.com.au', $subject , $message, $attachment='');	
	
	}
}
    
 exit;