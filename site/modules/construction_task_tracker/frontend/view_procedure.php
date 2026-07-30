<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_const_task_tracker");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

