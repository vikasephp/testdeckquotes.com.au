<?php

$id = $fwRequest->getparam('bsn_id', '');
$column = $fwRequest->getParam('column', '');
$value = urldecode($fwRequest->getparam('value', ''));

if($id > 0 && $column === 'bt_meeting_date' ){
	$sql = "Update business_tasks set bt_meeting_date = '".$value."' where bt_task_id = 553 and bt_bsn_id = ".$id;	
echo $sql;	
	$fwDb -> queryOne($sql);
}

exit('Success');