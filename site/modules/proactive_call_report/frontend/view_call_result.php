<?php
$fwMainView = 'file:' . getcwd() . '/view_call_result.tpl';

$thisTable = new Fw_Db_Table("pcr_call_result");

$fwViewData['crData'] = $thisTable->getAllRows(); 

