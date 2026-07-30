<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);
$sql_1 = "Update document_proposal_name set  dpn_dcr_value  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_1);


 exit;