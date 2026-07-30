<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update business_sellers set  bs_qr_delivery_method  = '".$value ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	db($sql);
	echo $sql;
}



 exit;