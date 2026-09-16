<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("auction_advantage_phone_log_call_types");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

