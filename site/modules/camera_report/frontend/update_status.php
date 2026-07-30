<?php


$id = $fwRequest->getParam('cr_id', '');
$value = $fwRequest->getparam('value', '');

$value2 = str_replace('%20',' ',$value);

if(!empty($id))
{
	$sql = "Update camera_report set  cr_status  = '".$value2."' where cr_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;