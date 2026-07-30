<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');

if(!empty($value))
{
	$sql = "Update business_sellers set  bs_dr_survey  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	//$sql2 = "Update business_sellers set  bs_dr_survey_date  = '".$dt."' where bs_business_id = ".$id;	 
	//$fwDb -> queryOne($sql2);
}



 exit;