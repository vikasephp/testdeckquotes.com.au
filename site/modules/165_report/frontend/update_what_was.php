<?php


$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');
$value= str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update 165_report set  os_what_was  = '".$value."' where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;