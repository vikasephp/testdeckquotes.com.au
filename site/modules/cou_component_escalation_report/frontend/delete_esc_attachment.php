<?php
$ccena_id = (int)$fwRequest->getparam('ccena_id', 0);
$ccen_id = (int)$fwRequest->getparam('ccen_id', 0);
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

if ($ccena_id > 0) {
	$sql = "DELETE FROM cou_component_escalation_note_attachments WHERE ccena_id = $ccena_id";
	$fwDb->queryOne($sql);
}

Location(BASE_URL . "cou_component_escalation_report.add_esc_notes/ccen_id/" . $ccen_id . "/bsn_id/" . $bsn_id);
exit;
