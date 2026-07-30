<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_customer_nps");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

