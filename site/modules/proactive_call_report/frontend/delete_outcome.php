<?php
$this_id = (int)$fwRequest->getparam('oc_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('proactive_outcome');
		$thisTable->setWhere("oc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "proactive_call_report.view_outcome");