<?php
$fwMainView = 'file:' . getcwd() . '/view_approver.tpl';


$thisTable = new Fw_Db_Table("poincc2_invoice_approver");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

