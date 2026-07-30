<?php

$id = $fwRequest->getParam('ws_id', '');
$value = $fwRequest->getparam('value', '');

	$sql_1 = "Update warranty_supplier_update set  ws_due_date  = '".$value."' where ws_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
exit;