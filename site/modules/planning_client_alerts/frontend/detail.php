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

    $sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open' AND bsn_name = '" . $detail['pca_bsn_id'] . "'";
    $res = $fwDb->queryOne($sql);
    $detail['pca_bsn_id'] = $res['bsn_id'];

    if ($this_id > 0) {
        $table->setWhere("$ID = $this_id");
        $opr = $table->updateRow($detail);
    }
    else{
        $opr = $table->insertRow($detail);
    }

    $fwViewData['opr'] = $opr;
}

$sql = "SELECT bsn_id, bsn_name, bsn_address FROM business WHERE bsn_sub_status = 'Open'";
$projdetail  = $fwDb->query($sql);
$fwViewData['projdetail'] = $projdetail;

$thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
$fwViewData['typedata'] = $typedata = $thisTable->getAllRows();

$this_id = (int)$fwRequest->getParam($ID, 0);
if ($this_id > 0) {
    $table = new Fw_Db_Table($TABLE);
    $table->setWhere("$ID = $this_id");
    $record = $table->getRow();
    $sql = "SELECT bsn_id, bsn_name, bsn_address from business where bsn_sub_status = 'Open' AND bsn_id = '" . $record['pca_bsn_id'] . "'";
    $res = $fwDb->queryOne($sql);
	$record['pca_bsn_id'] = $res['bsn_name'];

    $fwViewData['record'] = $record;
    $fwViewData['title'] = 'Edit ' . $MODULE_SINGULAR;
} else {
    $fwViewData['title'] = 'Add ' . $MODULE_SINGULAR;
}
