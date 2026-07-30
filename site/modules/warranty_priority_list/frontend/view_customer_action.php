<?php
$fwMainView = 'file:' . getcwd() . '/view_customer_action.tpl';

$thisTable = new Fw_Db_Table("warranty_log_customer_action");

$fwViewData['typedata'] = $thisTable->getAllRows(); 
