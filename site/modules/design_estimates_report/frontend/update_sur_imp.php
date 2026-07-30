<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');

$user = $_SESSION['user']['user_name'];

$value2 = str_replace('%20',' ',$value);

if(!empty($value))
{
	//$sql_1 = "Update business_sellers set  dpn_dr_survey_imple  = '".$value."' where bs_business_id = ".$id;	 
	//$fwDb -> queryOne($sql_1);
	
	$sql_1 = "Update document_proposal_name set  dpn_dr_survey_imple  = '".$value2."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	if($value == 'No') { $user=''; $dt=''; }
	
	$sql_2 = "Update document_proposal_name set  dpn_dr_survey_imp_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update document_proposal_name set  dpn_dr_survey_date  = '".$dt."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
}



 exit;