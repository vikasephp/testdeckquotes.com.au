<?php
$fwMainView = 'file:' . getcwd() . '/view_leave.tpl';

$thisTable = new Fw_Db_Table("timesheet_leave");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

