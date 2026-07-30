<?php

$fwViewData['primary_id'] = $primary_id = 'qmr_qa_id';;
$this_id = (int)$fwRequest->getparam($primary_id, 0);

$qm_id = $fwRequest->getParam('qm_id', '');
$fwViewData['qm_id'] = $qm_id;

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table("quote_management_report_qa");
	$thisTable->setWhere("$primary_id = $this_id");
	$thisTable->deleteRow();
}

Location(BASE_URL ."quote_management_report.view_qmr_qa/qm_id/".$qm_id);
