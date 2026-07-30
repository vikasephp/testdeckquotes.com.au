<?php
$this_id = (int)$fwRequest->getparam('plir_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);
if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table("prospect_list_invoices_report");
	$thisTable->setWhere("plir_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL .'prospect_list.view_checklist/bsn_id/'.$bsn_id);