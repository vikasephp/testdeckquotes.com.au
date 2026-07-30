<?php
$fwMainView = 'file:' . getcwd() . '/view_action.tpl';

$thisTable = new Fw_Db_Table("missing_variations_action");

$fwViewData['plansdata'] = $thisTable->getAllRows(); 

