<?php

$id = $fwRequest->getParam('pl_id', '');
$value = trim($fwRequest->getparam('value', ''));

if($id > 0){
	$sql = "Update prospect_list set pl_status = ".$value." where pl_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit('Success');