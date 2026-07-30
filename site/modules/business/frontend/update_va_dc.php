<?php
$id = $fwRequest->getParam('va_id', '');

$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql1 = "Update bus_variations set  va_dc   = ".$value." where va_id = ".$id;	 
	$fwDb -> queryOne($sql1);
}



 exit;