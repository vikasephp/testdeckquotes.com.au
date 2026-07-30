<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql = "Update business_sellers set  bs_cip_type  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;