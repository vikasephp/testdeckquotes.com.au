<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	
	$sql = "Update document_check_list set doc_not_required  = ".$value. " where doc_bsn_id = " .$id ." and doc_name_id = 152 ";
	$fwDb -> queryOne($sql);
}


 exit;