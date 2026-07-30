<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update business set  bsn_dep_repo_sent  = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update business set  bsn_dep_repo_sent_user  = '".$usr."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	
	$sqlT = "select bsn_dep_repo_sent_user from business where bsn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bsn_dep_repo_sent_user'];
	
	//echo "Tana";
	echo $output;
	
	
 exit;