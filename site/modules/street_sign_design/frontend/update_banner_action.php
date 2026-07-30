<?php


$id = $fwRequest->getParam('ss_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];


if(!empty($id))
{
	$sql1 = "Update street_sign_design set  ss_banner_action  = '".$value."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql2 = "Update street_sign_design set  ss_banner_action_date  = '".$dt."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update street_sign_design set  ss_banner_action_user  = '".$user."' where ss_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql = "Select ss_banner_action_date, ss_banner_action_user from street_sign_design where ss_id = ".$id;
	$data = $fwDb -> queryOne($sql);
	
//	$sql2 = "Select * from street_sign_design where ss_id = ".$id;
//	$data2 = $fwDb -> queryOne($sql2); echo "<pre>"; print_r($data2);
	
	$output = $data['ss_banner_action_date']."<br>".$data['ss_banner_action_user'];
	echo $output;
}



 exit;