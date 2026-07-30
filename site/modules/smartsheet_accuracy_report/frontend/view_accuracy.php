<?php
$fwMainView = 'file:' . getcwd() . '/view_accuracy.tpl';

$thisTable = new Fw_Db_Table("accuracy_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

