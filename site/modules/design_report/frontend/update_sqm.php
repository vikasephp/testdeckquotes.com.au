<?php


$id = $fwRequest->getParam('bsn_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update business set  bsn_dr_sqm  = '".$value."' where bsn_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;