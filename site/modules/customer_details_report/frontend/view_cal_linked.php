<?php
$fwMainView = 'file:' . getcwd() . '/view_cal_linked.tpl';

$thisTable = new Fw_Db_Table("calendar_linked_admin");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

