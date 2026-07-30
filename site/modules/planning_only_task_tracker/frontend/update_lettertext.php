<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update bus_customers set  bcust_ptt_letter_text  = '".$value."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update bus_customers set  bcust_ptt_letter_text_date  = '".$dt."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update bus_customers set   bcust_ptt_letter_text_user  = '".$user."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlT = "select bcust_ptt_letter_text_date, bcust_ptt_letter_text_user from bus_customers where bcust_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bcust_ptt_letter_text_date'] ."<br>".$dataT['bcust_ptt_letter_text_user'];
	
	//echo "Tana";
	echo $output;
	
}



 exit;