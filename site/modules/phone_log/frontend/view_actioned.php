<?php
$fwMainView = 'file:' . getcwd() . '/view_actioned.tpl';

$thisTable = new Fw_Db_Table("phone_log_actioned_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

