<?php

$id = $fwRequest->getparam('dpn_unique_id', '');
$column = $fwRequest->getParam('column', '');
$value = urldecode($fwRequest->getparam('value', ''));

if($id > 0 && $column === 'dpn_dr_ec_date' ){
	$sql = "Update document_proposal_name set dpn_dr_ec_date = '".$value."' where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_likely_date' ){
	$sql = "Update document_proposal_name set dpn_dr_likely_date = '".$value."' where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_erc_date' ){
	$sql = "Update document_proposal_name set dpn_dr_erc_date = '".$value."' where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

if($id > 0 && $column === 'dpn_dr_ut_date' ){
	$sql = "Update document_proposal_name set dpn_dr_ut_date = '".$value."' where dpn_unique_id = ".$id;	
	$fwDb -> queryOne($sql);
}

exit('Success');