<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("mobile_list_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

