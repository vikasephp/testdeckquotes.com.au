<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$tableqa = new Fw_Db_Table($TABLE);
$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$ID];

	unset($detail[$ID]);

	$project_name = $detail['sp_project'];
	$findBSN = "SELECT bsn_id FROM `business` WHERE `bsn_name` LIKE '%" . addslashes($project_name) . "%'";
	$projectbsn = $fwDb->query($findBSN);
	$fwViewData['projectbsn'] = $projectbsn;
	// db($findBSN);
	// db($projectbsn);
	// exit;
	if (isset($projectbsn[0]) && isset($projectbsn[0]['bsn_id'])) {
		$detail['sp_bsn_id'] = $projectbsn[0]['bsn_id'];

		if ($_FILES['attach_1']['name']) {
			$docfile_1 = $_FILES['attach_1']['name'];
			$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
			$temp_name_1 = $_FILES['attach_1']['tmp_name'];
			$detail['sp_attachment_1'] = $docfile_1;
			upload($docfile_1, $temp_name_1);
		}

		if ($_FILES['attach_2']['name']) {
			$docfile_2 = $_FILES['attach_2']['name'];
			$docfile_2 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_2);
			$temp_name_2 = $_FILES['attach_2']['tmp_name'];
			$detail['sp_attachment_2'] = $docfile_2;
			upload($docfile_2, $temp_name_2);
		}

		if ($_FILES['attach_3']['name']) {
			$docfile_3 = $_FILES['attach_3']['name'];
			$docfile_3 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_3);
			$temp_name_3 = $_FILES['attach_3']['tmp_name'];
			$detail['sp_attachment_3'] = $docfile_3;
			upload($docfile_3, $temp_name_3);
		}

		if ($_FILES['attach_4']['name']) {
			$docfile_4 = $_FILES['attach_4']['name'];
			$docfile_4 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_4);
			$temp_name_4 = $_FILES['attach_4']['tmp_name'];
			$detail['sp_attachment_4'] = $docfile_4;
			upload($docfile_4, $temp_name_4);
		}

		if ($_FILES['attach_5']['name']) {
			$docfile_5 = $_FILES['attach_5']['name'];
			$docfile_5 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_5);
			$temp_name_5 = $_FILES['attach_5']['tmp_name'];
			$detail['sp_attachment_5'] = $docfile_5;
			upload($docfile_5, $temp_name_5);
		}

		$detail['sp_updated_by'] = $_SESSION['user']['user_id'];
		$detail['sp_updated_table'] = 'users';

		if ($this_id > 0) {
			$tableqa->setWhere("$ID = $this_id");
			$opr = $tableqa->updateRow($detail);
		} else {
			$detail['sp_created_table'] = 'users';
			$detail['sp_created_by'] = $_SESSION['user']['user_id'];
			$opr = $tableqa->insertRow($detail);
		}

		$fwViewData['opr'] = $opr;
	} else {
		$fwViewData['error'] = 'Select the valid project';
	}

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

$sql = "SELECT  bsn_id, bsn_name from business";
$fwViewData['projdetail'] = $fwDb->query($sql);


$sqlpr = "Select * from site_progress_report_task";
$fwViewData['cdetail'] = $fwDb->query($sqlpr);
