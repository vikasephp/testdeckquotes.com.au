<?php


$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

$sql = "Update 165_report set  os_reason_fail_comp  = '".$value."' where os_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;