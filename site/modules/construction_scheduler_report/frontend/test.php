<?php


$id = $fwRequest->getParam('cs_id', '');
$value = $fwRequest->getparam('value', '');


if(!empty($id))
{
	$sql = "Update construction_scheduler_report set  cs_nth_sth  = '".$value."' where cs_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

 exit;