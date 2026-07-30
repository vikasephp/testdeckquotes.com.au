<?php

$fwViewData['primary_id'] = $primary_id = 'wlai_id';;
$this_id = (int)$fwRequest->getparam($primary_id, 0);

$wlai_bsn_id = $fwRequest->getParam('wlai_bsn_id', '');
$fwViewData['wlai_bsn_id'] = $wlai_bsn_id;

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table("watch_list_action_items");
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL ."watch_list_report.action_items/wlai_bsn_id/".$wlai_bsn_id);
