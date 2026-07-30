<?php

$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');

	$sql = "Update business_sellers set  	bs_lgr_budget   = '".$value ."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);


 exit;