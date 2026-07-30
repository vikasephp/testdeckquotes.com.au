<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_inclusions_tt");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

