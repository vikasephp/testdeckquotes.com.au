<?php
$fwMainView = 'file:' . getcwd() . '/view_priority.tpl';

$thisTable = new Fw_Db_Table("mistake_log_priority");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

