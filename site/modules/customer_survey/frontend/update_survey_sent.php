<?php


$id = $fwRequest->getParam('bs_id', '');
$who_bs_id = $fwRequest->getParam('who_bs_id', '');
$ls_bs_id = $fwRequest->getParam('ls_bs_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_cs_servey_tobe  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if(!empty($who_bs_id))
{
	$sql = "Update business_sellers set  bs_cs_who_sent  = '".$value."' where bs_business_id = ".$who_bs_id;	 
	$fwDb -> queryOne($sql);
}


if(!empty($ls_bs_id))
{
	$sql = "Update business_sellers set  bs_cs_last_result  = ".$value." where bs_business_id = ".$ls_bs_id;	 
	$fwDb -> queryOne($sql);
}

 exit;