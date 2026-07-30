<?php

$id = $fwRequest->getParam('cs_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update contacts set cs_position_code  = '".$value."' where cs_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;