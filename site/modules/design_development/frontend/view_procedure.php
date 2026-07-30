<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_des_dev");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

