<?php


$id = $fwRequest->getParam('lb_id', '');
$value = $fwRequest->getparam('value', '');
$txt = $fwRequest->getParam('txt', '');
$value = str_replace('%20',' ',$value);

if($txt == 1)
{
	$sql = "Update letterboxing set  lb_text1   = '".$value."' where lb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if($txt == 2)
{
	$sql = "Update letterboxing set  lb_text2   = '".$value."' where lb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;