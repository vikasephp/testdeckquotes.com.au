<?php
$fwMainView = 'file:' . getcwd() . '/view_esc_notes.tpl';
$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);

$sql = "SELECT cou_component_escalation_notes.*, users.user_name
	FROM cou_component_escalation_notes
	LEFT JOIN users ON cou_component_escalation_notes.ccen_created_by = users.user_id
	WHERE cou_component_escalation_notes.ccen_bsn_id = " . $bsn_id . "
	ORDER BY cou_component_escalation_notes.ccen_created_at DESC";
$data = $fwDb->query($sql);

foreach ($data as $k => $row) {
	$attSql = "SELECT * FROM cou_component_escalation_note_attachments WHERE ccena_ccen_id = " . (int)$row['ccen_id'] . " ORDER BY ccena_id ASC";
	$data[$k]['attachments'] = $fwDb->query($attSql);
}

$fwViewData['bsn_id'] = $bsn_id;
$fwViewData['data'] = $data;
