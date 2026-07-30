<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("sub_pages_status");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

