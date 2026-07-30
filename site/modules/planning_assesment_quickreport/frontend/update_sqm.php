<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update business_sellers set  bs_paqr_sqm  = '".$value ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;