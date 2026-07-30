<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update design_interface set  di_brochure_online  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update design_interface set  di_brochure_online_user  = '".$user."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update design_interface set  di_brochure_online_date  = '".$dt."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select di_brochure_online_user, di_brochure_online_date from design_interface where di_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['di_brochure_online_user']. "<br>".$dataT['di_brochure_online_date'];
	
	//echo "Tana";
	echo $output;
	
	
}



 exit;