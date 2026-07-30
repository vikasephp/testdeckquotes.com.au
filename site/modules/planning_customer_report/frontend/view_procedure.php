<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_planning_cr");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

