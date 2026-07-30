<?php
$fwMainView = 'file:' . getcwd() . '/add_new.tpl';

$fwViewData['primary_id'] = $primary_id = 'ldd_id';
$tableTask = new Fw_Db_Table($TABLE);

$user_id = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam($TABLE, array());
	$this_id = (int)$detail[$primary_id];
	unset($detail[$primary_id]);

    $sql = "SELECT bsn_id, bsn_name, bsn_address from business where (bsn_sub_status = 'Open' or bsn_sub_status = 'Lost' or bsn_sub_status = 'Hold') AND bsn_name = '" . $detail['ldd_bsn_id'] . "'";
    $res = $fwDb->queryOne($sql);
    $detail['ldd_bsn_id'] = $res['bsn_id'];
	$detail['ldd_type_id'] = $DEFAULT_TYPE_ID;
	if ($this_id > 0) {
		unset($detail[$primary_id]);
		$tableTask->setWhere("$primary_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}
$this_id = (int)$fwRequest->getParam($primary_id, 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table($TABLE);
	$tableTask->setWhere("$primary_id = $this_id");
	$detail = $tableTask->getRow();
	$sql = "SELECT bsn_id, bsn_name, bsn_address from business where (bsn_sub_status = 'Open' or bsn_sub_status = 'Lost' or bsn_sub_status = 'Hold') AND bsn_id = '" . $detail['ldd_bsn_id'] . "'";
    $res = $fwDb->queryOne($sql);
	$detail['ldd_bsn_id'] = $res['bsn_name'];
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
	$fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}

$thisTable = new Fw_Db_Table('legal_dispute_database_type');
$fwViewData['typedata'] = $thisTable->getAllRows();
$thisTable = new Fw_Db_Table('legal_dispute_database_status');
$fwViewData['statusdata'] = $thisTable->getAllRows();
$sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open' or bsn_sub_status = 'Lost' or bsn_sub_status = 'Hold'";
$fwViewData['projdetail'] = $fwDb->query($sql);
