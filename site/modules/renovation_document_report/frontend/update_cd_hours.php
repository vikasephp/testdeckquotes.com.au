<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($value))
{
	$sql = "Update document_renovation_name set dpn_rr_cust_de_hour  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit;