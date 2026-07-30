<?php
$fwMainView = 'file:' . getcwd() . '/view_method.tpl';

$thisTable = new Fw_Db_Table("suspense_account_method");

$fwViewData['methoddata'] = $thisTable->getAllRows(); 

