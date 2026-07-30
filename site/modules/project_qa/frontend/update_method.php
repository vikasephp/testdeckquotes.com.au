<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

	$sql = "Update construction_calendar_enquiries set  method  = '".$value."' where id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;