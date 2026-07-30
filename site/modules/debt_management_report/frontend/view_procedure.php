<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_debt_managment");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

