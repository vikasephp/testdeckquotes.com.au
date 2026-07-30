<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';


$thisTable = new Fw_Db_Table("poincc2_invoice_stage");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

