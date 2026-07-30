<?php

$id_1 = $fwRequest->getParam('cs_id_1', '');
$value_1 = $fwRequest->getparam('value_1', '');

$id_2 = $fwRequest->getParam('cs_id_2', '');
$value_2 = $fwRequest->getparam('value_2', '');

$id_3 = $fwRequest->getParam('cs_id_3', '');
$value_3 = $fwRequest->getparam('value_3', '');

$id_4 = $fwRequest->getParam('cs_id_4', '');
$value_4 = $fwRequest->getparam('value_4', '');

$id_5 = $fwRequest->getParam('cs_id_5', '');
$value_5 = $fwRequest->getparam('value_5', '');

$id_6 = $fwRequest->getParam('cs_id_6', '');
$value_6 = $fwRequest->getparam('value_6', '');

$id_7 = $fwRequest->getParam('cs_id_7', '');
$value_7 = $fwRequest->getparam('value_7', '');

$id_8 = $fwRequest->getParam('cs_id_8', '');
$value_8 = $fwRequest->getparam('value_8', '');

$id_9 = $fwRequest->getParam('cs_id_9', '');
$value_9 = $fwRequest->getparam('value_9', '');

$id_10 = $fwRequest->getParam('cs_id_10', '');
$value_10 = $fwRequest->getparam('value_10', '');

$id_11 = $fwRequest->getParam('cs_id_11', '');
$value_11 = $fwRequest->getparam('value_11', '');


if(!empty($id_1))
{
	$sql = "Update construction_scheduler_report set  cs_comm_notice  = ".$value_1." where cs_id = ".$id_1;	 
	$fwDb -> queryOne($sql);
}


if(!empty($id_2))
{
	$sql2 = "Update construction_scheduler_report set  cs_elect_upgrade  = '".$value_2."' where cs_id = ".$id_2;	 
	$fwDb -> queryOne($sql2);
}

if(!empty($id_3))
{
	$sql3 = "Update construction_scheduler_report set  cs_ch_cons_cond  = '".$value_3."' where cs_id = ".$id_3;	 
	$fwDb -> queryOne($sql3);
}

if(!empty($id_4))
{
	$sql4 = "Update construction_scheduler_report set  cs_ch_cou_req  = '".$value_4."' where cs_id = ".$id_4;	 
	$fwDb -> queryOne($sql4);
}

if(!empty($id_5))
{
	$sql5 = "Update construction_scheduler_report set  cs_ch_ele_mark  = '".$value_5."' where cs_id = ".$id_5;	 
	$fwDb -> queryOne($sql5);
}

if(!empty($id_6))
{
	$sql6 = "Update construction_scheduler_report set  cs_ch_cons_package  = '".$value_6."' where cs_id = ".$id_6;	 
	$fwDb -> queryOne($sql6);
}

if(!empty($id_7))
{
	$sql7 = "Update construction_scheduler_report set  cs_reno_cons  = '".$value_7."' where cs_id = ".$id_7;	 
	$fwDb -> queryOne($sql7);
}

if(!empty($id_8))
{
	$sql = "Update construction_scheduler_report set  cs_wind_door_quote  = '".$value_8."' where cs_id = ".$id_8;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_9))
{
	$sql = "Update construction_scheduler_report set  cs_wall_roof_quote   = '".$value_9."' where cs_id = ".$id_9;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_10))
{
	$sql = "Update construction_scheduler_report set  cs_wall_roof_quote   = '".$value_10."' where cs_id = ".$id_10;	 
	$fwDb -> queryOne($sql);
}

if(!empty($id_11))
{
	$sql = "Update construction_scheduler_report set cs_appr_exterior_col = '".$value_11."' where cs_id = ".$id_11;	 
	$fwDb -> queryOne($sql);
}


 exit;