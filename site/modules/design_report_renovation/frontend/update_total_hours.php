<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update document_renovation_name set  dpn_dr_total_hours  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;