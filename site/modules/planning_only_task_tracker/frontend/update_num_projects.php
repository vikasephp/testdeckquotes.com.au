<?php

$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');

if(!empty($id))
{
	$sql =  "Update business_sellers set  bs_ptt_num_project  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
}



 exit;