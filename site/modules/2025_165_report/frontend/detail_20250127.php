<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$fwViewData['wa_id'] = (int)$fwRequest->getParam('wa_id', 0);
$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);

	// db($TABLE, 'TABLE');
	// db($detail, 'detail');
	// db($_FILES['os2_snapshot'], 'os2_snapshot');
	// die();

	if ($_FILES['os2_snapshot']['name']) {
		$docfile_1 = $_FILES['os2_snapshot']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['os2_snapshot']['tmp_name'];
		upload($docfile_1, $temp_name_1);
		$detail['os2_snapshot'] = $docfile_1;
	}

	if ($this_id > 0) {
		$tableqa->setWhere("$ID = $this_id");
		$opr = $tableqa->updateRow($detail);
	} else {
		// $detail['os2_uid'] = md5($TABLE . time());
		$opr = $tableqa->insertRow($detail);
	}

	$fwViewData['opr'] = $opr;

	//Location(BASE_URL . $XFA['home']);
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

$sql = "SELECT bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);

$sql = "select * from 165_2025_stage";

$fwViewData['stage'] = $fwDb->query($sql);
