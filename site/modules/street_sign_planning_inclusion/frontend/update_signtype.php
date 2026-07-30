<?php


$id = $fwRequest->getParam('ss_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);


	$sql = "Update street_sign_pl_in set  ss_sign_type  = '".$value."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;