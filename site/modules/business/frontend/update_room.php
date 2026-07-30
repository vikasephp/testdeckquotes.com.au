<?php

$id = $fwRequest->getParam('pi_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if($id){
	$sql = "Update project_item set pi_room_id = ".$value." where pi_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_1 = "Update project_item set pi_room_updated_by = '".$usr."' where pi_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update project_item set pi_room_updated_at = '".$dt."' where pi_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_output = "select pi_room_updated_by, pi_room_updated_at from project_item where pi_room_id != '-1' and pi_id = ".$id;
	$data = $fwDb->queryOne($sql_output);
	
	echo $data['pi_room_updated_by']."<br/>".$data['pi_room_updated_at'];
}

exit;