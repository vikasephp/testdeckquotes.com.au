<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace("%20"," ",$value);

	$sql5 = "Update business set  bsn_bar_block_type   = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql5);


 exit;