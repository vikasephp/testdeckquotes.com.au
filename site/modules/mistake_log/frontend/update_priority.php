<?php


$id = $fwRequest->getParam('ml_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update mistake_log set  ml_priority  = '".$value."' where ml_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;