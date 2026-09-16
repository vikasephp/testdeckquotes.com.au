<?php


$id = $fwRequest->getParam('aapl_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

$value = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql_1 = "Update auction_advantage_phone_log set  aapl_actioned  = '".$value."' where aapl_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update auction_advantage_phone_log set  aapl_actioned_user  = '".$usr."' where aapl_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update auction_advantage_phone_log set  aapl_actioned_date  = '".$dt."' where aapl_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "Select aapl_actioned_user, aapl_actioned_date from auction_advantage_phone_log where aapl_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	echo $data['aapl_actioned_user'].'<br>'.$data['aapl_actioned_date'];
	
}


 exit;