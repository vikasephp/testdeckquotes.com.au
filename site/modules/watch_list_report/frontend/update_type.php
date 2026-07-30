<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


	$sql = "Update business set  bsn_wlr_type  = ".$value ." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;