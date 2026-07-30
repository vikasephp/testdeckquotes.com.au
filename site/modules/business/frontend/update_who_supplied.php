<?php

$id = $fwRequest->getParam('pi_id', '');
$value = $fwRequest->getparam('value', '');

if($id){
	$sql = "Update project_item set pi_who_supplied = '".$value."' where pi_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;