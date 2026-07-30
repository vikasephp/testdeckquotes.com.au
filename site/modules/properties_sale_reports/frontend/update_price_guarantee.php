<?php

$id = $fwRequest->getParam('ps_id', '');
$value = trim($fwRequest->getparam('value', ''));

if($id > 0){
	$escaped_value = addslashes($value);
	$sql = "Update property_sale_project_tracker set ps_price_guarantee = '".$escaped_value."' where ps_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit('Success');