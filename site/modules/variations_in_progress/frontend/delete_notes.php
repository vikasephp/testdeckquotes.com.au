<?php
$this_id = (int)$fwRequest->getparam('vipn_id', 0);
$vipn_va_id = (int)$fwRequest->getparam('vipn_va_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('variations_in_progress_notes');
	$thisTable->setWhere("vipn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . $BASEFOLDER . ".view_notes/vipn_va_id/" . $vipn_va_id);
