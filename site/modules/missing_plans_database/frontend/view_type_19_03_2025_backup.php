<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';
$thisTable = new Fw_Db_Table("missing_plans_database_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

$fwViewData['page_title'] = $MODULE_PLURAL;
$fwViewData['primary_id'] = 'mpd_id';