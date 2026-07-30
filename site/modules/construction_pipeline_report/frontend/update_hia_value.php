<?php


$id = $fwRequest->getParam('bcust_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql1 = "Update bus_customers set  bcust_cpr_hia_value   = '".$value."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql1);
	
}


 exit;