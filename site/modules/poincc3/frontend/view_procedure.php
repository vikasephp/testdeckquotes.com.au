<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("procedure_panel_poincc");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

