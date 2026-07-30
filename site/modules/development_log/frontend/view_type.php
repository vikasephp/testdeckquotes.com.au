<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("development_log_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

