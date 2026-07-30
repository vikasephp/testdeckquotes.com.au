<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$usr  = $_SESSION['user']['user_name'];

	$sql = "Update business set  bsn_wlr_docsign_sent  = ".$value ." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);


    $sql_2 = "Update business set  bsn_wlr_docsign_user  = '".$usr ."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	
	$sql_3 = "Update business set  bsn_wlr_docsign_date  = '".$dt ."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql_3);

 exit;