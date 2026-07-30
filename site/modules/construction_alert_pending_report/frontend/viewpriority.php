<?php
$fwMainView = 'file:' . getcwd() . '/viewpriority.tpl';

$thisTable = new Fw_Db_Table("car_priority");

$fwViewData['priorityData'] = $thisTable->getAllRows(); 

