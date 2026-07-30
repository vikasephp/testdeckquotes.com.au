<?php
$this_id = (int)$fwRequest->getparam('so_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('wip_stage_options');
		$thisTable->setWhere("so_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "work_in_progress_report.view_stage");