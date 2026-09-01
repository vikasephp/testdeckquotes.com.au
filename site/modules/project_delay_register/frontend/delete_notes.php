<?php
$this_id = (int)$fwRequest->getparam('doc_id', 0);
$docqa_id = (int)$fwRequest->getparam('docqa_id', 0);

if ($this_id > 0) {
	$thisTable = new Fw_Db_Table('dual_occupancy_notes');
	$thisTable->setWhere("doc_id = $this_id");
	$thisTable->deleteRow();
}
Location(BASE_URL . "dual_occupancy_canberra_q_and_a.view_notes/docqa_id/" . $docqa_id);
