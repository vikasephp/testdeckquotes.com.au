<?php
$fwMainView = 'file:' . getcwd() . '/get_email_content.tpl';
//$tableEmailLog = new Fw_Db_Table('letter_email_log');

$tableEmailLog = new Fw_Db_Table('letter_email_log');

$submit = $fwRequest->getParam('subAddDetail', '');
$log_id = $fwRequest->getParam('log_id', 0);

$tableEmailLog->setWhere('letter_log_id = '.$log_id);
$fwViewData['detail'] = $tableEmailLog->getRow();
$fwViewData['title'] = 'Email Content';	
