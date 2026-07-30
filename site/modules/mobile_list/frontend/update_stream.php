<?php

$id = $fwRequest->getParam('mo_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update mobile_list set  mo_stream  = ".$value." where mo_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;