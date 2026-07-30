<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_recorded_meeting");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
