<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update design_interface set  di_online_correct  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update design_interface set  di_online_correct_user  = '".$user."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update design_interface set  di_online_correct_date  = '".$dt."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select di_online_correct_user, di_online_correct_date from design_interface where di_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['di_online_correct_user']. "<br>".$dataT['di_online_correct_date'];
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;