<?php

$id = $fwRequest->getParam('pc_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update project_planning_checklist set  pc_required   = ".$value." where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update project_planning_checklist set  pc_required_user  = '".$usr."' where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update project_planning_checklist set  pc_required_date  = '".$dt."' where pc_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	
	$sqlT = "select pc_required, pc_required_user, pc_required_date from project_planning_checklist where pc_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['pc_required_user'] ."<br>".$dataT['pc_required_date'];
	
	if($dataT['pc_required']==0)
	{
		echo $output;
	} else {
		echo "";	
	}
	
 exit;