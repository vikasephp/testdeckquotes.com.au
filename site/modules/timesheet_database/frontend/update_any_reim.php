<?php

$id = $fwRequest->getParam('td_id', '');
$value = $fwRequest->getparam('value', '');

if($id) {	
	$sql_1 = "Update timesheet_database set   td_any_reim  = '".$value."' where td_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}

 exit;