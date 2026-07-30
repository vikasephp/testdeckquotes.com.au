<?php

$id = $fwRequest->getparam('wa_id', '');
$column = $fwRequest->getParam('column', '');
$value = urldecode($fwRequest->getparam('value', ''));

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if($id > 0 && $column === 'wa_schedule_date' ){
	$sql = "Update warranty_log set wa_schedule_date = '".$value."', wa_schedule_date_by = '".$user."', wa_schedule_date_at = '".$dt."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql_get = "Select wa_schedule_date_by, wa_schedule_date_at from warranty_log where wa_schedule_date != '' and wa_id = ".$id;
	$data_get = $fwDb->queryOne($sql_get);
	
	echo $data_get['wa_schedule_date_by']."<br/>".$data_get['wa_schedule_date_at'];
}

exit();