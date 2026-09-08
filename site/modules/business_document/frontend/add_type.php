<?php
/*
 * Business Documents - Add / Edit Document Type (admin)
 * Document types are the categories used in the path, e.g. Document, Template.
 */

$fwMainView = 'file:' . getcwd() . '/add_type.tpl';
$typesTable = new Fw_Db_Table($TYPE_TABLE);

/* ---------- Handle add / edit submit ---------- */
$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('type', array());
	$this_id = (int)$detail['utt_id'];
	unset($detail['utt_id']);

	$name = isset($detail['utt_name']) ? trim($detail['utt_name']) : '';
	$slug = isset($detail['utt_slug']) ? trim($detail['utt_slug']) : '';
	/* If no slug was typed, build one from the name automatically */
	if ($slug === '' && $name !== '') {
		$slug = url_table_slug($name);
	} else {
		$slug = url_table_slug($slug);
	}

	$detail['utt_name'] = $name;
	$detail['utt_slug'] = $slug;
	$detail['utt_status'] = isset($detail['utt_status']) ? (int)$detail['utt_status'] : 1;

	if ($name === '' || $slug === '') {
		$fwViewData['error'] = 'Name and slug are required.';
	} else {
		/* Existing id = update, otherwise insert a new type */
		if ($this_id > 0) {
			$typesTable->setWhere('utt_id = ' . $this_id);
			$opr = $typesTable->updateRow($detail);
		} else {
			$detail['utt_created_at'] = date('Y-m-d H:i:s');
			$opr = $typesTable->insertRow($detail);
		}
		$fwViewData['opr'] = $opr;
	}
}

/* ---------- Load a type for editing (when an id is passed) ---------- */
$this_id = (int)$fwRequest->getParam('utt_id', 0);
if ($this_id > 0) {
	$typesTable = new Fw_Db_Table($TYPE_TABLE);
	$typesTable->setWhere('utt_id = ' . $this_id);
	$fwViewData['detail'] = $typesTable->getRow();
	$fwViewData['title'] = 'Edit Document Type';
} else {
	$fwViewData['title'] = 'Add Document Type';
	if (empty($fwViewData['detail'])) {
		$fwViewData['detail'] = array('utt_status' => 1);
	}
}
