<?php
$fwMainView = 'file:' . getcwd() . '/view_stage.tpl';


$thisTable = new Fw_Db_Table("poincc3_invoice_stage");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

