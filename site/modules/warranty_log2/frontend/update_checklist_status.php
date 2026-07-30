<?php

$id = $fwRequest->getParam('ch_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($value))
{
	$sql_1 = "Update warranty_checklist set  ch_status  = '".$value."' where ch_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update warranty_checklist set  ch_user  = '".$user."' where ch_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update warranty_checklist set  ch_date  = '".$dt."' where ch_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql_4 = "select ch_user, ch_date  from warranty_checklist where ch_id = ".$id;
	$ud = $fwDb->queryOne($sql_4);
	
	$user_date = $ud['ch_user']."<br>".$ud['ch_date'];
	echo $user_date;
	
}


 exit;