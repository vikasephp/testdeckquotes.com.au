<?php

$id = $fwRequest->getParam('im_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

$sql_1 = "Update insurance_manager set  im_responsible_person = ".$value." where im_id = ".$id;	 
$fwDb -> queryOne($sql_1);

$sql_2 = "Update insurance_manager set  im_resp_person_user = '".$usr."' where im_id = ".$id;	 
$fwDb -> queryOne($sql_2);


$sql_3 = "Update insurance_manager set  im_resp_person_date =' ".$dt."' where im_id = ".$id;	 
$fwDb -> queryOne($sql_3);

	$sql4 = "Select im_resp_person_user, im_resp_person_date from insurance_manager where im_id = ".$id;
	$data = $fwDb->queryOne($sql4);
	
	echo $data['im_resp_person_user'].'<br>'.$data['im_resp_person_date'];


exit;