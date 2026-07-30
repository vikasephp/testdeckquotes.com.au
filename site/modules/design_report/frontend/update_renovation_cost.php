<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$id_cmt = $fwRequest->getParam('dpn_unique_id_cmt', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$value = str_replace('%20',' ',$value);


if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dr_erc  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_cmt))
{
	$sql = "Update document_proposal_name set  dpn_dr_erc_cmt    = '".$value."' where dpn_unique_id = ".$id_cmt;	 
	$fwDb -> queryOne($sql);
}

 exit;