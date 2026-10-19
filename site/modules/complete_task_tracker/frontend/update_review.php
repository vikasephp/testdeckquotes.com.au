<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr  = $_SESSION['user']['user_name'];

if(!empty($value))
{
	$sql = "Update business set bsn_google_review = '".$value ."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}
 exit;