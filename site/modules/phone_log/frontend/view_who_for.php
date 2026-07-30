<?php
$fwMainView = 'file:' . getcwd() . '/view_who_for.tpl';

$thisTable = new Fw_Db_Table("phone_log_whofor_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

