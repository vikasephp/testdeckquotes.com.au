<?php


$id = $fwRequest->getParam('cs_id', '');
$value = $fwRequest->getparam('value', '');

$id_1 = $fwRequest->getParam('cs_id_1', '');
$value_1 = $fwRequest->getparam('value_1', '');


if(!empty($id))
{
	$sql = "Update construction_scheduler_report set  cs_nth_sth  = '".$value."' where cs_id = ".$id;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_1))
{
	$sql2 = "Update construction_scheduler_report set  cs_cal_con_notes  = ".$value_1." where cs_id = ".$id_1;	 
	$fwDb -> queryOne($sql2);
}

 exit;