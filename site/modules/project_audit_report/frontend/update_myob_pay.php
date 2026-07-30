<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business set  bsn_par_myob_pay  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business set   bsn_par_myob_user  = '".$user."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business set   bsn_par_myob_date  = '".$dt."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlT = "select bsn_par_myob_date, bsn_par_myob_user from business where bsn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bsn_par_myob_user'] ."<br>".$dataT['bsn_par_myob_date'];
	
	echo $output;	
}

 exit;