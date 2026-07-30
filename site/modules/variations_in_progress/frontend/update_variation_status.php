<?php
$id = $fwRequest->getParam('va_id', '');
$value = $fwRequest->getparam('value', '');

$value = addslashes($value);

//$usr = $_SESSION['user']['user_name'];
//$dt = date('d-m-Y');

if(!empty($id))
{
	$sql = "Update bus_variations set va_status = '".$value."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	echo "Success";
}

 exit;