<?php
$fwMainView = 'file:' . getcwd() . '/detail.tpl';
$table = new Fw_Db_Table($TABLE);
// $pc_id = $fwRequest->getParam($ID, '');
$submit = $fwRequest->getParam('subAddDetail', '');

if (!empty($submit)) {
    $detail = $fwRequest->getParam('doc', array());
    // db($_FILES); die();
    $this_id = (int)$detail[$ID];
    unset($detail[$ID]);

    if ($_FILES['dpml_snapshot']['name']) {
		$docfile_1 = $_FILES['dpml_snapshot']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['dpml_snapshot']['tmp_name'];
		$detail['dpml_snapshot'] = $docfile_1;
		$fileUploaded = upload($docfile_1, $temp_name_1);
	}
    if ($_FILES['dpml_example_evidence']['name']) {
		$docfile_1 = $_FILES['dpml_example_evidence']['name'];
		$docfile_1 =  preg_replace('/[^A-Z0-9._]/i', '_', $docfile_1);
		$temp_name_1 = $_FILES['dpml_example_evidence']['tmp_name'];
		$detail['dpml_example_evidence'] = $docfile_1;
		$fileUploaded = upload($docfile_1, $temp_name_1);
	}
    $sql = 'SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = "Open" AND bsn_name = "' . $detail['dpml_bsn_id'] . '"';
    $res = $fwDb->queryOne($sql);
    $detail['dpml_bsn_id'] = $res['bsn_id'];

    if ($this_id > 0) {
        $table->setWhere("$ID = $this_id");
        $opr = $table->updateRow($detail);
    }
    else{
        $detail['dpml_logged_date'] = date('Y-m-d');
        $opr = $table->insertRow($detail);
    }

    $fwViewData['opr'] = $opr;
}

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open'";
$projdetail  = $fwDb->query($sql);
$fwViewData['projdetail'] = $projdetail;

$sql = "SELECT u.user_name FROM users u, groups g, users_groups ug WHERE u.user_id = ug.user_id AND ug.group_id = g.group_id AND g.group_id != 2 AND u.user_id != 1 ORDER By g.group_id ASC, u.user_name ASC";
$userData = $fwDb->query($sql);
$fwViewData['userData'] = $userData;

$thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
    $table = new Fw_Db_Table($TABLE);
    $table->setWhere("$ID = $this_id");
    $record = $table->getRow();
    $sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open' AND bsn_id = '" . $record['dpml_bsn_id'] . "'";
    $res = $fwDb->queryOne($sql);
	$record['dpml_bsn_id'] = $res['bsn_name'];

    $fwViewData['record'] = $record;
    $fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
    $fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}

$sqlp = "select * from dp_mistak_log_plan";
$fwViewData['plansData'] = $fwDb->query($sqlp);