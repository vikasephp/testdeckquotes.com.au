<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update document_renovation_name set  dpn_dr_what  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;