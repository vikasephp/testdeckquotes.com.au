<?php

$id = $fwRequest->getParam('cs_id', '');
$value = $fwRequest->getparam('value', '');

$id_2 = $fwRequest->getParam('cs_id2', '');
$value_2 = $fwRequest->getparam('value2', '');

$id_3 = $fwRequest->getParam('cno', '');
$value_3 = $fwRequest->getparam('dt', '');

$id_4 = $fwRequest->getParam('cnos', '');
$value_4 = $fwRequest->getparam('sur', '');

$id_5 = $fwRequest->getParam('cnow', '');
$value_5 = $fwRequest->getparam('who', '');

$fmd_id = $fwRequest->getParam('fmd_id', '');
$fmd_value = $fwRequest->getparam('fmd_value', '');

$cno_t = $fwRequest->getParam('cno_t', '');
$value_t = $fwRequest->getparam('value_t', '');

$sign_off_id = $fwRequest->getParam('sign_off_id', '');
$value_so = $fwRequest->getparam('value_so', '');

if(!empty($id))
{
	$value = str_replace('%20',' ',$value);
	
	$sql = "Update document_proposal_name set  dpn_dr_survey  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);	
}

if(!empty($id_2))
{
	$value_2 = str_replace('%20',' ',$value_2);
	
	$sql = "Update document_proposal_name set  dpn_dr_surveydt  = '".$value_2."' where dpn_unique_id = ".$id_2;	 
	$fwDb -> queryOne($sql);	
}


if(!empty($value_3))
{
	$value_3 = str_replace('%20',' ',$value_3);
	
	$sql = "Update document_proposal_name set  dpn_dr_sur_comp_date  = '".$value_3."' where dpn_unique_id = ".$id_3;	 
	$fwDb -> queryOne($sql);	
}

if(!empty($value_4))
{
	$value_4 = str_replace('%20',' ',$value_4);
	
	$sql = "Update document_proposal_name set  dpn_dr_surveyor  = '".$value_4."' where dpn_unique_id = ".$id_4;	 
	$fwDb -> queryOne($sql);	
}


if(!empty($value_5))
{
	$value_5 = str_replace('%20',' ',$value_5);
	
	$sql = "Update document_proposal_name set  dpn_dr_who_provided  = '".$value_5."' where dpn_unique_id = ".$id_5;	 
	$fwDb -> queryOne($sql);	
}

if(!empty($fmd_id))
{
	$fmd_value = str_replace('%20',' ',$fmd_value);
	
	$sql = "Update document_proposal_name set  dpn_dr_first_meeting_date  = '".$fmd_value."' where dpn_unique_id = ".$fmd_id;	 
	$fwDb -> queryOne($sql);	
}

if(!empty($value_t))
{
	$value_t = str_replace('%20',' ',$value_t);
	
	$sql = "Update document_proposal_name set  dpn_dr_tdso_dt  = '".$value_t."' where dpn_unique_id = ".$cno_t;	 
	$fwDb -> queryOne($sql);	
}

if(!empty($sign_off_id))
{
	
	$value_so = str_replace('%20',' ',$value_so);
	
	$sql = "Update document_proposal_name set  dpn_dr_sign_off_sent_date  = '".$value_so."' where dpn_unique_id = ".$sign_off_id;	 
	$fwDb -> queryOne($sql);	
}

 exit;