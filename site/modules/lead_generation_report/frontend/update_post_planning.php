<?php


$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

$sql = "Update business_sellers set  bs_lgr_post_planning   = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);




 exit;