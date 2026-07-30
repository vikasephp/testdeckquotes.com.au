<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update business_sellers set bs_cr_design_no  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;