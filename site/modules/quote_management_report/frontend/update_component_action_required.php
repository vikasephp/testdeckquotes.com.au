<?php

$id = $fwRequest->getParam('qb_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update quote_builder_component set qb_component_action  = ".$value." where qb_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit;