<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure_detail.tpl';


$thisTable = new Fw_Db_Table("pp_status_task_detail");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

