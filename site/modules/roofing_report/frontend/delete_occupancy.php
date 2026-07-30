<?php
$this_id = (int)$fwRequest->getparam('ro_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('roofing_occupancy');
		$thisTable->setWhere("ro_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "roofing_report.view_occupancy");