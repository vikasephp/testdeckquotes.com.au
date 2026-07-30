<?php
$this_id = (int)$fwRequest->getparam('cidn_id', 0);
$cidn_ldd_id = (int)$fwRequest->getparam('cidn_ldd_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('construction_invoice_disputes_notes');
	$thisTable->setWhere("cidn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . $BASEFOLDER . ".view_notes/ldd_id/" . $cidn_ldd_id);
