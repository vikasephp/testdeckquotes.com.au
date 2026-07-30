<?php

$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];


	$sql1 = "Update business_sellers set  bs_sar_accuracy  = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql2 = "Update business_sellers set  bs_sar_acc_user  = '".$usr."'  where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_sar_acc_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql = "select bs_sar_acc_user, bs_sar_acc_date from business_sellers where  bs_business_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	echo $data['bs_sar_acc_user']."<br>".$data['bs_sar_acc_date'];
	



 exit;