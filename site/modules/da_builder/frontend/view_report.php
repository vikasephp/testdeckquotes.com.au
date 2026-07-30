<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_report_table");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

