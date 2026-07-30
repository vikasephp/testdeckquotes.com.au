<?php

$id = $fwRequest->getParam('cp_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];	
	
	$sql_1 = "Update cancelled_par_report set  cp_contact_att  = ".$value." where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update cancelled_par_report set  cp_contact_att_usr = '".$usr."' where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_2);


	$sql_3 = "Update cancelled_par_report set  cp_contact_att_dt =' ".$dt."' where cp_id = ".$id;	 
	$fwDb -> queryOne($sql_3);

	$sql4 = "Select cp_contact_att_usr, cp_contact_att_dt from cancelled_par_report where cp_id = ".$id;
	$data = $fwDb->queryOne($sql4);
	
	echo $data['cp_contact_att_usr'].'<br>'.$data['cp_contact_att_dt'];
	

 exit;