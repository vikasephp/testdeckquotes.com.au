<?php
$fwMainView = 'file:' . getcwd() . '/viewtype.tpl';

$thisTable = new Fw_Db_Table("wacr_handover_options");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

