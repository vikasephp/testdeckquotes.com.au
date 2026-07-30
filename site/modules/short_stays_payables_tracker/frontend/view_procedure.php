<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("procedure_panel_short_stays_payables_tracker");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

