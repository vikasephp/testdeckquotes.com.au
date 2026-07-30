<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_planning_proj");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
