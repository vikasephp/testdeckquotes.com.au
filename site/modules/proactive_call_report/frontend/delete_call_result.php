<?php
$this_id = (int)$fwRequest->getparam('cr_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('pcr_call_result');
		$thisTable->setWhere("cr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "proactive_call_report.view_call_result");