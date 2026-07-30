<?php
$this_id = (int)$fwRequest->getparam('tdt_id', 0);
$tdt_dt_id = (int)$fwRequest->getparam('tdt_dt_id', 0);
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('task_designer_tracker');
		$thisTable->setWhere("tdt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "designer_tracker.view_task/dt_id/".$tdt_dt_id);