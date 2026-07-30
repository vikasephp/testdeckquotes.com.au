<?php
$fwMainView = 'file:' . getcwd() . '/view_liability.tpl';


$thisTable = new Fw_Db_Table("warranty_log_liability");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

