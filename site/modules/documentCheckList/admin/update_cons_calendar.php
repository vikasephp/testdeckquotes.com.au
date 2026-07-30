<?php

$id = $fwRequest->getParam('admin_doc_id', '');
$value = $fwRequest->getparam('value', '');
//$value = str_replace('%20',' ',$value);

	$sql = "Update admin_document_check_list set  admin_cons_calendar  = ".$value." where admin_doc_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;