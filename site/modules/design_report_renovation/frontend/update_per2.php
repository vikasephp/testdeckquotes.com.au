<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	
	
	$sql_1 = "Update document_renovation_name set  dpn_dr_per_complete  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
}



 exit;