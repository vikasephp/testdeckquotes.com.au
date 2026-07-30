<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("pcr_status_admin");

$fwViewData['componentData'] = $thisTable->getAllRows(); 

