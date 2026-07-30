<?php
$this_id = (int)$fwRequest->getparam('lt_id', 0);

	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('letter_text_planning');
		$thisTable->setWhere("lt_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "planning_only_task_tracker.viewletter");