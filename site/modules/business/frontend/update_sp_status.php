<?php
$id = $fwRequest->getParam('sp_id', '');

$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql1 = "Update bus_special_condition set  sp_status   = '".$value."' where sp_id = ".$id;	 
	$fwDb -> queryOne($sql1);
}



 exit;