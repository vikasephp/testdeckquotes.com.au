<?php


$id = $fwRequest->getParam('et_id', '');
$value = $fwRequest->getparam('value', '');


	$sql = "Update document_proposal_name set  dpn_er_type  = ".$value." where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;