<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['workmanship_defect']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['workmanship_defect']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['workmanship_defect']['view_fle_name']);
