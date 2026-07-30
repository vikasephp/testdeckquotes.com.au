<?php


$id = $fwRequest->getParam('os2_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($value))
{
	$sql = "Update 2025_165_report set  os2_doc_plan    = ".$value." where os2_id = ".$id;	 
	$fwDb -> queryOne($sql);
}



 exit;