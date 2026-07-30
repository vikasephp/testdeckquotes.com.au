<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_sales_phase_logon");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

