<?php

$id = $fwRequest->getparam('dolr_id', '');
$column = $fwRequest->getParam('column', '');
$value = urldecode($fwRequest->getparam('value', ''));

$user = $_SESSION['user']['user_name'];

if($id > 0 && $column === 'dolr_date_approved' ){
	$sql = "Update dual_occupancy_lead_report set dolr_date_approved = '".$value."', dolr_date_approved_by = '".$user."' where dolr_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_1 = "Select dolr_date_approved_by from dual_occupancy_lead_report where dolr_date_approved != '' and dolr_date_approved IS NOT NULL and dolr_id = ".$id;
	$getData = $fwDb->queryOne($sql_1);
	
	echo $getData['dolr_date_approved_by'];
}

exit();