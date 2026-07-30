<?php


$id = $fwRequest->getParam('ss_id', '');
$value = $fwRequest->getparam('value', '');

	$sql = "Update street_sign_design set  ss_notes  = '".$value."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;