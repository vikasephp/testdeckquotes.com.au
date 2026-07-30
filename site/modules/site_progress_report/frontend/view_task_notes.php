<?php
$fwMainView = 'file:' . getcwd() . '/view_task_notes.tpl';
$tn_id = (int)$fwRequest->getParam('tn_id', 0);

$sql = "SELECT site_progress_report_task_notes.*, users.user_name FROM `site_progress_report_task_notes` Left JOIN users on site_progress_report_task_notes.sprtn_created_by = users.user_id where site_progress_report_task_notes.sprtn_tn_id = ".$tn_id ." order by site_progress_report_task_notes.sprtn_created_at desc ";
$data = $fwDb->query($sql);

$fwViewData['tn_id'] = $tn_id;
$fwViewData['data'] = $data; 