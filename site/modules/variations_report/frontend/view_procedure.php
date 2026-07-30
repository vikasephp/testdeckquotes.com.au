<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_variations_report");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

