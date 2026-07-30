<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_fact_sheet");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

