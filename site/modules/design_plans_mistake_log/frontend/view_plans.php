<?php
$fwMainView = 'file:' . getcwd() . '/view_plans.tpl';

$thisTable = new Fw_Db_Table("dp_mistak_log_plan");

$fwViewData['plansdata'] = $thisTable->getAllRows(); 

