<?php
$fwMainView = 'file:' . getcwd() . '/view_change_needed.tpl';


$thisTable = new Fw_Db_Table("165_report_change_needed");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

