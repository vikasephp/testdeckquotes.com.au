<?php
$fwMainView = 'file:' . getcwd() . '/add_enquiry_sms_template.tpl';
$tableTask = new Fw_Db_Table('psr_enquiry_sms_templates');

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['psrest_id'];
	unset($detail['psrest_id']);

	if ($this_id > 0) {
		unset($detail['psrest_id']);
		$tableTask->setWhere("psrest_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('psrest_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('psr_enquiry_sms_templates');
	$tableTask->setWhere("psrest_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit SMS Template';
} else {
	$fwViewData['title'] = 'Add SMS Template';
}
