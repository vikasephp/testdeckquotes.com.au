<?php


$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update warranty_log set  wa_type  = '".$value."' where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;