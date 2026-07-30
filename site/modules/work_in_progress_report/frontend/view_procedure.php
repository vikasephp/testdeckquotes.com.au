<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_work_in_progress");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

