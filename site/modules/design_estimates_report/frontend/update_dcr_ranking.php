<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dcr_ranking  = ".$value ." where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update document_proposal_name set  dpn_dcr_ranking_date  = '".$dt ."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql2 = "Update document_proposal_name set  dpn_dcr_ranking_user  = '".$usr ."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "select dpn_dcr_ranking_date, dpn_dcr_ranking_user from document_proposal_name where dpn_unique_id = ".$id;	 
	$dataT = $fwDb->queryOne($sql3);
	
	echo $dataT['dpn_dcr_ranking_date'] .'<br>'. $dataT['dpn_dcr_ranking_user']; 
	//echo 'Tana';
}


 exit;