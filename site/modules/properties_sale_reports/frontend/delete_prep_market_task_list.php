<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['prep_market_task_list']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['prep_market_task_list']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['prep_market_task_list']['view_fle_name']);
