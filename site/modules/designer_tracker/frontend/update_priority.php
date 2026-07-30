<?php


$id = $fwRequest->getParam('dt_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update designer_tracker set  dt_priority  = ".$value." where dt_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;