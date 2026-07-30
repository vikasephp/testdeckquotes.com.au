<?php
$fwMainView = 'file:' . getcwd() . '/show-log-email-content.tpl';
//$tableEmailLog = new Fw_Db_Table('email_log');
$emailfailure = $fwRequest->getParam('emailfailure', 0);
if (!empty($emailfailure) ){
	$tableEmailLog = new Fw_Db_Table('email_failure_log');
} else {
	$tableEmailLog = new Fw_Db_Table('email_log');
}
$submit = $fwRequest->getParam('subAddDetail', '');
$elog_id = $fwRequest->getParam('elog_id', 0);

$tableEmailLog->setWhere('elog_id = '.$elog_id);
$fwViewData['detail'] = $tableEmailLog->getRow();
$fwViewData['title'] = 'Email Content';	
