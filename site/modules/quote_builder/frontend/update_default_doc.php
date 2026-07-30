<?php

$id = $fwRequest->getParam('admin_doc_id', '');
$value = $fwRequest->getparam('value', '');

	$sql = "Update admin_document_check_list set  admin_qb_default  = ".$value." where admin_doc_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;