<?php
$fwMainView = 'file:' . getcwd() . '/add_position_explained.tpl';
$tableTask = new Fw_Db_Table('positions');

$p_id = (int)$fwRequest->getParam('p_id', 0);
$fwViewData['p_id'] = $p_id;

$query = "SELECT * FROM positions where p_id = ".$p_id;
$result = $fwDb->query($query);
$fwViewData['result'] = $result;
//echo "<pre>"; print_r($result); exit();

$submit = $fwRequest->getParam('subAddDetail', '');
if (!empty($submit)) {
	$detail = $fwRequest->getParam('notes', array());
	
	// Extract ID from the form, if editing an existing record
    $this_id = isset($detail['p_id']) ? (int)$detail['p_id'] : 0;
    unset($detail['p_id']); // Remove ID from data before update
	
	$p_name_explained = trim($detail['p_name_explained'] ?? '');
    $detail['p_name_explained'] = $p_name_explained;
	
	if ($this_id > 0) {
		$tableTask->setWhere("p_id = $this_id");
		$opr = $tableTask->updateRow($detail);
	}
	$fwViewData['opr'] = $opr;
}
