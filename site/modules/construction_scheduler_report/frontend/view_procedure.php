<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_con_sch_report");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

