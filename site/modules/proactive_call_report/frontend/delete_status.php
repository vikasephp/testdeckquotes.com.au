<?php
$this_id = (int)$fwRequest->getparam('pcr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('pcr_status_admin');
		$thisTable->setWhere("pcr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "proactive_call_report.view_status");