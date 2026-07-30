<?php

$fwViewData['primary_id'] = $primary_id = $ACTION_ID;
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ACTION_TABLE);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . ".view_status");
