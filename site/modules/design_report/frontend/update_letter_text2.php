<?php

$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($value))
{
	$sql = "Update document_proposal_name set  dpn_dr_letter_text  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}
 

 exit;