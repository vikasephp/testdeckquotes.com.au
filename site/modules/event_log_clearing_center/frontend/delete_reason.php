<?php
$this_id = (int)$fwRequest->getparam('elccn_id', 0);
$elccn_row_id = (int)$fwRequest->getparam('elccn_row_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('event_log_clearing_center_notes');
	$thisTable->setWhere("elccn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "event_log_clearing_center.view_reason/elccn_row_id/" . $elccn_row_id);
