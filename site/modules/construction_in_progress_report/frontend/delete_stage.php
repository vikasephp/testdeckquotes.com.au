<?php
$this_id = (int)$fwRequest->getparam('st_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('stage');
		$thisTable->setWhere("st_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_in_progress_report.view_stage");