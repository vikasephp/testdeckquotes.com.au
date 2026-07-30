<?php

$id = $fwRequest->getParam('wp_id', '');
$value = $fwRequest->getparam('value', '');

$usr = $_SESSION['user']['user_name'];
$dt = date('d-m-Y');

if(!empty($id))
{
		
	$sql_1 = "Update work_in_progress_report set  wp_cog_percented  = ".$value." where wp_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	
	$sql_2 = "Update work_in_progress_report set  wp_value_comp_user  = '".$usr."' where wp_id = ".$id;	 
	$fwDb -> queryOne($sql_2);
	
	$sql_3 = "Update work_in_progress_report set  wp_value_comp_date  = '".$dt."' where wp_id = ".$id;	 
	$fwDb -> queryOne($sql_3);
	
	$sql = " select wp_value_comp_user, wp_value_comp_date from  work_in_progress_report where wp_id = ".$id;	 
	$dataT = $fwDb->queryOne($sql);
	
	$output = $dataT['wp_value_comp_user'] ."<br>".$dataT['wp_value_comp_date'];
	
	//echo "Tana";
	echo $output;
	
}



 exit;