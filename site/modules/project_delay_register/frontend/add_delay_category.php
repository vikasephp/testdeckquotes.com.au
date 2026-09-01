<?php
$fwMainView = 'file:' . getcwd() . '/add_delay_category.tpl';

$pdc_id = (int)$fwRequest->getParam('pdc_id', 0);
$fwViewData['pdc_id'] = $pdc_id;
$fwViewData['title'] = ($pdc_id > 0) ? 'Edit Delay Category' : 'Add Delay Category';
$fwViewData['opr'] = '';
$fwViewData['error'] = '';

$save = $fwRequest->getParam('subSave', '');
if (!empty($save)) {
	$post = $fwRequest->getParam('pdc', array());
	$pdc_id = isset($post['pdc_id']) ? (int)$post['pdc_id'] : $pdc_id;
	$categoryName = isset($post['pdc_category_name']) ? trim($post['pdc_category_name']) : '';
	$letterCode = isset($post['pdc_letter_code']) ? trim($post['pdc_letter_code']) : '';

	if ($categoryName !== '' && $letterCode !== '') {
		$catTable = new Fw_Db_Table('project_delay_category');
		$data = array(
			'pdc_category_name' => $categoryName,
			'pdc_letter_code' => $letterCode
		);
		if ($pdc_id > 0) {
			$catTable->setWhere('pdc_id = ' . $pdc_id);
			$catTable->updateRow($data);
			// Keep saved history letter codes in sync with category edit.
			$fwDb->queryOne("UPDATE project_delay_history
				SET pdh_letter_code = '" . addslashes($letterCode) . "'
				WHERE pdh_pdc_id = " . $pdc_id);
		} else {
			$catTable->insertRow($data);
		}
		$fwViewData['opr'] = 1;
		$fwViewData['pdc_id'] = $pdc_id;
	} else {
		$fwViewData['error'] = 'Please enter Category name and Letter code.';
		$fwViewData['detail'] = array(
			'pdc_category_name' => $categoryName,
			'pdc_letter_code' => $letterCode
		);
		$fwViewData['pdc_id'] = $pdc_id;
	}
}

if (empty($fwViewData['detail'])) {
	$detail = array(
		'pdc_category_name' => '',
		'pdc_letter_code' => ''
	);
	if ($pdc_id > 0) {
		$row = $fwDb->queryOne("SELECT * FROM project_delay_category WHERE pdc_id = " . $pdc_id);
		if (!empty($row) && is_array($row)) {
			$detail['pdc_category_name'] = isset($row['pdc_category_name']) ? trim($row['pdc_category_name']) : '';
			$detail['pdc_letter_code'] = isset($row['pdc_letter_code']) ? trim($row['pdc_letter_code']) : '';
		}
	}
	$fwViewData['detail'] = $detail;
}

$selectedLetter = isset($fwViewData['detail']['pdc_letter_code'])
	? trim((string)$fwViewData['detail']['pdc_letter_code'])
	: '';
$fwViewData['selected_letter_code'] = $selectedLetter;
$fwViewData['selected_letter_code_js'] = json_encode($selectedLetter);

$tablecode = new Fw_Db_Table('letter_code');
$codedata = $tablecode->getRows();
if (!is_array($codedata)) {
	$codedata = array();
}

// Mark selected option in PHP so Smarty string match issues cannot break edit prefills.
foreach ($codedata as $k => $item) {
	$lc = isset($item['lc_letter_code']) ? trim((string)$item['lc_letter_code']) : '';
	$codedata[$k]['lc_letter_code'] = $lc;
	$codedata[$k]['is_selected'] = ($selectedLetter !== '' && $lc === $selectedLetter) ? 1 : 0;
}
$fwViewData['codedata'] = $codedata;
