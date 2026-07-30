<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("report_status_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

