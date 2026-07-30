<?php
$fwMainView = 'file:' . getcwd() . '/add_en_notes.tpl';
$tableTask = new Fw_Db_Table('psr_enquiry_notes');

$psre_id = (int)$fwRequest->getParam('psre_id', 0);
$fwViewData['psre_id'] = $psre_id;

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['psren_id'];
	unset($detail['psren_id']);

	$detail['psren_psre_id'] = $psre_id;
	$detail['psren_created_by'] = $user;
	
	if (!empty($detail['psren_created_at'])) {
		$date = DateTime::createFromFormat('d-m-Y', $detail['psren_created_at']);
		if ($date) {
			$detail['psren_created_at'] = $date->format('Y-m-d H:i:s');
		} else {
			$detail['psren_created_at'] = null;
		}
	}

	if ($this_id > 0) {
		unset($detail['psren_id']);
		$tableTask->setWhere("psren_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('psren_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('psr_enquiry_notes');
	$tableTask->setWhere("psren_id = $this_id");
	$detail = $tableTask->getRow();

	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Enquiry Notes';
} else {
	$fwViewData['title'] = 'Add Enquiry Notes';
}
