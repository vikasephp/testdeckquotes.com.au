<?php
$fwMainView = 'file:' . getcwd() . '/view_status.tpl';

$thisTable = new Fw_Db_Table("email_response_status_cons");

$fwViewData['statusdata'] = $thisTable->getAllRows(); 

