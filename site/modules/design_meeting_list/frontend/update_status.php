<?php

$id = $fwRequest->getParam('dm_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);
	
	$sql_1 = "Update debt_management set  dm_status  = '".$value."' where dm_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;