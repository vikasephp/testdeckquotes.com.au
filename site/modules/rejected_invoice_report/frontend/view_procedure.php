<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_rejected_invoice");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

