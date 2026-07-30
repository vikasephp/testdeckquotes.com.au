<?php
$fwMainView = 'file:' . getcwd() . '/detaildata.tpl';
$bus_id = $fwRequest->getparamget('bus_id', 0);

if($bus_id){
	$sql = "SELECT byer_enquiry.*, business.bsn_id, business.bsn_name, users.user_id,users.user_name  FROM byer_enquiry
				LEFT JOIN business ON byer_enquiry.be_business_id = business.bsn_id
				LEFT JOIN users ON byer_enquiry.be_user = users.user_id
				WHERE byer_enquiry.be_id = ".$bus_id;
	
$userData= $fwDb->queryOne($sql);}
$fwViewData['detail'] = $userData;

foreach($userData as $key => $value)
	{
		if(!empty($value)){$string.= "||".$key."|".$value;}
	}
print_r($string);
