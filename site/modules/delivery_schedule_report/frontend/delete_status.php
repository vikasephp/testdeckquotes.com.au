<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('delivery_schedule_status');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "delivery_schedule_report.view_status");