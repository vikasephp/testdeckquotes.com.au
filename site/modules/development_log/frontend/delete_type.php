<?php
$this_id = (int)$fwRequest->getparam('dlt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('development_log_type');
		$thisTable->setWhere("dlt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "development_log.view_type");