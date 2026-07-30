<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_proj_prog_report");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

