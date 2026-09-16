<?php


$id = $fwRequest->getParam('aapl_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

	$sql = "Update auction_advantage_phone_log set aapl_message  = '".$value."' where aapl_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;