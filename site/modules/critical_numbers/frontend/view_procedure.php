<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_critical_numbers");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

$fwViewData['title'] = 'View '.$MODULE_SINGULAR;