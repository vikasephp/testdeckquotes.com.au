<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_staff_bulletins");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

