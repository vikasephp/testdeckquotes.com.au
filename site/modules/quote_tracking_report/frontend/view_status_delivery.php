<?php
$fwMainView = 'file:' . getcwd() . '/view_status_delivery.tpl';

$thisTable = new Fw_Db_Table("quote_tracking_status_delivery");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

