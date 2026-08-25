<?php
$fwMainView = 'file:' . getcwd() . '/add_esc_notes.tpl';
$tableTask = new Fw_Db_Table('cou_component_escalation_notes');
$attachTable = new Fw_Db_Table('cou_component_escalation_note_attachments');

$bsn_id = (int)$fwRequest->getParam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

$user = $_SESSION['user']['user_id'];
$submit = $fwRequest->getParam('subAddDetail', '');

function save_escalation_uploads($attachTable, $ccen_id, $field, $type)
{
	if (empty($_FILES[$field]['name'])) {
		return;
	}
	$names = $_FILES[$field]['name'];
	$tmps = $_FILES[$field]['tmp_name'];
	if (!is_array($names)) {
		$names = array($names);
		$tmps = array($tmps);
	}
	foreach ($names as $i => $orig) {
		if (empty($orig)) {
			continue;
		}
		$file_1 = preg_replace('/[^A-Z0-9._]/i', '_', $orig);
		$file_1 = time() . '_' . $i . '_' . $file_1;
		upload($file_1, $tmps[$i]);
		$attachTable->insertRow(array(
			'ccena_ccen_id' => $ccen_id,
			'ccena_type' => $type,
			'ccena_file_name' => $file_1,
		));
	}
}

if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	$this_id = (int)$detail['ccen_id'];
	unset($detail['ccen_id']);

	$detail['ccen_bsn_id'] = $bsn_id;
	$detail['ccen_created_by'] = $user;

	if ($this_id > 0) {
		unset($detail['ccen_id']);
		unset($detail['ccen_created_by']);
		$tableTask->setWhere("ccen_id = $this_id");
		$opr = $tableTask->updateRow($detail);
		$ccen_id = $this_id;
	} else {
		$opr = $tableTask->insertRow($detail);
		$ccen_id = $opr;
		if (!$ccen_id) {
			$last = $fwDb->queryOne("SELECT MAX(ccen_id) AS id FROM cou_component_escalation_notes WHERE ccen_bsn_id = $bsn_id AND ccen_created_by = $user");
			$ccen_id = (int)$last['id'];
		}
	}

	if ($ccen_id > 0) {
		save_escalation_uploads($attachTable, $ccen_id, 'ccena_images', 'image');
		save_escalation_uploads($attachTable, $ccen_id, 'ccena_files', 'file');
	}

	$fwViewData['opr'] = $opr;
}

$this_id = (int)$fwRequest->getParam('ccen_id', 0);
if ($this_id > 0) {
	$tableTask = new Fw_Db_Table('cou_component_escalation_notes');
	$tableTask->setWhere("ccen_id = $this_id");
	$detail = $tableTask->getRow();
	$fwViewData['detail'] = $detail;

	$attSql = "SELECT * FROM cou_component_escalation_note_attachments WHERE ccena_ccen_id = $this_id ORDER BY ccena_id ASC";
	$fwViewData['attachments'] = $fwDb->query($attSql);
	$fwViewData['title'] = 'Edit Escalation Notes';
} else {
	$fwViewData['title'] = 'Add Escalation Notes';
	$fwViewData['attachments'] = array();
}
