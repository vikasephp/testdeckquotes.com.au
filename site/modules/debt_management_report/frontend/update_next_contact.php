<?php

$id = $fwRequest->getParam('dm_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update debt_management set  dm_next_contact_date  = '".$value."' where dm_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;