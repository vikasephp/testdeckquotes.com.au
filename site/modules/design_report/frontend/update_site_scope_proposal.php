<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);
if(!empty($value))
{
	$sql = "Update business set  bsn_site_scope_proposal  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;