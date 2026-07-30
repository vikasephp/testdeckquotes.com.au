<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');
$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql = "Update business set bsn_ptt_letter_text = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business set bsn_ptt_letter_text_date = '".$dt."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql = "Update business set bsn_ptt_letter_text_user = '".$user."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sqlT = "select bsn_ptt_letter_text_date, bsn_ptt_letter_text_user from business where bsn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bsn_ptt_letter_text_date'] ."<br>".$dataT['bsn_ptt_letter_text_user'];
	
	//echo "Tana";
	echo $output;
	
}

 exit;