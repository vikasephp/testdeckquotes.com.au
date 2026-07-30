<?php

$cs_id_ch = $fwRequest->getParam('cs_id_ch', '');
$cs_id_cal = $fwRequest->getParam('cs_id_cal', '');
$value = $fwRequest->getparam('value', '');

if(!empty($cs_id_ch))
{
	$sql = "Update construction_scheduler_report set  cs_ch_sod  = '".$value."' where cs_id = ".$cs_id_ch;	 
	$fwDb -> queryOne($sql);
}

if(!empty($cs_id_cal))
{
	$sql = "Update construction_scheduler_report set  cs_cal_sod   = '".$value."' where cs_id = ".$cs_id_cal;	 
	$fwDb -> queryOne($sql);
}
 exit;