<?php


$id = $fwRequest->getParam('cn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update customer_nps_report set  cn_status   = ".$value." where cn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;