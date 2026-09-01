<?php

$id = (int)$fwRequest->getParam('pdr_id', '');
$value = trim($fwRequest->getparam('value', ''));

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if($id > 0){
	$escaped_value = addslashes($value);
	$sql = "Update project_delay_register set pdr_location = '".$value."' where pdr_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_1 = "Update project_delay_register set pdr_location_updated_by = '".$user."' where pdr_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update project_delay_register set pdr_location_updated_at = '".$dt."' where pdr_id = ".$id;	 
	$fwDb -> queryOne($sql_2);	
	
	$sql_get = "Select pdr_location_updated_by, pdr_location_updated_at from project_delay_register where pdr_id = ".$id;
	$get_data = $fwDb->queryOne($sql_get);
	
	echo $get_data['pdr_location_updated_by']."<br/>".$get_data['pdr_location_updated_at'];
}

 exit;