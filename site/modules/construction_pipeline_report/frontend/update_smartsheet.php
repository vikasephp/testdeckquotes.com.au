<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql1 = "Update business_sellers set  bs_cpr_smartsheet  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
}


 exit;