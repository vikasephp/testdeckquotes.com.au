<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_vehicle_log");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

