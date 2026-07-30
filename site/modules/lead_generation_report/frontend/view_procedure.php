<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_lead_generation");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

