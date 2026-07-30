<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("entity_report_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

