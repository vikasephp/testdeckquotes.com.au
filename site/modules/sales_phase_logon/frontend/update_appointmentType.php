<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = (int)$fwRequest->getparam('value', '');

if(!empty($value))
{
	$sql = "Update business set bsn_splat_id  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

exit;