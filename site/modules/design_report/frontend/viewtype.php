<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("design_report_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

