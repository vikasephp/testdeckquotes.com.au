<?php
$this_id = (int)$fwRequest->getparam('ccen_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);

if ($this_id > 0) {
	$attachTable = new Fw_Db_Table('cou_component_escalation_note_attachments');
	$attachTable->setWhere("ccena_ccen_id = $this_id");
	$attachTable->deleteRow();

	$thisTable = new Fw_Db_Table('cou_component_escalation_notes');
	$thisTable->setWhere("ccen_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "cou_component_escalation_report.view_esc_notes/bsn_id/" . $bsn_id);
