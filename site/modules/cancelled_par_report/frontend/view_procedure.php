<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_cancelled_par");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

