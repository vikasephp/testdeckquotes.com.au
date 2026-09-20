<?php
$fwMainView = 'file:' . getcwd() . '/detaildata.tpl';
$bs_id = $fwRequest->getparamget('bs_id', 0);
if($bs_id){
	$sql = "SELECT business_sellers.*, business.bsn_id, business.bsn_name  FROM business_sellers
				LEFT JOIN business ON business_sellers.bs_business_id = business.bsn_id
				WHERE business_sellers.bs_id = ".$bs_id;
	
$userData= $fwDb->queryOne($sql);
foreach($userData as $key => $value)
	{
		if(!empty($value)){$string.= "||".$key."|".$value;}
	}
print_r($string);
}
exit;