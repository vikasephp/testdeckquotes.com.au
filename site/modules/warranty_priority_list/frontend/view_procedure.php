<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_warranty_priority_list");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 