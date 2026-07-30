<?php
$fwMainView = 'file:' . getcwd() . '/add_esc_notes.tpl';
$tableTask = new Fw_Db_Table('warranty_log_escalation_notes');

$wa_id = (int)$fwRequest->getParam('wa_id', 0);
$fwViewData['wa_id'] = $wa_id;

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['elsn_id'];
	unset($detail['elsn_id']);
	
	if ($_FILES['elsn_attachment_1']['name']) {
		$file_1 = $_FILES['elsn_attachment_1']['name'];
		$file_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $file_1);
		$temp_name_1 = $_FILES['elsn_attachment_1']['tmp_name'];
		$detail['elsn_attachment_1'] = $file_1;
		upload($file_1, $temp_name_1);
	}
	
	if ($_FILES['elsn_attachment_2']['name']) {
		$file_2 = $_FILES['elsn_attachment_2']['name'];
		$file_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $file_2);
		$temp_name_2 = $_FILES['elsn_attachment_2']['tmp_name'];
		$detail['elsn_attachment_2'] = $file_2;
		upload($file_2, $temp_name_2);
	}

	$detail['elsn_wa_id'] = $wa_id;
	$detail['elsn_created_by'] = $user;

	if ($this_id > 0) {
		unset($detail['elsn_id']);
		$tableTask->setWhere("elsn_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('elsn_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('warranty_log_escalation_notes');
	$tableTask->setWhere("elsn_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Escalation Notes';
} else {
	$fwViewData['title'] = 'Add Escalation Notes';
}
