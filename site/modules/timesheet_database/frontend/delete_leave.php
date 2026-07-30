<?php
$this_id = (int)$fwRequest->getparam('tl_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('timesheet_leave');
		$thisTable->setWhere("tl_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "timesheet_database.view_leave");