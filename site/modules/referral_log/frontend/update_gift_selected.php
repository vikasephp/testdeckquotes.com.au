<?php

$id = $fwRequest->getParam('rl_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);
	
	$sql_1 = "Update referral_log set rl_gift_selected = '".$value."' where rl_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;