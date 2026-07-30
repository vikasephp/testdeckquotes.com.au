<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$value2 = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dr_alerts  = '".$value2."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;