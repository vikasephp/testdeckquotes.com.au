<?php

$id = $fwRequest->getParam('pc_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update project_planning_checklist set  pc_qa2  = ".$value." where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update project_planning_checklist set  pc_qa2_user  = '".$usr."' where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update project_planning_checklist set  pc_qa2_date  = '".$dt."' where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	
	$sqlT = "select pc_qa2_user, pc_qa2_date from project_planning_checklist where pc_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['pc_qa2_user'] ."<br>".$dataT['pc_qa2_date'];
	
	echo $output;
	
	
 exit;