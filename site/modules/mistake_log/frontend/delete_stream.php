<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['mistake_log_stream']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['mistake_log_stream']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['mistake_log_stream']['view_fle_name']);
