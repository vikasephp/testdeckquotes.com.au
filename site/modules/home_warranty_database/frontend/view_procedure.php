<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_hw_database");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

