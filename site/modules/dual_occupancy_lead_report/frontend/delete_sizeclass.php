<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES['size_class']['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES['size_class']['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL . $BASEFOLDER . '.' . $ATTRIBUTES['size_class']['view_file_name']);
