<?php
$fwMainView = 'file:' . getcwd() . '/view_area.tpl';


$thisTable = new Fw_Db_Table("warranty_log_area");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

