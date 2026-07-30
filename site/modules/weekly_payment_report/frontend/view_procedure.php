<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_weekly_payment");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

