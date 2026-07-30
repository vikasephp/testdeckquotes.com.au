<?php
$this_id = (int)$fwRequest->getparam('pa_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('phone_log_actioned_admin');
		$thisTable->setWhere("pa_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "phone_log.view_actioned");