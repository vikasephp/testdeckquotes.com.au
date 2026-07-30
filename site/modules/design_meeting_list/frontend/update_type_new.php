<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update document_proposal_name set  dpn_dr_type_new  = ".$value." where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;