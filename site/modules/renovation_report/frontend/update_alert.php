<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($value))
{
	$sql = "Update document_renovation_name set dpn_rr_alerts  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit;