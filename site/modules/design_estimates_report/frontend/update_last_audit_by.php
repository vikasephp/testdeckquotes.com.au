<?php

$id = $fwRequest->getparam('dpn_unique_id', '');
$column = $fwRequest->getParam('column', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');

if($id > 0 && $column === 'dpn_last_audit_by' ){
	$sql = "Update document_proposal_name set dpn_last_audit_by = ".$value." where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
	
	$sql_1 = "Update document_proposal_name set dpn_last_audit_update_at = '".$dt."' where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql_1);
	
	$sql_result = "Select dpn_last_audit_update_at from document_proposal_name where dpn_unique_id = ".$id;
	$data_result = $fwDb->queryOne($sql_result);
	
	echo $data_result['dpn_last_audit_update_at'];
}

exit;