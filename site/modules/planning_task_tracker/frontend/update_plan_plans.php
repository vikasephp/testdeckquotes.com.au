<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

if(!empty($id)) {
    $sql="UPDATE business SET bsn_ptt_planning_plans=$value, bsn_ptt_pp_user='$user', bsn_ptt_pp_date='$dt' WHERE bsn_id=$id";	 
	$fwDb->queryOne($sql);

    $sqlT = "select bs_ptt_sub_status_date, bs_ptt_sub_status_user from business_sellers where bs_business_id = ".$id;
	$dataT = $fwDb->queryOne($sqlT);
	
    $output = $value == 1 ? "$user<br>$dt" : "";
	echo $output;
}
exit;