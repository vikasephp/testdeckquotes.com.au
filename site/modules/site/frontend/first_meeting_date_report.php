<?php

$sql = "SELECT business.bsn_id, business.bsn_name, business.bsn_initial_meeting_date from business
        where bsn_initial_meeting_date <> ''";
$paData = $fwDb->query($sql);

$cdate =  date("d-m-Y");


foreach($paData as $k => $v)
{
	
	$tdate = changedate_d_m_y(date('Y-m-d', strtotime($v['bsn_initial_meeting_date'] .' 10 day')));
	if($cdate == $tdate)
	{
		$message = "<html> <body>";
		$message .= "<p>Hi Don,</p>";
		$message .= "<p>Just a reminder to send Feature Box One is due for this project</p>";
		$message .= "<p>And please have the subject line read: Send Feature Box One - " .$v['bsn_name']."</p><br>";
		$message .= "<p>Kind Regards,</p>";
		$message .= "<p>CGFB Team</p>";
		$message .= "</body></html>";
		send_email('Design Coordinator', 'designscoordinator@cgfb.com.au', 'CGFB', 'info@cgfb.com.au', 'Reminder to send Feature Box', $message, $attachment='');	
	}
	
	
}
    
 exit;