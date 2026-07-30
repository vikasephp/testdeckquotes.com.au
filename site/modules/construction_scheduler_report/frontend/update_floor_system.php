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

$id_12 = $fwRequest->getParam('cs_id_12', '');
$value_12 = $fwRequest->getparam('value_12', '');

$id_13 = $fwRequest->getParam('cs_id_13', '');
$value_13 = $fwRequest->getparam('value_13', '');

$id_14 = $fwRequest->getParam('cs_id_14', '');
$value_14 = $fwRequest->getparam('value_14', '');

$id_15 = $fwRequest->getParam('cs_id_15', '');
$value_15 = $fwRequest->getparam('value_15', '');

if(!empty($id_1))
{
	$sql = "Update construction_scheduler_report set  cs_footing_inspection  = ".$value_1." where cs_id = ".$id_1;	 
	$fwDb -> queryOne($sql);
}


if(!empty($id_2))
{
	$sql2 = "Update construction_scheduler_report set  cs_fs_pierinsp  = ".$value_2." where cs_id = ".$id_2;	 
	$fwDb -> queryOne($sql2);
}

if(!empty($id_3))
{
	$sql3 = "Update construction_scheduler_report set  cs_fs_drain_report  = ".$value_3." where cs_id = ".$id_3;	 
	$fwDb -> queryOne($sql3);
}

if(!empty($id_4))
{
	$sql4 = "Update construction_scheduler_report set  cs_fs_ff_ground  = ".$value_4." where cs_id = ".$id_4;	 
	$fwDb -> queryOne($sql4);
}

if(!empty($id_5))
{
	$sql5 = "Update construction_scheduler_report set  cs_fs_ff_first  = ".$value_5." where cs_id = ".$id_5;	 
	$fwDb -> queryOne($sql5);
}


if(!empty($id_6))
{
	$sql6 = "Update construction_scheduler_report set  cs_fs_ff_insp  = ".$value_6." where cs_id = ".$id_6;	 
	$fwDb -> queryOne($sql6);
}


if(!empty($id_7))
{
	$sql7 = "Update construction_scheduler_report set  cs_termite_pro  = ".$value_7." where cs_id = ".$id_7;	 
	$fwDb -> queryOne($sql7);
}

if(!empty($id_8))
{
	$sql8 = "Update construction_scheduler_report set  cs_termite_pro_para  = ".$value_8." where cs_id = ".$id_8;	 
	$fwDb -> queryOne($sql8);
}

if(!empty($id_9))
{
	$sql9 = "Update construction_scheduler_report set  cs_slab_insp  = ".$value_9." where cs_id = ".$id_9;	 
	$fwDb -> queryOne($sql9);
}

if(!empty($id_10))
{
	$sql10 = "Update construction_scheduler_report set  cs_fs_quality_ass  = ".$value_10." where cs_id = ".$id_10;	 
	$fwDb -> queryOne($sql10);
}

if(!empty($id_11))
{
	$sql11 = "Update construction_scheduler_report set  cs_fs_postslab  = ".$value_11." where cs_id = ".$id_11;	 
	$fwDb -> queryOne($sql11);
}

if(!empty($id_12))
{
	$sql12 = "Update construction_scheduler_report set  cs_survey_id  = ".$value_12." where cs_id = ".$id_12;	 
	$fwDb -> queryOne($sql12);
}

if(!empty($id_13))
{
	$sql13 = "Update construction_scheduler_report set  cs_site_works  = ".$value_13." where cs_id = ".$id_13;	 
	$fwDb -> queryOne($sql13);
}

if(!empty($id_14))
{
	$sql14 = "Update construction_scheduler_report set  cs_cal_ss_out  = ".$value_14." where cs_id = ".$id_14;	 
	$fwDb -> queryOne($sql14);
}

if(!empty($id_15))
{
	$sql15 = "Update construction_scheduler_report set  cs_cal_ss_repo  = ".$value_15." where cs_id = ".$id_15;	 
	$fwDb -> queryOne($sql15);
}

$id_795 = $fwRequest->getParam('cs_id_795', '');
$value_795 = $fwRequest->getparam('value_795', '');
if(!empty($id_795))
{
	$sql795 = "Update construction_scheduler_report set cs_un_slab_ins = ".$value_795." where cs_id = ".$id_795;	 
	$fwDb -> queryOne($sql795);
}

$id_798 = $fwRequest->getParam('cs_id_798', '');
$value_798 = $fwRequest->getparam('value_798', '');
if(!empty($id_798))
{
	$sql798 = "Update construction_scheduler_report set cs_termite_notice = ".$value_798." where cs_id = ".$id_798;	 
	$fwDb -> queryOne($sql798);
}


 exit;