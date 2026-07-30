<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_mobile_list");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

