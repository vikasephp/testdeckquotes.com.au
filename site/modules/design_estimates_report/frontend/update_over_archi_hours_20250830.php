<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dr_overhour  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update document_proposal_name set   dpn_dr_oah_date  = '".$dt."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update document_proposal_name set   dpn_dr_oah_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sqlT = "select dpn_dr_oah_date, dpn_dr_oah_user from document_proposal_name where dpn_unique_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['dpn_dr_oah_date'] ."<br>".$dataT['dpn_dr_oah_user'];
	
	//echo "Tana";
	echo $output;
}



 exit;