<?php


$id = $fwRequest->getParam('dc_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update delivery_confirmation_report set  dc_status  = ".$value." where dc_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;