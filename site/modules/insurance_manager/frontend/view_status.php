<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';


$thisTable = new Fw_Db_Table("insurance_manager_status");
$fwViewData['typedata'] = $thisTable->getAllRows(); 