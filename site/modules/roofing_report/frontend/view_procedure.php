<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_roofing_report");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

