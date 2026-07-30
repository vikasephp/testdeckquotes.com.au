<?php
$this_id = (int)$fwRequest->getparam('mp_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('mistake_log_priority');
		$thisTable->setWhere("mp_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "mistake_log.view_priority");