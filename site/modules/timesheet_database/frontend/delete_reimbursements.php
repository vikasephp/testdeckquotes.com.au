<?php
$this_id = (int)$fwRequest->getparam('tr_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('timesheet_reimbursements');
		$thisTable->setWhere("tr_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "timesheet_database.view_reimbursements");