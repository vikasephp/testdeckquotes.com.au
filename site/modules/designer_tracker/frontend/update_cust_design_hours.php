<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update business set  bsn_cust_designer_hours  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;