<?php

$id = $fwRequest->getParam('car_id', '');
$value = $fwRequest->getparam('value', '');
$reason = $fwRequest->getparam('reason', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($id))
{
	$sql1 = "Update construction_alert_report set  car_add_to_ae  = ".$value." where car_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql2 = "Update construction_alert_report set  car_escalation_date  = '".$dt."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update construction_alert_report set  car_escalation_user  = '".$usr."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql4 = "Update construction_alert_report set  car_esc_reason  = '".$reason."' where car_id = ".$id;	 
	$fwDb -> queryOne($sql4);
	
	$sql = "select car_escalation_date, car_escalation_user from construction_alert_report where  car_id = ".$id;
	$detail = $fwDb -> queryOne($sql);
	
	if($value == 1) {
			echo $detail['car_escalation_date'].'<br>'.$detail['car_escalation_user'];
	}
}

 exit;