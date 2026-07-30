<?php

$id = $fwRequest->getParam('ds_id', '');
$value = $fwRequest->getparam('value', '');


	$sql = "Update delivery_schedule_report set  ds_supplier_date   = '".$value."' where ds_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;