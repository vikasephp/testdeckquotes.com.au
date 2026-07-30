<?php

$id = $fwRequest->getParam('bs_business_id', '');
$value = $fwRequest->getparam('value', '');

$dt = date('d-m-Y');
$usr = $_SESSION['user']['user_name'];


	$sql1 = "Update business_sellers set  bs_cdr_cal_linked   = ".$value." where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
	$sql2 = "Update business_sellers set  bs_cdr_cal_lin_user   = '".$usr."'  where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql2);
	
	$sql3 = "Update business_sellers set  bs_cdr_cal_lin_date  = '".$dt."' where bs_business_id = ".$id;	 
	$fwDb -> queryOne($sql3);
	
	$sql = "select bs_cdr_cal_lin_user , bs_cdr_cal_lin_date  from business_sellers where  bs_business_id = ".$id;
	$data = $fwDb->queryOne($sql);
	
	echo $data['bs_cdr_cal_lin_user']."<br>".$data['bs_cdr_cal_lin_date'];
	



 exit;