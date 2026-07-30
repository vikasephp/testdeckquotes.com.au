<?php

$id = $fwRequest->getParam('ml_id', '');
$value = trim($fwRequest->getparam('value', ''));

if($id > 0){
	$escaped_value = addslashes($value);
	$sql = "Update mistake_log set ml_root_cause = '".$escaped_value."' where ml_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit('Success');