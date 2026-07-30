<?php

$id = $fwRequest->getParam('rl_id', '');
$value = $fwRequest->getparam('value', '');
	
	$sql_1 = "Update referral_log set  rl_email_to   = '".$value."' where rl_id = ".$id;	 
	$fwDb -> queryOne($sql_1);

 exit;