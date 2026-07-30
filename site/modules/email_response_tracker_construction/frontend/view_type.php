<?php
$fwMainView = 'file:' . getcwd() . '/view_type.tpl';

$thisTable = new Fw_Db_Table("email_response_type_cons");

$fwViewData['typedata'] = $thisTable->getAllRows(); 

