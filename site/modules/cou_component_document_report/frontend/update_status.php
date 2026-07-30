<?php

$id = $fwRequest->getParam('sp_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	
	$sql_1 = "Update sub_pages set  sp_status  = ".$value." where sp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
		
 exit;