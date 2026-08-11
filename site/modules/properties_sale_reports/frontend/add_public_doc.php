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
	
	if (!empty($_FILES['task']['name']['psrpd_file'])) {		
		$file = $_FILES['task'];
		$docfile_1 = $file['name']['psrpd_file'];
		$docfile_1 = preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);

		$temp_name_1 = $file['tmp_name']['psrpd_file'];

		$fileUploaded = upload_public_doc($docfile_1, $temp_name_1);
		$detail['psrpd_file'] = $docfile_1;
		$detail['psrpd_file_uploaded_by'] = $user;
		$detail['psrpd_file_uploaded_at'] = $dt;
	}
	
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
