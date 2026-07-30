<?php

$id = $fwRequest->getParam('va_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update bus_variations  set  va_variation_date  = '".$value."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;