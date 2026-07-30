<?php
$this_id = (int)$fwRequest->getparam('itt_pt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('inclusions_task_tracker_project_type');
		$thisTable->setWhere("itt_pt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "inclusions_task_tracker.view_projecttype");