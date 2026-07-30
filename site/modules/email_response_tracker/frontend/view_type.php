<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("email_response_type");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

