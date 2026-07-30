<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_queans");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
