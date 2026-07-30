<?php
$this_id = (int)$fwRequest->getparam('cp_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('cip_type');
		$thisTable->setWhere("cp_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "construction_in_progress_report.view_type");