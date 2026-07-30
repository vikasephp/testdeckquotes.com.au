<?php
$this_id = (int)$fwRequest->getparam('tc_id', 0);
$tc_task_id = (int)$fwRequest->getParam('tc_task_id', 0);
$tdt_dt_id = $fwRequest->getParam('tdt_dt_id', '');
	if ($this_id > 0)
	{
		$thisTable = new Fw_Db_Table('task_comment');
		$thisTable->setWhere("tc_id = $this_id");
		$thisTable->deleteRow();
		
	}
Location(BASE_URL . "designer_tracker.view_comment/tc_task_id/".$tc_task_id."/tdt_dt_id/".$tdt_dt_id);