<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';


$thisTable = new Fw_Db_Table("lvc_ut_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

