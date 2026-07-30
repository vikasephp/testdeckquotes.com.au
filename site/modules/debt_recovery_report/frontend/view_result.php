<?php
$fwMainView = 'file:' . getcwd() . '/view_result.tpl';

$thisTable = new Fw_Db_Table("debt_recovery_call_result");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

