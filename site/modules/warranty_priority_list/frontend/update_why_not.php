<?php


$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	$sql = "Update warranty_log set  wa_why_not  = ".$value." where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);


    if($value > 0) {

    	$sql_2 = "Update warranty_log set  wa_why_not_user  = '".$usr."' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_2);
	
		$sql_3 = "Update warranty_log set   	wa_why_not_date   = '".$dt."' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_3);
	
	} else {
		
		$sql_2 = "Update warranty_log set  wa_why_not_user  = '' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_2);
	
		$sql_3 = "Update warranty_log set   	wa_why_not_date   = '' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_3);
	}
	
	$sqlT = "select wa_why_not_user, wa_why_not_date from warranty_log where wa_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['wa_why_not_user'] ."<br>".$dataT['wa_why_not_date'];
	
	
		echo $output;
	
 exit;