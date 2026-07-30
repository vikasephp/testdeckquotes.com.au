<?php
$id = $fwRequest->getParam('va_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($id))
{
	$sql1 = "Update bus_variations set  va_inv_created   = ".$value." where va_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql1 = "Update bus_variations set  va_inv_cr_user   = '".$usr."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql1 = "Update bus_variations set  va_inv_cr_date   = '".$dt."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	
	$sql = "Select va_inv_cr_user, va_inv_cr_date from bus_variations  where va_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	echo $data['va_inv_cr_user'] . "<br>".$data['va_inv_cr_date'];
}

 exit;