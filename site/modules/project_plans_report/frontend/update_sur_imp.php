<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');

$user = $_SESSION['user']['user_name'];
if(!empty($value))
{
	$sql_1 = "Update business_sellers set  bs_ppr_survey_imple  = '".$value."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	if($value == 'No') { $user=''; $dt=''; }
	
	$sql_2 = "Update business_sellers set  bs_ppr_survey_imp_user  = '".$user."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update business_sellers set  bs_ppr_survey_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
}



 exit;