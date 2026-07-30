<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update design_interface set  di_new_planning  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update design_interface set  di_new_planning_date  = '".$dt."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql3 = "Update design_interface set  di_new_planning_user  = '".$user."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select di_new_planning_date, di_new_planning_user from design_interface where di_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['di_new_planning_date']."<br>". $dataT['di_new_planning_user'];
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;