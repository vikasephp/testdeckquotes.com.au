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


if(!empty($id_1))
{
	$sql = "Update construction_scheduler_report set  cs_cu_pre_sheet_clean  = ".$value_1." where cs_id = ".$id_1;	 
	$fwDb -> queryOne($sql);
}


if(!empty($id_2))
{
	$sql2 = "Update construction_scheduler_report set  cs_cu_wall_roof  = ".$value_2." where cs_id = ".$id_2;	 
	$fwDb -> queryOne($sql2);
}

if(!empty($id_3))
{
	$sql3 = "Update construction_scheduler_report set  cs_su_pre_sheet  = ".$value_3." where cs_id = ".$id_3;	 
	$fwDb -> queryOne($sql3);
}

if(!empty($id_4))
{
	$sql4 = "Update construction_scheduler_report set  cs_cu_ps_qa  = ".$value_4." where cs_id = ".$id_4;	 
	$fwDb -> queryOne($sql4);
}

if(!empty($id_5))
{
	$sql5 = "Update construction_scheduler_report set  cs_cu_cuqa  = ".$value_5." where cs_id = ".$id_5;	 
	$fwDb -> queryOne($sql5);
}


if(!empty($id_6))
{
	$sql6 = "Update construction_scheduler_report set  cs_cu_fixing  = ".$value_6." where cs_id = ".$id_6;	 
	$fwDb -> queryOne($sql6);
}


if(!empty($id_7))
{
	$sql7 = "Update construction_scheduler_report set  cs_cu_painting  = ".$value_7." where cs_id = ".$id_7;	 
	$fwDb -> queryOne($sql7);
}

if(!empty($id_8))
{
	$sql8 = "Update construction_scheduler_report set  cs_box_gutter  = ".$value_8." where cs_id = ".$id_8;	 
	$fwDb -> queryOne($sql8);
}


$id_788 = $fwRequest->getParam('cs_id_788', '');
$value_788 = $fwRequest->getparam('value_788', '');

if(!empty($id_788))
{
	$sql788 = "Update construction_scheduler_report set cs_cond_mngmnt_roof_vent_insu = ".$value_788." where cs_id = ".$id_788;	 
	$fwDb -> queryOne($sql788);
}

$id_739 = $fwRequest->getParam('cs_id_739', '');
$value_739 = $fwRequest->getparam('value_739', '');

if(!empty($id_739))
{
	$sql739 = "Update construction_scheduler_report set cs_fire_rated_cert = ".$value_739." where cs_id = ".$id_739;	 
	$fwDb -> queryOne($sql739);
}

$id_777 = $fwRequest->getParam('cs_id_777', '');
$value_777 = $fwRequest->getparam('value_777', '');

if(!empty($id_777))
{
	$sql777 = "Update construction_scheduler_report set cs_fire_ins_cert = ".$value_777." where cs_id = ".$id_777;	 
	$fwDb -> queryOne($sql777);
}

$id_737 = $fwRequest->getParam('cs_id_737', '');
$value_737 = $fwRequest->getparam('value_737', '');

if(!empty($id_737))
{
	$sql737 = "Update construction_scheduler_report set cs_glazing_skylight = ".$value_737." where cs_id = ".$id_737;	 
	$fwDb -> queryOne($sql737);
}

$id_156 = $fwRequest->getParam('cs_id_156', '');
$value_156 = $fwRequest->getparam('value_156', '');

if(!empty($id_156))
{
	$sql156 = "Update construction_scheduler_report set cs_glazing_windows = ".$value_156." where cs_id = ".$id_156;	 
	$fwDb -> queryOne($sql156);
}

$id_162 = $fwRequest->getParam('cs_id_162', '');
$value_162 = $fwRequest->getparam('value_162', '');

if(!empty($id_162))
{
	$sql162 = "Update construction_scheduler_report set cs_insu_cert = ".$value_162." where cs_id = ".$id_162;	 
	$fwDb -> queryOne($sql162);
}

$id_318 = $fwRequest->getParam('cs_id_318', '');
$value_318 = $fwRequest->getparam('value_318', '');

if(!empty($id_318))
{
	$sql318 = "Update construction_scheduler_report set cs_asbestos_clr_cert = ".$value_318." where cs_id = ".$id_318;	 
	$fwDb -> queryOne($sql318);
}


 exit;