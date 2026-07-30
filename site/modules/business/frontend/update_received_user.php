<?php


$id = $fwRequest->getParam('ppd_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($id))
{
	$sql_1 = "Update progress_payment_detail set  ppd_received_user   = '".$usr."' where ppd_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update progress_payment_detail set  ppd_received_date  = '".$dt."' where ppd_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
}



 exit;