<?php

$id = $fwRequest->getParam('tn_id', '');
$value = trim($fwRequest->getparam('value', ''));

if($id > 0){
	$escaped_value = addslashes($value);
	$sql_1 = "Update site_progress_report_task set tn_linked_event = '".$escaped_value."' where tn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}
	
exit;