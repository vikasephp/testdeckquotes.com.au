<?php

$id_1 = $fwRequest->getParam('cs_id_1', '');
$value_1 = $fwRequest->getparam('value_1', '');

$id_2 = $fwRequest->getParam('cs_id_2', '');
$value_2 = $fwRequest->getparam('value_2', '');

$id_3 = $fwRequest->getParam('cs_id_3', '');
$value_3 = $fwRequest->getparam('value_3', '');

$id_4 = $fwRequest->getParam('cs_id_4', '');
$value_4 = $fwRequest->getparam('value_4', '');


if(!empty($id_1))
{
	$sql = "Update construction_scheduler_report set  cs_walk_prepaint  = ".$value_1." where cs_id = ".$id_1;	 
	$fwDb -> queryOne($sql);
}


if(!empty($id_2))
{
	$sql2 = "Update construction_scheduler_report set  cs_walk_preclean  = ".$value_2." where cs_id = ".$id_2;	 
	$fwDb -> queryOne($sql2);
}

if(!empty($id_3))
{
	$sql3 = "Update construction_scheduler_report set  cs_walk_builder  = ".$value_3." where cs_id = ".$id_3;	 
	$fwDb -> queryOne($sql3);
}

if(!empty($id_4))
{
	$sql4 = "Update construction_scheduler_report set  cs_walk_pwqa  = ".$value_4." where cs_id = ".$id_4;	 
	$fwDb -> queryOne($sql4);
}


 exit;