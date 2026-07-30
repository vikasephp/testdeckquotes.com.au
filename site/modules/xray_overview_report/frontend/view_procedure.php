<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_xray_overview");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

