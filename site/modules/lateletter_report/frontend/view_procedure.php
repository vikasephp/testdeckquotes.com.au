<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_late_letter");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

