<?php

$bid = $fwRequest->getParam('bsn_id', 0);
$tid = $fwRequest->getParam('task_id', 0);
$value = $fwRequest->getparam('value', '');


	$sql = "Update business_tasks set  bt_position_resp   = '".$value."' where bt_bsn_id = ".$bid. " And bt_task_id = ".$tid;
	//$sql = "Update business_tasks set bt_position_resp  = '".$value."' where bt_bsn_id = ".$bid;	 
	$fwDb -> queryOne($sql);


 exit;