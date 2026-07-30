<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);


	$sql = "Update business set  bsn_esmr_notes  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;