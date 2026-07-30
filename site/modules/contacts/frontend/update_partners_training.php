<?php


$id = $fwRequest->getParam('cs_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update contacts set  cs_partner_training  = '".$value."' where cs_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;