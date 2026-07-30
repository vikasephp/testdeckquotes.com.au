<?php
$fwMainView = 'file:' . getcwd() . '/view_outcome.tpl';

$thisTable = new Fw_Db_Table("proactive_outcome");

$fwViewData['crData'] = $thisTable->getAllRows(); 

