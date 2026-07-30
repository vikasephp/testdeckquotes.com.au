<?php


$id = $fwRequest->getParam('dpn_unique_id', '');
$value = $fwRequest->getparam('value', '');
$user = $_SESSION['user']['user_name'];
$value = str_replace('%20',' ',$value);
if(!empty($id))
{
	$sql = "Update document_proposal_name set  dpn_dr_last_audit  = '".$value."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update document_proposal_name set  dpn_dr_last_audit_user  = '".$user."' where dpn_unique_id = ".$id;	 
	$fwDb -> queryOne($sql2);
}



 exit;