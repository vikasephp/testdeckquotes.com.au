<?php
$fwMainView = 'file:' . getcwd() . '/view_quote_status.tpl';


$thisTable = new Fw_Db_Table("quote_management_report_status");

$fwViewData['qsdata'] = $thisTable->getAllRows(); 

