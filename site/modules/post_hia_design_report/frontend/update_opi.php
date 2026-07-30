<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id))
{
	$sql =  "Update business set  bsn_ptt_opi  = ".$value." where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
	
	$sql2 = "Update business set  bsn_ptt_opi_date  = '".$dt."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business set  bsn_ptt_opi_user  = '".$user."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sqlT = "select bsn_ptt_opi, bsn_ptt_opi_date, bsn_ptt_opi_user from business where bsn_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
	$output = $dataT['bsn_ptt_opi_date'] ."<br>".$dataT['bsn_ptt_opi_user'];
	
	//echo "Tana";
	if($dataT['bsn_ptt_opi'] == 1 ) {
	   echo $output;
	} else { echo ''; }
}



 exit;