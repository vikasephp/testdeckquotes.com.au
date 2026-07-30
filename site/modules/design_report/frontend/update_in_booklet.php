<?php


$id = $fwRequest->getParam('di_id', '');
$value = $fwRequest->getparam('value', '');

$value = str_replace('%20',' ',$value);
if(!empty($value))
{
	$sql = "Update design_interface set  di_in_booklet  = '".$value."' where di_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;