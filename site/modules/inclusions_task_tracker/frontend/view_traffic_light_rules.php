<?php
$fwMainView = 'file:' . getcwd() . '/view_traffic_light_rules.tpl';


$thisTable = new Fw_Db_Table("inclusions_task_tracker_traffic_light");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

