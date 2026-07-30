<?php


$id = $fwRequest->getParam('wa_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];

	$sql = "Update warranty_log set  wa_cgfb_resp  = ".$value." where wa_id = ".$id;	 
	$fwDb -> queryOne($sql);

     if($value > 0) {
    	$sql_2 = "Update warranty_log set  wa_cgfb_user  = '".$usr."' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_2);
	
		$sql_3 = "Update warranty_log set  wa_cgfb_date  = '".$dt."' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_3);
		
	 } else {
		 $sql_2 = "Update warranty_log set  wa_cgfb_user  = '' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_2);
	
		$sql_3 = "Update warranty_log set  wa_cgfb_date  = '' where wa_id = ".$id;	 
		$fwDb -> queryOne($sql_3);
		 
	 }
		 
	
	$sqlT = "select wa_cgfb_user, wa_cgfb_date from warranty_log where wa_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['wa_cgfb_user'] ."<br>".$dataT['wa_cgfb_date'];
	
	echo $output;

 exit;