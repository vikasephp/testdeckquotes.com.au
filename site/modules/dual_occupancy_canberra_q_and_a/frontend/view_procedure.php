<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_dual_occupancy_canberra_qanda");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 
