<?php
$fwMainView = 'file:' . getcwd() . '/add_wlai.tpl';

$tableTask = new Fw_Db_Table("watch_list_action_items");
$wlai_bsn_id = $fwRequest->getParam('wlai_bsn_id', '');
$fwViewData['wlai_bsn_id'] = $wlai_bsn_id;

$wlai_id = $fwRequest->getParam('wlai_id', '');
$fwViewData['wlai_id'] = $wlai_id;

$primary_id = 'wlai_id';

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('task', array());
	$this_id = (int)$detail[$primary_id];
	unset($detail[$primary_id]);
	
	if (isset($detail['wlai_action_status']) && $detail['wlai_action_status'] == 'Complete') {
        $detail['wlai_action_status_date'] = date('d-m-Y');
		$detail['wlai_action_status_user'] = $_SESSION['user']['user_name'];
    }
	
	if ($this_id > 0) {
		unset($detail[$primary_id]);
		$tableTask->setWhere("$primary_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	} else {
		$opr = $tableTask->insertRow($detail);
	}
	$fwViewData['opr'] = $opr;
}

//Check for Edit Module
$this_id = (int)$fwRequest->getParam('wlai_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table("watch_list_action_items");
	$tableTask->setWhere("wlai_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;
	$fwViewData['title'] = 'Edit Action Item Content';
} else {
	$fwViewData['title'] = 'Add New Action Item Content';
}
