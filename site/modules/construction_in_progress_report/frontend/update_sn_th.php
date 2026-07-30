<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update business_sellers set  bs_cipr_sn  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;