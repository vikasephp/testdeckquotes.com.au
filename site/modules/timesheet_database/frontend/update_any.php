<?php

$id1 = $fwRequest->getParam('td_id_1', '');
$id2 = $fwRequest->getParam('td_id_2', '');
$value = $fwRequest->getparam('value', '');

if($id1) {	
	$sql_1 = "Update timesheet_database set   td_any_op_option  = '".$value."' where td_id = ".$id1;	 
	$fwDb -> queryOne($sql_1);
}

if($id2) {	
	$sql_2 = "Update timesheet_database set   td_any_op_value  = '".$value."' where td_id = ".$id2;	 
	$fwDb -> queryOne($sql_2);
}

 exit;