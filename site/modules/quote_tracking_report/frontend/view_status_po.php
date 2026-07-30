<?php
$fwMainView = 'file:' . getcwd() . '/view_status_po.tpl';

$thisTable = new Fw_Db_Table("quote_tracking_status_po");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

