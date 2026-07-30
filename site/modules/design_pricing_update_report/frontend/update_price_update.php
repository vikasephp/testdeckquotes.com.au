<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update design_interface set  di_price_update  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update design_interface set  di_price_update_user  = '".$user."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	
	$sqlT = "select di_price_update_user from design_interface where di_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['di_price_update_user'];
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;