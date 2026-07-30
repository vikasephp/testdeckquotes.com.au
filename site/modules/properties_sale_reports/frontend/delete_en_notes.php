<?php
$this_id = (int)$fwRequest->getparam('psren_id', 0);
$psre_id = (int)$fwRequest->getparam('psre_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('psr_enquiry_notes');
	$thisTable->setWhere("psren_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "properties_sale_reports.view_en_notes/psre_id/" . $psre_id);
