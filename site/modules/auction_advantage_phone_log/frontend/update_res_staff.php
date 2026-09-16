<?php


$id = $fwRequest->getParam('ph_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update phone_log set  ph_resp_staff  = '".$value."' where ph_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;