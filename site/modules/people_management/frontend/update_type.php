<?php

$id = $fwRequest->getParam('user_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];


if(!empty($id))
{
	
	
	$sql_1 = "Update users set  user_pm_type  = ".$value." where user_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	

}



 exit;