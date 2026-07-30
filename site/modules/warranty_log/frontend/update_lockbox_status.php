<?php

$bsn_id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20', ' ', $value);

$user = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if($bsn_id > 0 && $value !== '')
{
	$sql_1 = "Update business set bsn_warranty_lockbox_status = '".$value."' where bsn_id = ".$bsn_id;	 
	$fwDb -> queryOne($sql_1);	
}

exit;