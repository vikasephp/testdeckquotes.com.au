<?php

$id = $fwRequest->getParam(pl_id);
$value = trim($fwRequest->getparam('value', ''));

if($id > 0){
	$escaped_value = addslashes($value);
	$sql = "Update prospect_list set pl_service_type = ".$value." where pl_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit('Success');