<?php
$fwMainView = 'file:' . getcwd() . '/view_why_not.tpl';


$thisTable = new Fw_Db_Table("warranty_log_why_not");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

