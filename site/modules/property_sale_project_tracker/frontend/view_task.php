<?php
$fwMainView = 'file:' . getcwd() . '/view_task.tpl';

$st_id = (int)$fwRequest->getparam('st_id', 0);
$fwViewData['st_id'] = $st_id;

$sql = "select * from property_sale_task_master where tm_stage_id = ".$st_id ." order by tm_step_number ";

$fwViewData['statusdata'] = $fwDb->query($sql); 

