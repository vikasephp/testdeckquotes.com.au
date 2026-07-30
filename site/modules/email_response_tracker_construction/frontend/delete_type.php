<?php
$this_id = (int)$fwRequest->getparam('et_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('email_response_type_cons');
		$thisTable->setWhere("et_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "email_response_tracker_construction.view_type");