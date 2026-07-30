<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table('last_meeting_minutes');
$submit = $fwRequest->getParam('subAddDetail', '');
$fileUploaded = true;

if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);

	if ($_FILES['plan']['name']) {
		$docfile_1 = $_FILES['plan']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['plan']['tmp_name'];
		$detail['lmm_doc_file_name'] = $docfile_1;
		$fileUploaded = upload($docfile_1, $temp_name_1);
	}
	// $detail['lmm_doc_date_uploaded'] = date('d-m-Y');
	if($fileUploaded){
		$opr = $tableqa->insertRow($detail);
		// db($fileUploaded, '$fileUploaded');
		// db($opr, '$opr'); die();
	}

	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {

	$tableqa = new Fw_Db_Table($TABLE);
	$tableqa->setWhere("$ID = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}

$fwViewData['error'] = !$fileUploaded ? 'Problem in uploading file' : '';

$sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open'";
$fwViewData['projdetail'] = $fwDb->query($sql);
