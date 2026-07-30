<?php
$fwMainView = 'file:' . getcwd() . '/merged_invoice_list.tpl';


$thisTable = new Fw_Db_Table("poincc2_merged_invoice");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

