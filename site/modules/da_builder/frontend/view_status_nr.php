<?php
$fwMainView = 'file:' . getcwd() . '/view_status_nr.tpl';

$thisTable = new Fw_Db_Table("status_admin_nr");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

