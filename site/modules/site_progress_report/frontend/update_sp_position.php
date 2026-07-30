<?php

$id = $fwRequest->getParam('tn_id', '');
$value = $fwRequest->getparam('value', '');

if($id > 0){
	$sql_1 = "Update site_progress_report_task set tn_position = ".$value." where tn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}
	
exit;