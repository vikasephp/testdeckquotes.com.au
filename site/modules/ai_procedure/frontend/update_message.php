<?php


$id = $fwRequest->getParam('ph_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

	$sql = "Update phone_log set ph_message  = '".$value."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;