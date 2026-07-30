<?php


//$id = $fwRequest->getParam('pa_id', '');
//$value = $fwRequest->getparam('value', '');
//
//
//if(!empty($value))
//{
//	$sql = "Update partners_agreements set  pa_type  = '".$value."' where pa_id = ".$id;	 
//	$fwDb -> queryOne($sql);
//}

$id = $fwRequest->getParam('pa_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update partners_agreements set  pa_type  = '".$value."' where pa_id = ".$id;	 
	$fwDb -> queryOne($sql);
}




 exit;