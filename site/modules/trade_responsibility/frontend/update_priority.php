<?php


$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update warranty_log set  wa_priority  = ".$value." where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;