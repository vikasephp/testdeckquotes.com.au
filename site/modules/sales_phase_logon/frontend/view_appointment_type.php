<?php
$fwMainView = 'file:' . getcwd() . '/view_appointment_type.tpl';

$thisTable = new Fw_Db_Table("sales_phase_logon_appointment_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 
