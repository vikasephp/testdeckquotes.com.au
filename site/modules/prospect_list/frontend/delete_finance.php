<?php
$this_id = (int)$fwRequest->getparam('plfr_id', 0);
$bsn_id = (int)$fwRequest->getparam('bsn_id', 0);
if ($this_id > 0)
{
	$thisTable = new Fw_Db_Table("prospect_list_financial_report");
	$thisTable->setWhere("plfr_id = $this_id");
	$thisTable->deleteRow();
	
}
Location(BASE_URL .'prospect_list.view_checklist/bsn_id/'.$bsn_id);