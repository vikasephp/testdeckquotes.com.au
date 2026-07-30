<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_customer_complete");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

