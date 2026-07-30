<?php
$fwMainView = 'file:' . getcwd() . '/view_sbc.tpl';

$thisTable = new Fw_Db_Table("xray_overview_sbc");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

