<?php

$id = $fwRequest->getParam('sp_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update sub_pages set  sp_last_update  = '".$value."' where sp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;