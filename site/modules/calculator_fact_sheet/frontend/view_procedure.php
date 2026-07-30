<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_calculator_fs");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
