<?php
$this_id = (int)$fwRequest->getparam('pst_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('ptt_sub_type');
		$thisTable->setWhere("pst_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "planning_task_tracker.viewtype");