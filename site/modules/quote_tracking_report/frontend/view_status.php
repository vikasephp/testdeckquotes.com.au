<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("quote_tracking_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

