<?php


$id = $fwRequest->getParam('ds_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update delivery_schedule_report set  ds_delivery_event   = ".$value." where ds_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;