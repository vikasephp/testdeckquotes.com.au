<?php


$id = $fwRequest->getParam('os_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update 165_report set  os_comp_chk_pass  = '".$value."' where os_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;