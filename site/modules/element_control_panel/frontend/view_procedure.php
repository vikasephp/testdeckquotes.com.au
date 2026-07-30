<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_element_cp");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
