<?php


$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');


	$sql = "Update 165_report set  os_da_approved  = '".$value."' where os_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;