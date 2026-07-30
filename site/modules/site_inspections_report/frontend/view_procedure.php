<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_site_inspections");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

