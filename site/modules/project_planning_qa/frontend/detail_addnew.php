<?php
$fwMainView = 'file:' . getcwd() . '/detail_addnew.tpl';
$tableqa = new Fw_Db_Table('business_qa');
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail['bqa_id'];
	unset($detail['id']);
	$detail['manual'] =  1;
	$data = explode("|", $detail['project']);
	if ($_FILES['ques_attach_1']['name']) {
		$docfile_1 = $_FILES['ques_attach_1']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['ques_attach_1']['tmp_name'];
		$detail['bqa_attachment_ques_1'] = $docfile_1;
		upload($docfile_1, $temp_name_1);
	}
	if ($_FILES['ques_attach_2']['name']) {
		$docfile_2 = $_FILES['ques_attach_2']['name'];
		$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
		$temp_name_2 = $_FILES['ques_attach_2']['tmp_name'];
		$detail['bqa_attachment_ques_2'] = $docfile_2;
		upload($docfile_2, $temp_name_2);
	}
	if ($_FILES['ques_attach_3']['name']) {
		$docfile_3 = $_FILES['ques_attach_3']['name'];
		$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
		$temp_name_3 = $_FILES['ques_attach_3']['tmp_name'];
		$detail['bqa_attachment_ques_3'] = $docfile_3;
		upload($docfile_3, $temp_name_3);
	}
	if ($_FILES['ques_attach_4']['name']) {
		$docfile_4 = $_FILES['ques_attach_4']['name'];
		$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
		$temp_name_4 = $_FILES['ques_attach_4']['tmp_name'];
		$detail['bqa_attachment_ques_4'] = $docfile_4;
		upload($docfile_4, $temp_name_4);
	}
	if ($_FILES['ques_attach_5']['name']) {
		$docfile_5 = $_FILES['ques_attach_5']['name'];
		$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
		$temp_name_5 = $_FILES['ques_attach_5']['tmp_name'];
		$detail['bqa_attachment_ques_5'] = $docfile_5;
		upload($docfile_5, $temp_name_5);
	}
	$detail['bqa_bsn_id'] = $data[0];
	if ($this_id > 0) {
		$tableqa->setWhere("bqa_id = $this_id");
		$opr = $tableqa->updateRow($detail);
	} else {
		$sqlmx = "SELECT MAX(bqa_unique_id) AS bqa_unique_id FROM business_qa";
		$uni = $fwDb->queryOne($sqlmx);
		$bqa_unique_id = $uni['bqa_unique_id'] + 1;
		$detail['bqa_unique_id'] = $bqa_unique_id;
		$detail['bqa_from_pae'] = 1;
		$detail['bqa_que_user_id'] = $_SESSION['user']['user_id'];
		$opr = $tableqa->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
	//Location(BASE_URL . $XFA['home']);
}
$this_id = (int)$fwRequest->getParam('bqa_id', 0);
if ($this_id > 0) {
	$tableqa = new Fw_Db_Table('business_qa');
	$tableqa->setWhere("bqa_id = $this_id");
	$detail = $tableqa->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
$sql = "SELECT  business.* from business";
$fwViewData['projdetail'] = $fwDb->query($sql);
