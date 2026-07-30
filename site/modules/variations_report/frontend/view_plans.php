<?php
$fwMainView = 'file:' . getcwd() . '/view_plans.tpl';

$thisTable = new Fw_Db_Table("variation_report_plans");

$fwViewData['plansdata'] = $thisTable->getAllRows(); 

