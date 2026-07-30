<?php


$id = $fwRequest->getParam('bcust_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql_1 = "Update bus_customers set bcust_wacr_handover  = '".$value."' where bcust_id = ".$id;	 
	$fwDb -> queryOne($sql_1);
	

}


 exit;