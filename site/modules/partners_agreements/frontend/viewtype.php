<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("trade_partners_typeoptions");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

