<?php
$this_id = (int)$fwRequest->getparam('ct_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('phone_log_call_types');
		$thisTable->setWhere("ct_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "phone_log.view_type");