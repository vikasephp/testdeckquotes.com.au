<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['post_settlement_task_list']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['post_settlement_task_list']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['post_settlement_task_list']['view_fle_name']);
