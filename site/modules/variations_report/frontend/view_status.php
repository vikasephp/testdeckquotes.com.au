<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("variation_report_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

