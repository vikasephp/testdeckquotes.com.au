<?php
$id = $fwRequest->getParam('va_id', '');
$value = $fwRequest->getparam('value', '');

$value = trim(addslashes($value));

if(!empty($id))
{
	$sql = "Update bus_variations set va_person_resp = '".$value."' where va_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	echo "Success";
}

 exit;