<?php

$id = $fwRequest->getParam('lv_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update lvc_ut_report set  lv_lvc_type  = ".$value." where lv_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;