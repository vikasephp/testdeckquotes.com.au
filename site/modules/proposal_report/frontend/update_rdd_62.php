<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$value2 = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_render_due_dt62  = '".$value2."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);

}



 exit;