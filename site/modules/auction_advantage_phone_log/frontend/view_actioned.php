<?php
$fwMainView = 'file:' . getcwd() . '/view_actioned.tpl';

$thisTable = new Fw_Db_Table("auction_advantage_phone_log_actioned");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

