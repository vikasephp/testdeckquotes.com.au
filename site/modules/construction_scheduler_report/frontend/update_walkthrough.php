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

$id_9 = $fwRequest->getParam('cs_id_9', '');
$value_9 = $fwRequest->getparam('value_9', '');
if(!empty($id_9))
{
	$sql9 = "Update construction_scheduler_report set cs_driveway_verge = ".$value_9." where cs_id = ".$id_9;	 
	$fwDb -> queryOne($sql9);
}

$id_413 = $fwRequest->getParam('cs_id_413', '');
$value_413 = $fwRequest->getparam('value_413', '');

if(!empty($id_413))
{
	$sql413 = "Update construction_scheduler_report set cs_gla_showr_screen = ".$value_413." where cs_id = ".$id_413;	 
	$fwDb -> queryOne($sql413);
}

$id_735 = $fwRequest->getParam('cs_id_735', '');
$value_735 = $fwRequest->getparam('value_735', '');

if(!empty($id_735))
{
	$sql735 = "Update construction_scheduler_report set cs_gla_ward_doors = ".$value_735." where cs_id = ".$id_735;	 
	$fwDb -> queryOne($sql735);
}

$id_736 = $fwRequest->getParam('cs_id_736', '');
$value_736 = $fwRequest->getparam('value_736', '');

if(!empty($id_736))
{
	$sql736 = "Update construction_scheduler_report set cs_glass_mirr_splash = ".$value_736." where cs_id = ".$id_736;	 
	$fwDb -> queryOne($sql736);
}

$id_738 = $fwRequest->getParam('cs_id_738', '');
$value_738 = $fwRequest->getparam('value_738', '');

if(!empty($id_738))
{
	$sql738 = "Update construction_scheduler_report set cs_glass_balustrade = ".$value_738." where cs_id = ".$id_738;	 
	$fwDb -> queryOne($sql738);
}

$id_163 = $fwRequest->getParam('cs_id_163', '');
$value_163 = $fwRequest->getparam('value_163', '');

if(!empty($id_163))
{
	$sql163 = "Update construction_scheduler_report set cs_watrproof_cert = ".$value_163." where cs_id = ".$id_163;	 
	$fwDb -> queryOne($sql163);
}

$id_296 = $fwRequest->getParam('cs_id_296', '');
$value_296 = $fwRequest->getparam('value_296', '');

if(!empty($id_296))
{
	$sql296 = "Update construction_scheduler_report set cs_smoke_alarm_cert = ".$value_296." where cs_id = ".$id_296;	 
	$fwDb -> queryOne($sql296);
}

$id_713 = $fwRequest->getParam('cs_id_713', '');
$value_713 = $fwRequest->getparam('value_713', '');

if(!empty($id_713))
{
	$sql713 = "Update construction_scheduler_report set cs_slip_resist_cert = ".$value_713." where cs_id = ".$id_713;	 
	$fwDb -> queryOne($sql713);
}

$id_714 = $fwRequest->getParam('cs_id_714', '');
$value_714 = $fwRequest->getparam('value_714', '');

if(!empty($id_714))
{
	$sql714 = "Update construction_scheduler_report set cs_slip_ext_cert = ".$value_714." where cs_id = ".$id_714;	 
	$fwDb -> queryOne($sql714);
}

$id_694 = $fwRequest->getParam('cs_id_694', '');
$value_694 = $fwRequest->getparam('value_694', '');

if(!empty($id_694))
{
	$sql694 = "Update construction_scheduler_report set cs_amend_appr = ".$value_694." where cs_id = ".$id_694;	 
	$fwDb -> queryOne($sql694);
}

$id_637 = $fwRequest->getParam('cs_id_637', '');
$value_637 = $fwRequest->getparam('value_637', '');

if(!empty($id_637))
{
	$sql637 = "Update construction_scheduler_report set cs_ba_amnd_auth = ".$value_637." where cs_id = ".$id_637;	 
	$fwDb -> queryOne($sql637);
}


 exit;