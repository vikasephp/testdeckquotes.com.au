<?php
$this_id = (int)$fwRequest->getparam('prdn_id', 0);
if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table('proposal_report_doc_name');
	$thisTable->setWhere("prdn_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL . "proposal_report.view_doc_admin");