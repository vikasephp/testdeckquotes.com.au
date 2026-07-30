<?php

$fwViewData['primary_id'] = $primary_id = $ATTRIBUTES[0]['id'];
$this_id = (int)$fwRequest->getparam($primary_id, 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table($ATTRIBUTES[0]['table']);
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location($ATTRIBUTES[0]['view_url']);
