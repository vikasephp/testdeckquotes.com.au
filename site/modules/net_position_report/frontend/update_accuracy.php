
<?php

$id = $fwRequest->getParam('np_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

if(!empty($id))
{
		
	$sql_1 = "Update net_position_report set  np_accuracy  = ".$value." where np_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update net_position_report set  np_accuracy_date  = '".$dt."' where np_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update net_position_report set  np_accuracy_user  = '".$usr."' where np_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = "select np_accuracy_user, np_accuracy_date from net_position_report  where np_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	//echo "Tana";
	echo $data['np_accuracy_user'].'<br>'.$data['np_accuracy_date'];
}

 exit;