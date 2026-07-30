<?php


$id = $fwRequest->getParam('id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update bus_customers set  bcust_itt_letter_text  = '".$value."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;