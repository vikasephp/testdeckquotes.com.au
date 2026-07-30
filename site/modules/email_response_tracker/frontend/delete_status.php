<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('email_response_status');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "email_response_tracker.view_status");