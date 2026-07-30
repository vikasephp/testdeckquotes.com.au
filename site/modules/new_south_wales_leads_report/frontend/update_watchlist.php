<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', 0);

$sql2 = "Select business.bsn_watch_list from business where bsn_id = ".$id;
$data = $fwDb -> queryOne($sql2);

if($data['bsn_watch_list'] == '2') 
{
	$val = '1';	
} else {
	$val = '2';	
}
		

if(!empty($value))
{
	$sql = "Update business set  bsn_watch_list  = ".$val ." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;