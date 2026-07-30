<?php

$id = $fwRequest->getParam('ds_id', '');
$value = $fwRequest->getparam('value', '');
$value2 = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update delivery_schedule_report set  ds_supplier   = '".$value2."' where ds_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;