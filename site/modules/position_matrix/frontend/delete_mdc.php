<?php

$fwViewData['primary_id'] = $primary_id = 'pmmd_id';;
$this_id = (int)$fwRequest->getparam($primary_id, 0);

$pm_id = $fwRequest->getParam('pm_id', '');
$fwViewData['pm_id'] = $pm_id;

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table("position_matrix_multiple_docs");
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL ."position_matrix.multiple_doc_col/pm_id/".$pm_id);
