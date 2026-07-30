<?php
$fwMainView = 'file:' . getcwd() . '/add_public_doc.tpl';
$tableTask = new Fw_Db_Table('psr_public_documents');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$dt = date('d-m-Y');
$user = $_SESSION['user']['user_name'];

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail['psrpd_id'];
	$detail['psrpd_updated_by'] = $user;
	$detail['psrpd_updated_date'] = $dt;
	unset($detail['psrpd_id']);
	if ($this_id > 0) {
		unset($detail['psrpd_id']);
		$tableTask->setWhere("psrpd_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}
$this_id = (int)$fwRequest->getParam('psrpd_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('psr_public_documents');
	$tableTask->setWhere("psrpd_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ';
} else {
	$fwViewData['title'] = 'Add ';
}
