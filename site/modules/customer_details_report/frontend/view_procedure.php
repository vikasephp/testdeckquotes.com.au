<?php
$fwMainView = 'file:' . getcwd() . '/view_procedure.tpl';

$thisTable = new Fw_Db_Table("pp_cust_dr");

$fwViewData['proceduredata'] = $thisTable->getAllRows(); 

