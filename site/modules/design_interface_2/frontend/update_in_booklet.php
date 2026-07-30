<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update design_interface_2 set  di_in_booklet  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;