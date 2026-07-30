<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';


$thisTable = new Fw_Db_Table("pp_property_sale_tracker");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

