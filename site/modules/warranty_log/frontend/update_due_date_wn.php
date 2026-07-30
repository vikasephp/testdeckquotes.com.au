<?php

$id = $fwRequest->getParam('wn_id', '');
$value = $fwRequest->getparam('value', '');

	$sql_1 = "Update warranty_log_notes set  wn_due_date  = '".$value."' where wn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
exit;