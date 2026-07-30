<?php

$id = $fwRequest->getParam('im_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

$sql_1 = "Update insurance_manager set im_template_email  = ".$value." where im_id = ".$id;	 
$fwDb -> queryOne($sql_1);


$sql_2 = "Update insurance_manager set  im_temp_email_user = '".$usr."' where im_id = ".$id;	 
$fwDb -> queryOne($sql_2);


$sql_3 = "Update insurance_manager set  im_temp_email_date =' ".$dt."' where im_id = ".$id;	 
$fwDb -> queryOne($sql_3);

	$sql4 = "Select im_temp_email_user, im_temp_email_date from insurance_manager where im_id = ".$id;
	$data = $fwDb->queryOne($sql4);
	
	echo $data['im_temp_email_user'].'<br>'.$data['im_temp_email_date'];


exit;