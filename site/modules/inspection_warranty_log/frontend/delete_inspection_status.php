<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['status']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['status']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	// $thisTable->deleteRow();
	$thisTable->updateRow([
		'wlis_active' => 0,
	]);
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['status']['view_file_name']);
