<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure_dcr.tpl';


$thisTable = new Fw_Db_Table("pp_dcr");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

