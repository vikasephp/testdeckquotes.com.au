<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("invoice_types");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

