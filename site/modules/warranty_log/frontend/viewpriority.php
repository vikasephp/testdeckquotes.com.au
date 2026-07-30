<?php
$fwMainView = 'file:' . getcwd() . '/viewpriority.tpl';

$thisTable = new Fw_Db_Table("warranty_log_priority");

$fwViewData['priorityData'] = $thisTable->getAllRows(); 

