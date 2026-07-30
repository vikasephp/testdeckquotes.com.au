<?php
$this_id = (int)$fwRequest->getparam('wn_id', 0);
$wa_id = (int)$fwRequest->getparam('wa_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('warranty_log_notes');
	$thisTable->setWhere("wn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "warranty_log.view_notes/wa_id/" . $wa_id);
