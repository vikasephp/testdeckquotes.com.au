<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';


$thisTable = new Fw_Db_Table("short_stays_payables_tracker_invoice_stage");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

