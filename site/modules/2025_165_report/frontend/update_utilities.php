<?php

$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');
$item = $fwRequest->getparam('item', '');

if($item == 1)
{
	$sql = "Update 165_report set  os_icon_water   = ".$value." where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if($item == 2)
{
	$sql = "Update 165_report set  os_evo_gas  = ".$value." where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if($item == 3)
{
	$sql = "Update 165_report set  os_evo_energy  = ".$value." where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if($item == 4)
{
	$sql = "Update 165_report set  os_storm_water   = ".$value." where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;