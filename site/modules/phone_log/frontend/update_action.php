<?php


$id = $fwRequest->getParam('ph_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql_1 = "Update phone_log set  ph_actioned  = '".$value."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update phone_log set  ph_actioned_user  = '".$usr."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update phone_log set  ph_actioned_date  = '".$dt."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "Select ph_actioned_user, ph_actioned_date from phone_log where ph_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	echo $data['ph_actioned_user'].'<br>'.$data['ph_actioned_date'];
	
}


 exit;