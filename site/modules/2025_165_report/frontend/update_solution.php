<?php


$id = $fwRequest->getParam('os2_id', '');
$value = $fwRequest->getparam('value', '');

$sql = "Update 2025_165_report set  os2_solution     = '".$value."' where os2_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;