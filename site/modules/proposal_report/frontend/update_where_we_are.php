<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$value2 = str_replace('%20',' ',$value);

	$sql = "Update business set bsn_where_we_are  = '".$value2."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;