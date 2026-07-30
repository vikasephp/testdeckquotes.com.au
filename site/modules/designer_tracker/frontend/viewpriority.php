<?php
$fwMainView = 'file:' . getcwd() . '/viewpriority.tpl';

$thisTable = new Fw_Db_Table("design_tracker_priority");

$fwViewData['priorityData'] = $thisTable->getAllRows(); 

