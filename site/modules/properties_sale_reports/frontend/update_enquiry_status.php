<?php

$id = (int)$fwRequest->getParam('psre_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if($id > 0){
	$sql_1 = "Update properties_sale_reports_enquiries set psre_status = '".$value."' where psre_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update properties_sale_reports_enquiries set psre_status_user = '".$usr."' where psre_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update properties_sale_reports_enquiries set psre_status_date = '".$dt."' where psre_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql_data_get = "select psre_status, psre_status_user, psre_status_date from properties_sale_reports_enquiries where psre_id = ".$id;
	$data_get = $fwDb->queryOne($sql_data_get);
	
	echo json_encode($data_get);
}

exit;