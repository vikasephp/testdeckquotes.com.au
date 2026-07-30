<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update design_interface set  di_current_build  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update design_interface set   di_curr_build_date  = '".$dt."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update design_interface set   di_curr_build_user  = '".$user."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sqlT = "select di_curr_build_date, di_curr_build_user from design_interface where di_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['di_curr_build_date']."<br>".$dataT['di_curr_build_user']."<br>";
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;