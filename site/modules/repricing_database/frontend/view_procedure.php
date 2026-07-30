<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_repricing_db");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

