<?php

$id = $fwRequest->getParam('user_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];


if(!empty($id))
{
	
	
	$sql_1 = "Update users set  user_pm_active = ".$value." where user_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update users set  user_pm_active_user = '".$usr."' where user_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update users set  user_pm_active_date = '".$dt."' where user_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "select user_pm_active_user, user_pm_active_date from users where  user_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	$output = $data['user_pm_active_user']."<br>".$data['user_pm_active_date'];
	
	if($value == 1) 
	{
		echo $output;
	} else {
	    echo '';	
	}
}



 exit;