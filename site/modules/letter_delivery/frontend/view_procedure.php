<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("procedure_panel_letterdelivery");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

