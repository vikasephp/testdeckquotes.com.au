<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_delivery_conf");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

