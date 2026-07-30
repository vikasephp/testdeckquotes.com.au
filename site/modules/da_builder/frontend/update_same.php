<?php

$id = $fwRequest->getParam('mr_id', '');
$value = $fwRequest->getparam('value', '');
//$value = str_replace('%20',' ',$value);

if(!empty($value))
{
	$sql = "Update report_table_main set  mr_qa   = ".$value." where mr_id = ".$id;	 
	$fwDb -> queryOne($sql);
}


 exit;