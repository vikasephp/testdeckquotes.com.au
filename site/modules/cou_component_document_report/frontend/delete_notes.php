<?php
$this_id = (int)$fwRequest->getparam('ccdrn_id', 0);
$bsn_id = $fwRequest->getparam('bsn_id', 0);
$fwViewData['bsn_id'] = $bsn_id;

if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('cou_component_document_report_notes');
	$thisTable->setWhere("ccdrn_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . "cou_component_document_report.view_notes/bsn_id/$bsn_id");