<?php
$this_id = (int)$fwRequest->getparam('elsn_id', 0);
$wa_id = (int)$fwRequest->getparam('wa_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('warranty_log_escalation_notes');
	$thisTable->setWhere("elsn_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "warranty_escalation_report.view_esc_notes/wa_id/" . $wa_id);
