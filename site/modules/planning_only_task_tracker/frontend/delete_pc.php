<?php
$this_id = (int)$fwRequest->getparam('pc_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('ptt_plans_changed');
		$thisTable->setWhere("pc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "planning_only_task_tracker.view_pc");