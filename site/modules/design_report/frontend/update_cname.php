<?php

$id = $fwRequest->getparam('dpn_unique_id', '');
$column = $fwRequest->getParam('column', '');
$value = $fwRequest->getparam('value', '');

if($id > 0 && $column === 'dpn_dr_est_cname' ){
	$sql = "Update document_proposal_name set dpn_dr_est_cname = ".$value." where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_likely_cname' ){
	$sql = "Update document_proposal_name set dpn_dr_likely_cname = ".$value." where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_reno_cname' ){
	$sql = "Update document_proposal_name set dpn_dr_reno_cname = ".$value." where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_ut_cname' ){
	$val = !empty($value) ? (int) $value : 0;
	$sql = "Update document_proposal_name set dpn_dr_ut_cname = ".$val." where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

exit('Success');