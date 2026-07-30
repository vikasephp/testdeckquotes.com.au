<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql1 = "Update business_sellers set  bs_cpr_sub_status   = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
}


 exit;