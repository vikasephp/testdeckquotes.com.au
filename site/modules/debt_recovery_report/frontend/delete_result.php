<?php
$this_id = (int)$fwRequest->getparam('cr_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('debt_recovery_call_result');
		$thisTable->setWhere("cr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "debt_recovery_report.view_result");