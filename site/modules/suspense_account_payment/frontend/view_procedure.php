<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_suspense_account");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
