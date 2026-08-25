<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_cou_component_escalation");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
