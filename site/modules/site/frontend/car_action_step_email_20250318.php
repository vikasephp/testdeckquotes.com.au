<?php

$sql_who =  "Select * from action_plan_step_detail where apd_email_report  = 1";
$whodata = $fwDb->query($sql_who);

$current_date1 = date('Y-m-d');
$day = date("D", strtotime($current_date1));

foreach($whodata as $k => $v)
{
		$who = explode("-",$v['apd_who']);
		$to = trim($who[1]);
		$to_name = trim($who[0]);
		$from = "info@cgfb.com.au";
		$from_name = "CGFB Operations Team";
		$subject = "Action Step";
		
		$sql_proj = "select car_project, car_status from construction_alert_report where car_id =  ".$v['apd_car_id'];
		$projdata = $fwDb->queryOne($sql_proj);
		
		
		$message = "Hi ".$to_name."<br><br>";
		$message .= "Please see the action plan for ".$projdata['car_project']."<br>";
		$message .= $whodata['apd_step_desc']."<br><br>";
		$message .= "Regards,<br>";
		$message .= "CGFB Operations Team";
		
		if($projdata['car_status'] == 'Open') {
			if($day == 'Fri') {
				send_email($to_name, $to, $from_name, $from, $subject, $message, $attachment='');
			}
		}
	
}

exit;