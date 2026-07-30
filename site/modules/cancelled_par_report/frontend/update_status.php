<?php

$id = $fwRequest->getParam('cp_id', '');
$value = $fwRequest->getparam('value', '');


$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];	
	
	$sql_1 = "Update cancelled_par_report set  cp_contact_status  = '".$value."' where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_1 = "Update cancelled_par_report set  cp_contact_status  = '".$value."' where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	

	$sql_1 = "Update cancelled_par_report set  cp_contact_status  = '".$value."' where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	

 exit;