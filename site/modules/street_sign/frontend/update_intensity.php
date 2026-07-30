<?php


$id = $fwRequest->getParam('ss_id', '');
$value = $fwRequest->getparam('value', '');
$value = str_replace('%20',' ',$value);

//$dt = date('d-m-Y');
//$user = $_SESSION['user']['user_name'];


if(!empty($id))
{
	$sql1 = "Update street_sign set  ss_intensity  = '".$value."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	//$sql2 = "Update street_sign set  ss_sign_action_date  = '".$dt."' where ss_id = ".$id;	 
//	$fwDb -> queryOne($sql2);
//	
//	$sql3 = "Update street_sign set  ss_sign_action_user  = '".$user."' where ss_id = ".$id;	 
//	$fwDb -> queryOne($sql3);
//	
//	$sql = "Select ss_sign_action_date, ss_sign_action_user from street_sign where ss_id = ".$id;
//	$data = $fwDb -> queryOne($sql);
//	
//	$output = $data['ss_sign_action_date']."<br>".$data['ss_sign_action_user'];
//	echo $output;
}



 exit;