<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y h:i:sa');

$user = $_SESSION['user']['user_name'];
$value = str_replace('%20',' ',$value);
if(!empty($value))
{
	
	$sql_1 = "Update document_proposal_name set  dpn_dr_cust_budget  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	if($value == '') { $user=''; $dt=''; }
	
	$sql_2 = "Update document_proposal_name set  dpn_dr_budg_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update document_proposal_name set  dpn_dr_budg_date  = '".$dt."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
}



 exit;