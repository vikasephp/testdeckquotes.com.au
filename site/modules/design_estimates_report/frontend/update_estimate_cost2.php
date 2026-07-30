<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$id_cmt = $fwRequest->getParam('dpn_unique_id_cmt', '');
$id_build = $fwRequest->getParam('dpn_unique_id_build', '');
$id_renocal = $fwRequest->getParam('dpn_unique_id_renocal_cmt', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');

$value = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dr_estimate_cost  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_cmt))
{
	$sql = "Update document_proposal_name set  dpn_dr_ec_cmt   = '".$value."' where dpn_unique_id = ".$id_cmt;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_build))
{
	$sql = "Update document_proposal_name set  dpn_build_cal_cmt   = '".$value."' where dpn_unique_id = ".$id_build;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_renocal))
{
	$sql = "Update document_proposal_name set  dpn_reno_cal_cmt   = '".$value."' where dpn_unique_id = ".$id_renocal;	 
	$fwDb -> queryOne($sql);
}


 exit; 