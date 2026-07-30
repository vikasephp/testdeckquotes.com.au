<?php
$fwMainView = 'file:' . getcwd() . '/view_projecttype.tpl';

$sql_l = "Select * from inclusions_task_tracker_project_type";
$fwViewData['project_type'] = $fwDb->query($sql_l);