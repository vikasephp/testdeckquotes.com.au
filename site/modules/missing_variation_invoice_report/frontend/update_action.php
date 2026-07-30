<?php

$id = $fwRequest->getParam('mv_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update  missing_variation_invoice set  mv_action  = ".$value." where mv_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update missing_variation_invoice set  mv_action_user  = '".$usr."' where mv_id = ".$id;	 
	$fwDb -> queryOne($sql_2);

	
	$sqlT = "select mv_action_user from missing_variation_invoice where mv_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['mv_action_user'];

//	//echo "Tana";
	echo $output;
	
	
 exit;