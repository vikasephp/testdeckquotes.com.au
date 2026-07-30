<?php
$fwMainView = 'file:' . getcwd() . '/show-log-email-content.tpl';
$tableEmailLog = new Fw_Db_Table('customer_email_log');
$submit = $fwRequest->getParam('subAddDetail', '');
$ce_id = $fwRequest->getParam('ce_id', 0);

	$tableEmailLog->setWhere('ce_id = '.$ce_id);
	$fwViewData['detail'] = $tableEmailLog->getRow();
    $fwViewData['title'] = 'Email Content';

	
	