<?php


$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update 165_report set  os_da_passed  = '".$value."' where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;